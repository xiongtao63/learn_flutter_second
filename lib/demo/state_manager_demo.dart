import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class StateManagementDemo extends StatelessWidget {
  const StateManagementDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<CounterModel>(
      model: CounterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("StateManagementDemo"),
          elevation: 0.0,
        ),
        body: CounterWrapper(),
        floatingActionButton: ScopedModelDescendant<CounterModel>(
          rebuildOnChange: false,
          builder: (context, _, model) {
            return FloatingActionButton(
                child: Icon(Icons.add), onPressed: model.increaseCount);
          },
        ),
      ),
    );
  }
}

class CounterWrapper extends StatelessWidget {
  const CounterWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(),
    );
  }
}

class Counter extends StatelessWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(builder: (context, _, CounterModel model) {
      return ActionChip(
          label: Text("${model.count}"), onPressed: model.increaseCount);
    });
  }
}

class CounterModel extends Model {
  int _count = 0;

  int get count => _count;

  void increaseCount() {
    _count++;
    notifyListeners();
  }
}
