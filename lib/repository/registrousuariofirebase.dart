import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projectc4/models/usuario.dart';

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

  Future <String> crearUsuario(Usuario usuario) async  {
    try{
      final documento=await FirebaseFirestore.instance.collection("usuario").doc(usuario.id).set(usuario.convertir());
      return usuario.id;
    }on FirebaseException catch(e){
      return  e.code;
    }
  }

}