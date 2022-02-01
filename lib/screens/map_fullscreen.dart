import 'package:flutter/material.dart';
import 'map.dart';

class FullscreenMap extends StatelessWidget {
  const FullscreenMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('RNA Royale Park'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: OpenMap(fullscreen: true));
  }
}
