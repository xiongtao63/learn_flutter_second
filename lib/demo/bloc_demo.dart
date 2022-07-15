import 'dart:async';

import 'package:flutter/material.dart';

class BlocDemo extends StatefulWidget {
  const BlocDemo({Key? key}) : super(key: key);

  @override
  _BlocDemoState createState() => _BlocDemoState();
}

class _BlocDemoState extends State<BlocDemo> {
  @override
  Widget build(BuildContext context) {
    return CounterProvider(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("BlocDemo"),
          ),
          body: CounterHome(),
          floatingActionButton: CounterActionButton(),
        ),
        bloc: CounterBloc());
  }
}

class CounterHome extends StatelessWidget {
  const CounterHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _counterBloc = CounterProvider.of(context)?.bloc;
    return Center(
      child: StreamBuilder(
        initialData: 0,
        stream: _counterBloc?.count,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return ActionChip(
              label: Text('${snapshot.data}'),
              onPressed: () {
                _counterBloc?.counter.add(1);
              });
        },
      ),
    );
  }
}

class CounterActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _counterBloc = CounterProvider.of(context)?.bloc;

    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        // _counterBloc.log();
        _counterBloc?.counter.add(1);
      },
    );
  }
}

class CounterProvider extends InheritedWidget {
  final Widget child;
  final CounterBloc bloc;

  CounterProvider({required this.child, required this.bloc})
      : super(child: child);

  static CounterProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CounterProvider>();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

class CounterBloc {
  int _count = 0;
  final _counterActionController = StreamController<int>();

  StreamSink<int> get counter => _counterActionController.sink;

  final _counterController = StreamController<int>();

  Stream<int> get count => _counterController.stream;

  CounterBloc() {
    _counterActionController.stream.listen(onData);
  }

  onData(int data) {
    print('$data');
    _count = data + _count;
    _counterController.add(_count);
  }

  disponse() {
    _counterController.close();
    _counterActionController.close();
  }

  void log() {
    print('BLoC');
  }
}
