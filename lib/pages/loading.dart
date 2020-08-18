import 'dart:async';

import 'package:com/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  final ms = const Duration(milliseconds: 20);

  startTimeout([int milliseconds]) {
    var duration = ms * milliseconds;
    return new Timer(duration, handleTimeout);
  }

  void handleTimeout() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }

  _LoadingState() {
    startTimeout(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Align(
              child: LayoutBuilder(builder: (context, _) {
                return SpinKitRotatingCircle(
                  color: Colors.blue,
                  size: 70.0,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
