import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Box extends StatelessWidget {
  final Color colour;

  const Box({Key? key, required this.colour}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: colour,
        border: Border.all(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.red,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('World Wide Words'),
          ),
          body: Container(
            color: Colors.yellow,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(5),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Box(colour: Colors.pink),
                          Box(colour: Colors.cyanAccent),
                          Box(colour: Colors.deepPurple),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Box(colour: Colors.pink),
                          Box(colour: Colors.cyanAccent),
                          Box(colour: Colors.deepPurple),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Box(colour: Colors.pink),
                          Box(colour: Colors.cyanAccent),
                          Box(colour: Colors.deepPurple),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(20.0),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)),
                      child: Column(
                        children: [
                          Box(colour: Colors.red),
                          Box(colour: Colors.white),
                          Box(colour: Colors.blue),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20.0),
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)),
                      child: Column(
                        children: [
                          Box(colour: Colors.amber),
                          Box(colour: Colors.black),
                          Box(colour: Colors.green),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Box(colour: Colors.pink),
                          Box(colour: Colors.cyanAccent),
                          Box(colour: Colors.deepPurple),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
