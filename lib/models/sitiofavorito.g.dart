// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sitiofavorito.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SitioFavoritoAdapter extends TypeAdapter<SitioFavorito> {
  @override
  final int typeId = 0;

  @override
  SitioFavorito read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SitioFavorito()
      ..sitio = fields[0] as String?
      ..imagen = fields[1] as String?
      ..descripcion = fields[2] as String?
      ..latitud = fields[3] as String?
      ..longitud = fields[4] as String?;
  }

  @override
  void write(BinaryWriter writer, SitioFavorito obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.sitio)
      ..writeByte(1)
      ..write(obj.imagen)
      ..writeByte(2)
      ..write(obj.descripcion)
      ..writeByte(3)
      ..write(obj.latitud)
      ..writeByte(4)
      ..write(obj.longitud);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SitioFavoritoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
