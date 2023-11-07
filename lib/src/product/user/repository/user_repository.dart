import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quit_mate/src/product/user/model/sober_user.dart';

class UserRepository {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> saveUser(String userId, SoberUser user) async {
    await _userCollection.doc(userId).set(user.toJson());
  }

  Future<SoberUser?> getUser(String userId) async {
    try {
      DocumentSnapshot snapshot = await _userCollection.doc(userId).get();
      if (snapshot.exists) {
        final Map<String, dynamic> data =
            snapshot.data() as Map<String, dynamic>;
        return SoberUser.fromJson(data);
      }
      return null;
    } catch (e) {
      print("getUser Error: $e");
      return null;
    }
  }
}