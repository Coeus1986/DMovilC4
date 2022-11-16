import 'package:flutter/material.dart';

class RegisterBDUser extends StatefulWidget {
  final iduser;
  const RegisterBDUser(this.iduser, {Key? key}) : super(key: key);

  @override
  State<RegisterBDUser> createState() => _RegisterBDUserState();
}

class _RegisterBDUserState extends State<RegisterBDUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Actualizar Datos"),
    ),
    body: Container(),

    );
  }
}
