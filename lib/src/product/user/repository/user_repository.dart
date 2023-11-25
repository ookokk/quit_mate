import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quit_mate/src/core/cache/cache_manager/cache_manager.dart';
import 'package:quit_mate/src/product/user/model/sober_user.dart';

class UserRepository {
  final SoberUser soberUser = SoberUser();

  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');
  String userId = "";

  Future<void> getUserId() async {
    userId = await CacheManager.getString('userId') ?? '';
  }

  Future<void> saveUser(SoberUser user, String userID) async {
    await _userCollection.doc(userID).set(user.toJson());
  }

  Future<SoberUser?> getUser() async {
    await getUserId();
    DocumentSnapshot snapshot = await _userCollection.doc(userId).get();
    if (snapshot.exists) {
      final Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      return SoberUser.fromJson(data);
    }
    return null;
  }
}
