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
          primarySwatch: Colors.blue,
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
            ListItem("tabbar"),
            ListItem("bottomNavigatorBar"),
            ListItem("drawer"),
            ListItem("basic"),
            ListItem("richText"),
            ListItem("alertDialog"),
            ListItem("bottomSheet"),
            ListItem("button"),
            ListItem("card"),
            ListItem("checkBox"),
            ListItem("chip"),
            ListItem("dataTable"),
            ListItem("dateTime"),
            ListItem("expansionPanel"),
            ListItem("floatButton"),
            ListItem("formDemo"),
            ListItem("textField"),
            ListItem("layout"),
            ListItem("listview"),
            ListItem("pageinatedDataTable"),
            ListItem("popupMenuButton"),
            ListItem("radio"),
            ListItem("simpleDialog"),
          ],
        ),
      ),
    );
  }
}


class ListItem extends StatelessWidget {
  final String name;
  ListItem(this.name);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(name),
      onPressed: () {
        Navigator.of(context).pushNamed("/${name}");
      },
    );
  }
}

