import 'package:firebase_auth/firebase_auth.dart';

class AuthManager {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      String? token = await userCredential.user!.getIdToken();

      return token;
    } catch (e) {
      return e.toString();
    }
  }

  Future<User?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Kayıt hatası: $e");
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
