import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:projectc4/models/sitiofavorito.dart';
import  'package:projectc4/Boxes.dart';
import 'package:projectc4/models/sitiosturisticos.dart';
import 'package:projectc4/pages/detail_page.dart';

class ListaFavoritos extends StatefulWidget {
  const ListaFavoritos({Key? key}) : super(key: key);

  @override
  State<ListaFavoritos> createState() => _ListaFavoritosState();
}

class _ListaFavoritosState extends State<ListaFavoritos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sitios favoritos"),
      ),
      body: _builListView(),
      bottomSheet: Text('This is a bottom sheet'),

    );

  }
  Widget _builListView(){
    return ValueListenableBuilder<Box<SitioFavorito>>(
      valueListenable: Boxes.getfavoritobox().listenable(),
    builder:(context,box,_){
        final sitioBox =box.values.toList().cast<SitioFavorito>();
        return ListView.builder(
            itemCount: sitioBox.length,
            itemBuilder:(BuildContext context, i) {
              final pass = sitioBox[i];

              return Container(
                margin: EdgeInsets.only(top: 20),
                child: Card(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 30, top: 30),
                        child: ListTile(
                          title: Text(pass.sitio ?? ""),
                          subtitle: Text(pass.descripcion ?? ""),
                          leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "pass.imagen")
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
        );

      }
    );
  }
}

