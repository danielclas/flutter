import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  Timer timer = new Timer.periodic(new Duration(seconds: 3), (timer) {
    switchPanel[currentIndex] = true;
    currentIndex++;
  });
  runApp(MyApp());
}

List switchPanel = new List();
int currentIndex = 0;
double opacity = 0.9;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/back.png"), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.grey[800],
          drawer: NavDrawer(),
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 10,
              leading: Icon(Icons.format_align_left),
              title: Text("Repeatz")),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: GridView.count(
                    padding: EdgeInsets.all(10),
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    crossAxisCount: 9,
                    children: getBoxes())),
          )),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.play_arrow),
            backgroundColor: Colors.white.withOpacity(0.5),
          ),
        ),
      ),
    );
  }

  List<Widget> getBoxes() {
    List<Widget> list = new List<Widget>();

    for (int i = 0; i < 90; i++) {
      switchPanel.add(false);
      list.add(AnimatedOpacity(
        duration: Duration(seconds: 2),
        opacity: switchPanel[currentIndex] ? 0.9 : 0.5,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(begin: Alignment.centerLeft, colors: [
                  Colors.green.withOpacity(0.8),
                  Colors.green.withOpacity(0.4)
                ])),
            child: SizedBox(
              height: 20,
              width: 20,
            )),
      ));
    }

    for (int i = 0; i < 20; i++) {
      switchPanel.add(false);
      list.add(AnimatedOpacity(
        duration: Duration(seconds: 2),
        opacity: switchPanel[currentIndex] ? 0.9 : 0.1,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(begin: Alignment.centerLeft, colors: [
                  Colors.yellow.withOpacity(0.8),
                  Colors.yellow.withOpacity(0.4)
                ])),
            child: SizedBox(
              height: 20,
              width: 20,
            )),
      ));
    }

    for (int i = 0; i < 20; i++) {
      switchPanel.add(false);
      list.add(AnimatedOpacity(
        duration: Duration(seconds: 2),
        opacity: opacity,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(begin: Alignment.centerLeft, colors: [
                  Colors.red.withOpacity(0.8),
                  Colors.red.withOpacity(0.4)
                ])),
            child: SizedBox(
              height: 20,
              width: 20,
            )),
      ));
    }

    return list;
  }
}

class NavDrawer extends StatelessWidget {
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: <Widget>[
        DrawerHeader(child: Text("Header")),
        ListTile(
            leading: Icon(Icons.mail), title: Text("Mail"), onTap: () => {}),
        ListTile(
            leading: Icon(Icons.stop), title: Text("Stop"), onTap: () => {}),
      ]),
    );
  }
}
