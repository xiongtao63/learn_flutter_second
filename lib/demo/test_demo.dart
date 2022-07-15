
import 'package:flutter/material.dart';

class TestDemo extends StatelessWidget {
  const TestDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TestDemo"),
      ),
      body: TestDemoHome(),
    );
  }
}

class TestDemoHome extends StatefulWidget {
  const TestDemoHome({Key? key}) : super(key: key);

  @override
  _TestDemoHomeState createState() => _TestDemoHomeState();
}

class _TestDemoHomeState extends State<TestDemoHome> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Chip(label: Text("hello")),
        ActionChip(
          key: Key("actionChip"),
            label: Text('$count', key: Key('actionChipLabelText')),
            onPressed: (){
            setState(() {
              count +=1;
            });
            })
      ],
    );
  }
}

class NinghaoTestDemo {
  static greet(String name){
    return "hello $name ~~";
  }
}
