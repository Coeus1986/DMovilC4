import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projectc4/models/geo.dart';

class Geolocalizacion extends StatefulWidget {
  final DatosGeolocalizacion dg;
  const Geolocalizacion(this.dg,{Key? key}) : super(key: key);

  @override
  State<Geolocalizacion> createState() => _GeolocalizacionState();
}

class _GeolocalizacionState extends State<Geolocalizacion> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Ubicación"),
        ),
        body:GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(widget.dg.longitud,widget.dg.latitud),
            zoom:16,


          ),
          markers: _marcador()
        ) ,
      ),

    );
  }

  Set<Marker> _marcador(){
    var mar=Set<Marker>();
    mar.add(Marker(
        markerId:MarkerId(widget.dg.direccion),
        position:LatLng(widget.dg.latitud, widget.dg.longitud),
      icon:BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
      infoWindow:InfoWindow(
        title: widget.dg.direccion,
      )
    ),
    );
    return mar;


  }
}
