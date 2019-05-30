import "package:flutter/material.dart";
import "dart:async";

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
  void initState() {
  	super.initState();
		Firestore.getCount().then (
			(int count) => setState(() => counter = count)
		);

		// The FAB is faster than FB, and we do want to limit document writes
		// so we update manually every once in a while instead of every button press
		Timer.periodic(
  		const Duration(minutes: 1),
  		(_) async {
  			if (counter != await Firestore.getCount()) 
  				Firestore.setCount(counter);
			}
		);
  }

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
        "$counter times",
        textScaleFactor: 2,
        textAlign: TextAlign.center,
      )
    )
  );

  void add() {
    // await Firestore.addOne();
    setState(() => counter++);
  }
}
