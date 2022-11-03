import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalles del Lugar"),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(5.0),
            child: const Text(
              "Piedra del Peñol",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  fontFamily: "titulo"),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              width: 200,
              height: 200,
              child: Image.asset("assets/images/guatape.png",
                  width: 500, height: 250, fit: BoxFit.fill),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: const [
                    Text(
                      'Ciudad',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Guatapé'),
                  ],
                ),
                Column(
                  children: const [
                    Text(
                      'Departamento',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Antioquia'),
                  ],
                ),
                Column(
                  children: const [
                    Text(
                      'Temperatura',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('26°C'),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: const Text(
                'El peñón de Guatapé, o piedra del Peñol, es un monolito de 220 metros de altura, localizado en el término municipal de Guatapé, Antioquia, Colombia.1​ La piedra de El Peñol es una masa granítica, compuesta por cuarzo, feldespato y mica, fue escalada por primera vez en 16 de julio de 1954 por un habitante de la zona, Luis Eduardo Villegas López. Actualmente se puede acceder a su cumbre subiendo los 715 escalones construidos en el monolito.'),
          ),
        ],
      ),
    );
  }
}
