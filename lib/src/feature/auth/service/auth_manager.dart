import 'package:firebase_auth/firebase_auth.dart';

class AuthManager {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? token;
  Future<String?> signInWithEmailAndPassword(
      String email, String password) async {
    final UserCredential userCredential =
        await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    String? firebaseToken = await userCredential.user!.getIdToken();
    token = firebaseToken;
    return token;
  }

  Future<User?> registerWithEmailAndPassword(
      String email, String password) async {
    final UserCredential userCredential =
        await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
