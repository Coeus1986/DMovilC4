import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projectc4/pages/registerbduser.dart';
import 'package:projectc4/pages/login_page.dart';

import '../repository/registrousuariofirebase.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegistroUsuarioFirebase objetorufb=RegistroUsuarioFirebase();
  final user=TextEditingController();
  final password=TextEditingController();
  final password2=TextEditingController();
  String usu="";
  String cla="";
  void registrarUsuario()async{
    if( "${user.text}"== "" || "${password.text}"== "" || "${password2.text}"== ""){
      Fluttertoast.showToast(msg: "Faltan campos por diligenciar",toastLength: Toast.LENGTH_SHORT,gravity:ToastGravity.CENTER);
    }
    else if(password.value == password2.value){
      usu=user.text;
      cla=password.text;
      final datos=await objetorufb.registrarusuarios(usu, cla);
      if(datos=="weak-password"){
        Fluttertoast.showToast(msg: "La contraseña debe tener minimo 6 caracteres",toastLength: Toast.LENGTH_SHORT,gravity:ToastGravity.CENTER);
      }
      else if(datos=="email-already-in-use"){
        Fluttertoast.showToast(msg: "El email ya existe",toastLength: Toast.LENGTH_SHORT,gravity:ToastGravity.CENTER);
      }
      else if(datos=="invalid-email"){
        Fluttertoast.showToast(msg: "El email no es valido",toastLength: Toast.LENGTH_SHORT,gravity:ToastGravity.CENTER);
      }
      else if(datos=="network-request-failed"){
        Fluttertoast.showToast(msg: "No hay conexión",toastLength: Toast.LENGTH_SHORT,gravity:ToastGravity.CENTER);
      }
      else if(datos=="user-not-found"){
        Fluttertoast.showToast(msg: "El usuario no existe",toastLength: Toast.LENGTH_SHORT,gravity:ToastGravity.CENTER);
      }
      else{
        var pk=datos;
        print('Datos de la PK${pk}');
        Fluttertoast.showToast(msg: "Datos registrados",toastLength: Toast.LENGTH_SHORT,gravity:ToastGravity.CENTER);
        //De momento redireccionamiento a login page
        Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterBDUser(pk)));
        //Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
      }
      print(datos);
    }else{
      Fluttertoast.showToast(msg: "Las contraseñas no coinciden",toastLength: Toast.LENGTH_SHORT,gravity:ToastGravity.CENTER);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conocer.com"),
      ),
      body: Center(
        child: Container(
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            Container(

              width: 200,
              height: 200,
              decoration:BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/Logo.png")
                  )
              ),
            ),

            Container(
                padding: EdgeInsets.only(top: 20.0),
                child:TextField(
                  controller: user,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle),
                    hintText: "E-mail",
                  ),
                )
            ),
            Container(
                child: TextField(
                  obscureText: true,
                  controller: password,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.key),
                      hintText: "Contraseña"
                  ),
                )
            ),
            Container(
                child: TextField(
                  obscureText: true,
                  controller: password2,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.key),
                      hintText: "Repetir Contraseña"
                  ),
                )
            ),
            Container(
              child:  ElevatedButton(
                onPressed: () {
                  registrarUsuario();
                },
                child: const Text('Registrate'),
              ),
            ),
            /*Container(
              child:  ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.white10),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancelar'),
              ),
            ),*/
          ],
        )
       ),
      ),
    );

  }
}


