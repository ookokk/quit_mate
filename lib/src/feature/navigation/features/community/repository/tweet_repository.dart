import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quit_mate/src/feature/navigation/features/community/model/tweet.dart';

class TweetRepository {
  final CollectionReference _tweetsCollection =
      FirebaseFirestore.instance.collection('tweets');

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> addTweet(Tweet tweet) async {
    final user = _auth.currentUser;
    if (user != null) {
      tweet.userId = user.uid;
      await _tweetsCollection.add(tweet.toJson());
    } else {
      print('Kullanıcı oturum açmamış.');
    }
  }

  Future<List<Tweet>> getTweets() async {
    final snapshot = await _tweetsCollection.get();
    return snapshot.docs.map((doc) {
      return Tweet.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  }

  Future<void> updateTweet(String documentId, Tweet updatedTweet) async {
    await _tweetsCollection.doc(documentId).update(updatedTweet.toJson());
  }

  Future<void> deleteTweet(String documentId) async {
    await _tweetsCollection.doc(documentId).delete();
  }
}
