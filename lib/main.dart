import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/loading.dart';
import 'pages/location.dart';

void main() {

  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(title: 'Wifi Controller'),
      '/location': (context) => Location(),
    },
//    title: 'Flutter Form Demo',
//    theme: new ThemeData(
//      primarySwatch: Colors.blue,
//    ),
//    home: new Home(title: 'Flutter Form Demo'),
  ),
  );
}