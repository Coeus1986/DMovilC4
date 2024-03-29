import 'package:flutter/material.dart';
import 'package:projectc4/pages/detail_page.dart';

class ListsPage extends StatefulWidget {
  const ListsPage({super.key});

  @override
  State<ListsPage> createState() => _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Sitios Turisticos"),
      ),
      body:ListView(
      children: [
      Container(
        padding: EdgeInsets.all(5.0),
      child: Text("Conoce con nosotros",
      style: TextStyle(
      fontSize: 24,
      fontFamily: "titulo"
      ),

      ),
      ),


        ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage())
                );
              },
              child: ListTile(
                title: Text("Piedra del Peñol"),
                subtitle: Text("Conoce la Piedra del Peñol icono del turismo de Antioquia"),
                leading: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {},
                  child: Container(
                    width: 58,
                    height: 58,
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    alignment: Alignment.center,
                    child: const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/guatape.png"
                      ),
                    ),
                  ),
                ),
            ),

        )

      ],
    ),
    );


  }
}