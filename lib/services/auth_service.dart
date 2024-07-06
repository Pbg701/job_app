import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  get currentUser => null;

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    User? user = result.user;
    return user;
  }

  // Future<User?> registerWithEmailAndPassword(
  //     String email, String password) async {
  //   UserCredential result = await _auth.createUserWithEmailAndPassword(
  //       email: email, password: password);
  //   User? user = result.user;
  //   return user;
  // }

  // Future<void> signOut() async {
  //   return await _auth.signOut();
  // }
}
