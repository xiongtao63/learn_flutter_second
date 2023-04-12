import 'package:flutter/material.dart';

class FutureDemo extends StatefulWidget {
  @override
  _FutureDemoState createState() => _FutureDemoState();
}

class _FutureDemoState extends State<FutureDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FutureBuilder'),
      ),
      body: _creactFutureBuilder(),
    );
  }

  var _future = Future.delayed(Duration(seconds: 5), () {
    return Future.error('error');
    // return '老王，一个有态度的程序员';
  });

  Widget _creactFutureBuilder() {
    return FutureBuilder(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          var widget;
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              widget = Icon(
                Icons.error,
                color: Colors.red,
                size: 48,
              );
            } else {
              widget = Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 36,
              );
            }
          } else {
            widget = Padding(
              padding: EdgeInsets.all(20),
              child: CircularProgressIndicator(),
            );
          }

          return Center(
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: widget,
            ),
          );
        });
  }
}
