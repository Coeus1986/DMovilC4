import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectc4/pages/detail_page.dart';

import '../models/sitioturistico.dart';

class ListsPage extends StatefulWidget {
  const ListsPage({super.key});

  @override
  State<ListsPage> createState() => _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Lista de Sitios Turisticos"),
        ),

        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("sitioturistico").snapshots(),
                builder: (context, snapshot){
                  if(snapshot.hasError){
                    return Text("Error en la consulta");
                  }
                  if(!snapshot.hasData){
                    return Text("No existen datos");
                  }

                  child:
                  return ListView.builder(
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context,index){
                        QueryDocumentSnapshot sitioturistico=snapshot.data!.docs[index];

                        return Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Card(
                            color: Colors.white,
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 30, top: 30),
                                  child: ListTile(
                                    title: Text(sitioturistico['lugar']),
                                    subtitle: Text(sitioturistico['resumen']),
                                    leading: Image.network(
                                        sitioturistico['imagen']
                                    ),
                                    onTap: (){
                                      //SitioTuristico sitioturistico=SitioTuristico(sitioturistico["lugar"], sitioturistico["apellido"], sitioturistico["correo"], sitioturistico["celular"], sitioturistico["imagen"], sitioturistico["descripcion"]);
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage()));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                  );
                }
            )
        ),
      ),
    );
  }
}