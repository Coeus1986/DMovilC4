import 'package:projectc4/models/sitiofavorito.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Boxes{
  static Box<SitioFavorito>getfavoritobox()=>Hive.box<SitioFavorito>('bd');
}