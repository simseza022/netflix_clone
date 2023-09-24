import 'package:firebase_auth/firebase_auth.dart';

class Auth{
  Future<dynamic> registerUser(String email, String pass) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      print(e);
    }
  }
  Future<void>  signOutUser() async {
      await FirebaseAuth.instance.signOut();
  }
  Future<dynamic> logInUser(String email, String pass) async {
    try {
      final UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );

      return credential;
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      print(e);
    }

  }


}