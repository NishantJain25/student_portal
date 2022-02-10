import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_portal/screens/homepage/home.dart';
import 'package:student_portal/screens/login/loginPage.dart';
import 'package:student_portal/screens/login/signupPage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
  ));
  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Student Portal',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: LoginPage(),
    routes: {
      LoginPage.routeName: (ctx) => LoginPage(),
      SignupPage.routeName: (ctx) => SignupPage(),
      HomePage.routeName: (ctx) => HomePage(),
    },
  ));
}
