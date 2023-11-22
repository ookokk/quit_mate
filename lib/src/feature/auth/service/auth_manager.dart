import 'package:firebase_auth/firebase_auth.dart';
import 'package:quit_mate/src/product/user/model/sober_user.dart';
import 'package:quit_mate/src/product/user/repository/user_repository.dart';

class AuthManager {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? token;
  final SoberUser soberUser = SoberUser();

  Future<String?> signIn(String email, String password) async {
    final UserCredential userCredential =
        await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    String? firebaseToken = await userCredential.user!.getIdToken();
    token = firebaseToken;
    return token;
  }

  Future<User?> register(String email, String password) async {
    final UserCredential userCredential =
        await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  Future<void> signOut() async {
    await _auth.signOut();
    token = null;
  }

  String? getCurrentUserId() {
    User? currentUser = _auth.currentUser;
    return currentUser?.uid;
  }

  void setCurrentUserId() {
    soberUser.userId = _auth.currentUser!.uid;
    UserRepository().userId = _auth.currentUser!.uid;
  }
}
