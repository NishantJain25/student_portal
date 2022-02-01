import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OpenMap extends StatefulWidget {
  OpenMap({required this.fullscreen});
  final bool fullscreen;
  @override
  State<OpenMap> createState() => OpenMapState();
}

class OpenMapState extends State<OpenMap> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _location = CameraPosition(
    target: LatLng(19.208390, 72.832020),
    zoom: 16,
  );

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      scrollGesturesEnabled: widget.fullscreen,
      mapType: MapType.normal,
      initialCameraPosition: _location,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      markers: {
        Marker(
            markerId: MarkerId('My location'),
            position: LatLng(19.208390, 72.832020),
            infoWindow: InfoWindow(
              title: 'RNA Royale Park',
            )),
        Marker(
            markerId: MarkerId('College'),
            position: LatLng(19.10995984655063, 72.83752872138852),
            infoWindow: InfoWindow(
                title: 'MPSTME',
                snippet:
                    'Bhakthi Vendanth Swami Marg, Near Cooper Hospital, JVPD Scheme, Vile Parle West, Mumbai, Maharashtra 400056')),
        Marker(
            markerId: MarkerId('Main building'),
            position: LatLng(19.103284396494757, 72.83642509323505),
            infoWindow: InfoWindow(
                title: 'NMIMS (SBM)',
                snippet:
                    'V. L, Pherozeshah Mehta Rd, Vile Parle West, Mumbai, Maharashtra 400056')),
      },
      circles: {
        Circle(
            circleId: CircleId('circle1'),
            center: LatLng(19.10995984655063, 72.83752872138852),
            radius: 25,
            fillColor: Colors.lightBlue,
            strokeColor: Colors.blue,
            strokeWidth: 5),
        Circle(
            circleId: CircleId('circle2'),
            center: LatLng(19.103284396494757, 72.83642509323505),
            radius: 25,
            fillColor: Colors.lightBlue,
            strokeColor: Colors.blue,
            strokeWidth: 5),
      },
    );
  }
}
