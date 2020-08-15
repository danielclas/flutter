import 'package:flutter/material.dart';
import 'assets.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('I am rich'),
          centerTitle: true,
          backgroundColor: Colors.amberAccent[400],
        ),
        backgroundColor: Colors.blueGrey,
        body: Center(
          child: Center(
            child: Image(
              image: AssetImage(new Assets().getImage()),
            ),
          ),
        ),
      ),
    ),
  );
}
