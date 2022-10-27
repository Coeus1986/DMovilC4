import 'dart:html';

import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final user=TextEditingController();
  final password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        child: ListView(
          children: [

            Container(
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
            )
          ],
        )
      ),
    );
  }
}
