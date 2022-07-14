import 'package:flutter/material.dart';

class FloatingActionButtonDemo extends StatefulWidget {
  const FloatingActionButtonDemo({Key? key}) : super(key: key);

  @override
  _FloatingActionButtonDemoState createState() => _FloatingActionButtonDemoState();
}

class _FloatingActionButtonDemoState extends State<FloatingActionButtonDemo> {

  final Widget _floatingActionButton = FloatingActionButton(
    child: Icon(Icons.add),
      elevation: 0.0,
      backgroundColor: Colors.black87,
      onPressed: (){},
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(30.0)
      ),
  );
  final Widget _floatingActionButtonExtended = FloatingActionButton.extended(
      onPressed: (){}, label: Text("Add"),icon: Icon(Icons.add),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FloatingActionButtonDemo"),
      ),
      body: Container(),
      floatingActionButton: _floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60.0,
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}