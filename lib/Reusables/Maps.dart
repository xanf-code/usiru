import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:show_up_animation/show_up_animation.dart';

class Map extends StatelessWidget {
  final String Urlone;
  final String Urltwo;
  const Map({
    Key key, this.Urlone, this.Urltwo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: ShowUpAnimation(
        direction: Direction.vertical,
        animationDuration: Duration(milliseconds: 1000),
        offset: 0.2,
        child: Container(
          height: 300,
          child: FlutterMap(
            options: new MapOptions(
              interactive: true,
              center: LatLng(12.9716, 77.5946),
              zoom: 11.0,
            ),
            layers: [
              TileLayerOptions(
                  opacity: 1,
                  urlTemplate:
                  this.Urlone,
                  subdomains: ['a', 'b', 'c']),
              TileLayerOptions(
                  opacity: 0.5,
                  urlTemplate:
                  this.Urltwo,
                  subdomains: ['a', 'b', 'c']),
            ],
          ),
        ),
      ),
    );
  }
}