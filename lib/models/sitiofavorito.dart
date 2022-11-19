import 'package:hive/hive.dart';

part 'sitiofavorito.g.dart';
@HiveType(typeId: 0)
class SitioFavorito extends HiveObject{

  @HiveField(0)
  String?sitio;

  @HiveField(1)
  String?imagen;

  @HiveField(2)
  String?descripcion;

  @HiveField(3)
  String?latitud;

  @HiveField(4)
  String?longitud;

}