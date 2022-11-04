import 'package:flutter/material.dart';
//import 'package:projectc4/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final user = TextEditingController();
  final password = TextEditingController();
  final password2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conocer.com"),
      ),
      body: Center(
        child: Container(
            child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/Logo.png"))),
            ),
            Container(
                padding: const EdgeInsets.only(top: 20.0),
                child: TextField(
                  controller: user,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.mail_rounded),
                    hintText: "Correo electrónico",
                  ),
                )),
            Container(
                child: TextField(
              obscureText: true,
              controller: password,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.key), hintText: "Contraseña"),
            )),
            Container(
                child: TextField(
              obscureText: true,
              controller: password2,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.key), hintText: "Repetir Contraseña"),
            )),
            Container(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Registrate'),
              ),
            ),
            Container(
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.white10),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancelar'),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
