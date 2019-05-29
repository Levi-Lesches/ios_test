import "package:flutter/material.dart";

import "cloud_firestore.dart" as Firestore;

void main() {
  runApp (
    MaterialApp (
      home: CounterPage()
    )
  );
}

class CounterPage extends StatefulWidget {
  @override 
  CounterState createState() => CounterState();
}

class CounterState extends State<CounterPage> {
  int counter = 0;

  @override
  Widget build (BuildContext context) => Scaffold (
    appBar: AppBar (title: Text ("Counter")),
    floatingActionButton: FloatingActionButton (
      child: Icon (Icons.add),
      onPressed: add,
    ),
    body: Center (
      child: Text (
        "You pressed the button: \n"
        "$counter times"
      )
    )
  );

  void add() async {
    await Firestore.addOne();
    setState(() => counter++);
  }
}
