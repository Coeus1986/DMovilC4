import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:projectc4/repository/registrousuariofirebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projectc4/pages/login_page.dart';
import 'package:projectc4/models/usuario.dart';
import 'package:projectc4/pages/register_page.dart';

class RegisterBDUser extends StatefulWidget {
  final iduser;
  const RegisterBDUser(this.iduser, {Key? key}) : super(key: key);

  @override
  State<RegisterBDUser> createState() => _RegisterBDUserState();
}

class _RegisterBDUserState extends State<RegisterBDUser> {
  RegistroUsuarioFirebase objufb = RegistroUsuarioFirebase();
  final _nombre=TextEditingController();
  final _apellido=TextEditingController();
  final _correo=TextEditingController();
  final _celular=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Actualizar Datos"),
    ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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


                  TextField(
                    controller: _nombre,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle),
                      hintText: "Nombre",
                    ),
                  ),
                  TextField(
                    controller: _apellido,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle),
                      hintText: "Apellido",
                    ),
                  ),
                  TextField(
                    controller: _celular,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      hintText: "E-mail",
                    ),
                  ),


                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: ()async{
                        final idusuario=widget.iduser;
                        var usuario=Usuario(idusuario,_nombre.text,_apellido.text,_celular.text);
                        // _registrarUsuario(usuario);
                        var resultado=await objufb.crearUsuario(usuario);

                        Fluttertoast.showToast(msg: "Datos guardados",toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.CENTER);
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginPage()));

                      },
                      child: Text("Registrate"),
                    ),
                  )
                ],
              ),
            ),
          ),


        )

    );
  }
}
