// ignore_for_file: library_private_types_in_public_api

import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyStatefulWidget());
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  _MyStatefulWidgetState createState() {
    return _MyStatefulWidgetState();
  }
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('contenedores'),
        ),
        body: Center(
          child: Container(
            width: 500,
            height: 500,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                color: Colors.grey, // Color del borde
                width: 2, // Ancho del borde
              ),
              color: Colors.red,
              gradient: const LinearGradient(
                transform: GradientRotation(6),
                colors: [
                  Colors.deepPurple,
                  Colors.blue,
                  Colors.green,
                  Colors.amberAccent,
                  Colors.orangeAccent
                ],
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RowPopIt(),
                RowPopIt(),
                RowPopIt(),
                RowPopIt(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RowPopIt extends StatefulWidget {
  const RowPopIt({super.key});

  @override
  State<StatefulWidget> createState() => _RowPopIt();
}

class _RowPopIt extends State<RowPopIt> {
  @override
  Widget build(BuildContext context) {
    return const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      PopIt(),
      PopIt(),
      PopIt(),
      PopIt(),
    ],
        );
  }
}

class PopIt extends StatefulWidget {
  const PopIt({super.key});

  @override
  State<StatefulWidget> createState() => _PopIt();
}

class _PopIt extends State<PopIt> {
  bool pressed = false;
  BoxDecoration stylePress = const BoxDecoration(
    gradient: RadialGradient(
        center: Alignment.centerRight,
        radius: 1,
        transform: GradientRotation(7),
        colors: [
          Color.fromRGBO(20, 52, 22, 1),
          Color.fromRGBO(43, 92, 46, 1),
          Color.fromRGBO(76, 175, 80, 1),
          Color.fromRGBO(76, 175, 80, 1),
        ]),
    boxShadow: [
      BoxShadow(
        color: Color.fromRGBO(13, 36, 15, 1),
        blurRadius: 10,
        spreadRadius: 4,
        offset: Offset(8, 8),
      ),
    ],
    borderRadius: BorderRadius.all(Radius.circular(100)),
  );

  void _pressPop() {
    pressed = !pressed;
    setState(() {
      if (pressed) {
        stylePress = const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.centerRight,
            radius: 0.8,
            transform: GradientRotation(7),
            colors: [
              Color.fromRGBO(76, 175, 80, 1),
              Color.fromRGBO(76, 175, 80, 1),
              Color.fromRGBO(43, 92, 46, 1),
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(100)),
        );
      } else {
        stylePress = const BoxDecoration(
          gradient: RadialGradient(
              center: Alignment.centerRight,
              radius: 1,
              transform: GradientRotation(7),
              colors: [
                Color.fromRGBO(20, 52, 22, 1),
                Color.fromRGBO(43, 92, 46, 1),
                Color.fromRGBO(76, 175, 80, 1),
                Color.fromRGBO(76, 175, 80, 1),
              ]),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(13, 36, 15, 1),
              blurRadius: 10,
              spreadRadius: 4,
              offset: Offset(8, 8),
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(100)),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: _pressPop,
        child: Container(
            width: 75,
            height: 75,
            margin: const EdgeInsets.all(5),
            decoration: stylePress));
  }
}
