import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projectc4/models/sitiofavorito.dart';
import 'package:projectc4/pages/list_page.dart';
import 'package:projectc4/pages/lista_favoritos.dart';
import 'package:projectc4/pages/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
enum Menu{logOut}
class _HomePageState extends State<HomePage> {
  var currentPage = 0;
  late List<Widget> pages;

  @override
  void initState(){
    _loadPages();
    super.initState();
  }

  void _loadPages(){
    pages = [];
    pages.add(ListsPage());
    pages.add(ListaFavoritos());
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Scaffold(
      /*appBar: AppBar(
        title: const Text("conocer.com"),
        actions: [
          PopupMenuButton(
            onSelected: (Menu item){
              setState(() {
                if(item==Menu.logOut){
                  FirebaseAuth.instance.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                }
              });
            },
            itemBuilder: (BuildContext context)=><PopupMenuEntry<Menu>>[
              PopupMenuItem(value: Menu.logOut,
                child: Text("Cerrar Sesión"),
              )
            ],
          )
        ],
      ),*/
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (pages){
          _onItemTapped(pages);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.mapLocation, size: 20),
          label: "Sitios Turisticos"),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.heart, size: 20),
              label: "Mis Favoritos"),
        ],
      ),
    )
    );
  }
  void _onItemTapped(int page){
    setState(() {
      currentPage = page;
    }
    );
  }
}
