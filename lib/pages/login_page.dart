import 'package:flutter/material.dart';
//import 'package:projectc4/pages/detail_page.dart';
import 'package:projectc4/pages/list_page.dart';
import 'package:projectc4/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final user = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conocer.com"),
      ),
      body: Center(
        child: Container(
            width: 300,
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
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ListsPage()));
                    },
                    child: const Text('Iniciar Sesión'),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.white10),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()));
                    },
                    child: const Text('Registrate'),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

Widget botonInicio() {
  return ElevatedButton(
    style: TextButton.styleFrom(
      backgroundColor: Colors.black,
    ),
    onPressed: () {
      print("Clic en boton Ingresar");
    },
    child: const Text(
      "Inicio",
      style: TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
    ),
  );
}

Widget botonRegistro() {
  return ElevatedButton(
    style: TextButton.styleFrom(
      backgroundColor: Colors.black,
    ),
    onPressed: () {
      print("Clic en boton Ingresar");
    },
    child: const Text(
      "Registrate",
      style: TextStyle(
        fontSize: 12,
      ),
    ),
  );
}
