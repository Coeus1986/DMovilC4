import 'package:flutter/material.dart';
import 'package:projectc4/pages/detail_page.dart';
import 'package:projectc4/pages/list_page.dart';
import 'package:projectc4/pages/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  final user=TextEditingController();
  final password=TextEditingController();
  String usu="";
  String cla="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Conocer.com"),
        ),
        body: Center(
          child: Container(
              width: 300,
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
                          hintText: "Usuario",
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
                    child:  ElevatedButton(
                      onPressed: async () {
                        usu=user.text;
                        cla=password.text;
                        try{
                          final datos=await firebaseAuth.signInWithEmailAndPassword(
                              email: usu, password: cla);
                          print(datos);
                          if(datos!=null){
                            //print(usu);
                            var k=(FirebaseAuth.instance.currentUser?.uid);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ListsPage())
                            );
                          }
                        }catch(e){
                          Fluttertoast.showToast(msg:"Datos no se encontraron",toastLength:Toast.LENGTH_LONG,gravity:ToastGravity.TOP_LEFT);
                        }
                      },
                      child: const Text('Iniciar Sesión'),
                    ),
                  ),
                  Container(
                    child:  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.white10),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage())
                        );
                      },
                      child: const Text('Registrate'),
                    ),
                  )

                ],
              )
          ),
        ),
    );

  }
}


Widget botonInicio(){
  return ElevatedButton(
    style: TextButton.styleFrom(
      backgroundColor: Colors.black,
    ),
    onPressed:(){
      print("Clic en boton Ingresar");
    },
    child: Text("Inicio",
      style: TextStyle(
        fontSize: 12,
        color:Colors.white,
      ),
    ),
  );
}

Widget botonRegistro(){
  return ElevatedButton(
    style: TextButton.styleFrom(
      backgroundColor: Colors.black,
    ),
    onPressed:(){
      print("Clic en boton Ingresar");
    },
    child: Text("Registrate",
      style: TextStyle(
        fontSize: 12,
      ),
    ),
  );
}

