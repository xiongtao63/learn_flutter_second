import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class RxDartDemo extends StatefulWidget {
  const RxDartDemo({Key? key}) : super(key: key);

  @override
  _RxDartDemoState createState() => _RxDartDemoState();
}

class _RxDartDemoState extends State<RxDartDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RxDartDemo"),
      ),
      body: RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  const RxDartDemoHome({Key? key}) : super(key: key);

  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {

  late PublishSubject<String> _textFieldSubject;

  @override
  void initState() {
    super.initState();
    _textFieldSubject = PublishSubject();
    
    // _textFieldSubject
    // .map((item) => "item: $item")
    // .where((item) => item.length > 15)
    //     .debounceTime(Duration(milliseconds: 500))
    //     .listen((event) {
    //   print(event);
    // });

    // PublishSubject<String> _subject = PublishSubject();
    // BehaviorSubject<String> _subject = BehaviorSubject(); //接收最后一个
    ReplaySubject _subject = ReplaySubject(maxSize: 2); //最多接收2个最新的

    _subject.add("hello");
    _subject.add('hola');
    _subject.add('hi');
    _subject.listen((value) {
      print('listen 1: $value');
    });
    _subject.listen((data) => print('listen 2: ${data.toUpperCase()}'));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textFieldSubject.close();
  }
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.black
        ),
        child: TextField(
          onChanged: (String v){
            _textFieldSubject.add('input: $v');
          },
          onSubmitted: (String v){
            _textFieldSubject.add('submit: $v');
          },
          decoration: InputDecoration(
            labelText: "Title",
            filled: true
          ),
        )
    );
  }
}