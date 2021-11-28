import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:geolocator/geolocator.dart';

class MapaLocalizacao extends StatefulWidget {
  final Function onSelecionaLocalizacao;

  const MapaLocalizacao({ 
    Key? key, 
    required this.onSelecionaLocalizacao,
  }) : super(key: key);

  @override
  _MapaLocalizacaoState createState() => _MapaLocalizacaoState();
}

class _MapaLocalizacaoState extends State<MapaLocalizacao> {
  
  List<Marker> markers = [];

  Future<Position?> carregaPosicaoInicial() async {
    try {
      await Geolocator.requestPermission();
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium
      );
    } catch(err) {
      print('Ocorreu um erro ao buscar a posição');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<Position?>(
        future: this.carregaPosicaoInicial(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return FlutterMap(
              options: MapOptions(
                onTap: (posicao, latitudeLongitude) {
                  setState(() {
                    this.widget.onSelecionaLocalizacao(
                      latitudeLongitude.latitude,
                      latitudeLongitude.longitude,
                    );
                    
                    this.markers = [];
                    this.markers.add(
                      Marker(
                        width: 40,
                        height: 40,
                        point: latitudeLongitude,
                        builder: (context) => Image.asset('assets/marcador.png')
                      )
                    );
                  });
                },
                zoom: 13,
                center: latLng.LatLng(
                  snapshot.data!.latitude,
                  snapshot.data!.longitude
                ),
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']
                ),
                MarkerLayerOptions(
                  markers: this.markers
                )
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}