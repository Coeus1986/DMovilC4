import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projectc4/models/sitiosturisticos.dart';
import 'package:projectc4/repository/image_full_screen_wrapper_widget.dart';

class DetailPage extends StatefulWidget {
  final SitiosTuristicos sitiosturisticos;
  const DetailPage(this.sitiosturisticos, {super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {



  @override
  Widget build(BuildContext context) {
    String file = widget.sitiosturisticos.imagen;
    String glatitud = widget.sitiosturisticos.latitud;
    String glongitud = widget.sitiosturisticos.longitud;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalles del Lugar"),
      ),
      body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(widget.sitiosturisticos.lugar,
                textAlign: TextAlign.center,

                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    fontFamily: "titulo"
                ),

              ),
            ),
            Center(

              child: Container(
                padding: EdgeInsets.all(16.0),
                width: 400,
                height: 200,
                child: ImageFullScreenWrapperWidget(
                  child: Image.network(file),
                  dark: true,
                  )
                  
              ),
            ),
              Container(
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'Ciudad',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(widget.sitiosturisticos.ciudad),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Departamento',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(widget.sitiosturisticos.departamento),
                    ],
                  ),
                    Column(
                      children: [
                       Text('Temperatura',
                         style: TextStyle(fontWeight: FontWeight.bold),
                       ),
                        Text(widget.sitiosturisticos.temperatura),
                      ],
                    ),
                  ],
                ),
              ),
            Container(
              padding: EdgeInsets.all(16.0),
              child:Text(widget.sitiosturisticos.descripcion),
            ),

            Container(
              height: 400,
            child:GoogleMap(
                    initialCameraPosition: CameraPosition(
                    target: LatLng(double.parse(glatitud),double.parse(glongitud)),
                    zoom:13
                    ),
                markers: _marcador()
                ),
            ),

        ],
       ),
      );



  }

  Set<Marker> _marcador(){
    String glatitud = widget.sitiosturisticos.latitud;
    String glongitud = widget.sitiosturisticos.longitud;
    var mar=Set<Marker>();
    mar.add(Marker(
        markerId:MarkerId(widget.sitiosturisticos.lugar),
        position:LatLng(double.parse(glatitud),double.parse(glongitud)),
        icon:BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        infoWindow:InfoWindow(
          title: widget.sitiosturisticos.lugar,
        )
    ),
    );
    return mar;
  }

}