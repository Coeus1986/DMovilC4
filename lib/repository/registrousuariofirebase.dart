import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistroUsuarioFirebase {
  Future<String?> registrarusuarios(String email, String password) async {
    try {
      final credenciales = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credenciales.user?.uid;
    } on FirebaseAuthException catch (e) {
      print("firebaseAuthExeption${e.code}");
      return e.code;
    } on FirebaseException catch (e) {
      return e.code;
    }
  }
}