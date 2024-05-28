import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
  bool showPop = true;
  void _showPop() {
    setState(() {
      showPop = !showPop;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Pop It !'),
          ),
          body: Container(
            color: Colors.grey[200],
            child: Center(
                child: Column(
              children: [
                Row(
                  children: <Widget>[
                    InkWell(
                      onTap: _showPop,
                      child: Container(
                        height: 50,
                        width: 100,
                        margin: EdgeInsets.all(5),
                        padding:
                            const EdgeInsets.only(left: 5, right: 5, top: 15),
                        decoration: BoxDecoration(
                          color: Colors.blue[300],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(3)),
                        ),
                        child: const Text("Mostrar PopIt"),
                      ),
                    ),
                    Container(
                      width: 450,
                      height: 50,
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: const Center(
                          child: Text("Oprime las burbujas",
                            style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                      )),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          height: 450,
                          width: 100,
                          margin: EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            gradient: LinearGradient(
                              transform: GradientRotation(3),
                              colors: [
                                Colors.deepPurple,
                                Colors.blue,
                                Colors.green,
                                Colors.amberAccent,
                                Colors.orangeAccent
                              ],
                            ),
                          ),
                          child: Column(
                            children: createPop(5),
                          ),
                        )
                      ],
                    ),
                    Container(
                        width: 450,
                        height: 450,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: Colors.grey,
                            width: 2,
                          ),
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
                        child: showPop
                            ? const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                    RowPopIt(),
                                    RowPopIt(),
                                    RowPopIt(),
                                  ])
                            : Container(
                                padding: EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage("assets/gif/monkey.gif"),
                                        fit: BoxFit.cover)))),
                  ],
                )
              ],
            )),
          )),
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
    return Container(
        margin: const EdgeInsets.only(left: 25, right: 25, bottom: 3),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            border: Border.all(
              color: Color.fromARGB(0, 0, 0, 0),
              width: 2,
            ),
            gradient: const LinearGradient(
              transform: GradientRotation(6),
              stops: [0.01, 0.2, 0.3, 0.4, 0.5],
              colors: [
                Colors.deepPurple,
                Colors.blue,
                Colors.green,
                Colors.amberAccent,
                Colors.orangeAccent
              ],
            ),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 2,
                  spreadRadius: 4,
                  color: Color.fromARGB(100, 0, 0, 0),
                  offset: Offset(5, 5)),
              BoxShadow(
                color: Color.fromARGB(182, 33, 33, 33),
                blurRadius: 10,
                spreadRadius: 4,
                offset: Offset(8, 8),
              ),
            ]),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PopIt(),
            PopIt(),
            PopIt(),
          ],
        ));
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

List<PopIt> createPop(int times) {
  List<PopIt> pops = [];
  for (var i = 0; i < times; i++) {
    pops.add(const PopIt());
  }
  return pops;
}
