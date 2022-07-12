import 'package:flutter/material.dart';
import 'package:learn_flutter_second/demo/basic_demo.dart';
import 'package:learn_flutter_second/drawer/drawer_demo.dart';
import 'package:learn_flutter_second/routes/routes.dart';
import 'package:learn_flutter_second/tabbar/tab_bar.dart';

import 'bottom_navigator/bottom_navigator_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
          splashColor: Colors.white70,
          accentColor: Color.fromRGBO(3, 54, 255, 1.0)),
      // initialRoute: "/tabbar",
      routes:routes,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      body: SingleChildScrollView(
        child: Wrap(
          spacing: 10,
          children: [
            ElevatedButton(
              child: const Text("Tabbar"),
              onPressed: () {
                Navigator.of(context).pushNamed("/tabbar");
              },
            ),
            ElevatedButton(
              child: const Text("BottomNavigatorBar"),
              onPressed: () {
                Navigator.of(context).pushNamed("/bottomNavigatorBar");
              },
            ),
            ElevatedButton(
              child: const Text("Drawer"),
              onPressed: () {
                Navigator.of(context).pushNamed("/drawer");
              },
            ),
            ElevatedButton(
              child: const Text("basic"),
              onPressed: () {
                Navigator.of(context).pushNamed("/basic");
              },
            ),
            ElevatedButton(
              child: const Text("richText"),
              onPressed: () {
                Navigator.of(context).pushNamed("/richText");
              },
            ),
            ElevatedButton(
              child: const Text("alertDialog"),
              onPressed: () {
                Navigator.of(context).pushNamed("/alertDialog");
              },
            ),
            ElevatedButton(
              child: const Text("bottomSheet"),
              onPressed: () {
                Navigator.of(context).pushNamed("/bottomSheet");
              },
            ),
            ElevatedButton(
              child: const Text("button"),
              onPressed: () {
                Navigator.of(context).pushNamed("/button");
              },
            ),
            ElevatedButton(
              child: const Text("card"),
              onPressed: () {
                Navigator.of(context).pushNamed("/card");
              },
            ),
            ElevatedButton(
              child: const Text("checkBox"),
              onPressed: () {
                Navigator.of(context).pushNamed("/checkBox");
              },
            ),
            ElevatedButton(
              child: const Text("chip"),
              onPressed: () {
                Navigator.of(context).pushNamed("/chip");
              },
            ),
            ElevatedButton(
              child: const Text("dataTable"),
              onPressed: () {
                Navigator.of(context).pushNamed("/dataTable");
              },
            ),
            ElevatedButton(
              child: const Text("dateTime"),
              onPressed: () {
                Navigator.of(context).pushNamed("/dateTime");
              },
            ),
            ElevatedButton(
              child: const Text("expansionPanel"),
              onPressed: () {
                Navigator.of(context).pushNamed("/expansionPanel");
              },
            ),
          ],
        ),
      ),
    );
  }
}
