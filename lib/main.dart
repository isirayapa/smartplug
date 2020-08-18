import 'package:flutter/material.dart';

import 'pages/loading.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Plug',
      theme: ThemeData(brightness: Brightness.light),
      home: Loading(),
    );
  }
}
