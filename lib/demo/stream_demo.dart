import 'dart:async';

import 'package:flutter/material.dart';


//总结
//StreamController  统筹管理的“Boss”
//StreamController暴露了一个Sink属性，主要负责事件流的输入
//StreamController暴露了Stream属性，主要负责流事件的输出
//Stream对外提供了事件的监听 事件的监听是通过StreamSubscription来实现的

//Provider提供者组件不会监听它提供的值的变化。如果你想要在值发生变化时更新组件，你需要使用StreamBuilder或者FutureBuilder。
//跟Provider组件不同，ChangeNotifierProvider会监听模型对象的变化，而且当数据改变时，它也会重建Consumer（消费者）

//FutureProvider FutureProvider只会重建一次
// 默认显示初始值
// 然后显示Future值
// 最后不会再次重建
//FutureProvider和StreamProvider都是Provider的子类，它们都可以提供一个异步的值，但是它们的行为有所不同。
//FutureProvider会在异步任务完成后更新组件，而StreamProvider会在每次接收到新的数据时更新组件。
//StreamProvider的实现方式是使用StreamBuilder，所以它也可以接收一个StreamBuilder来自定义UI。
//MultiProvider是一个小部件，它可以接收多个Provider，并将它们组合成一个小部件树。
//MultiProvider可以接收一个providers参数，它是一个Provider列表，它们将被组合成一个小部件树。
//MultiProvider还可以接收一个child参数，它是一个Widget，它将作为MultiProvider的子节点。
//ProxyProvider是一个Provider，它可以接收多个Provider，并将它们组合成一个新的值。
//ProxyProvider可以接收一个update参数，它是一个函数，它将被用来组合多个Provider的值。
//ProxyProvider可以接收一个create参数，它是一个函数，它将被用来创建一个新的值。
class StreamDemo extends StatefulWidget {
  const StreamDemo({Key? key}) : super(key: key);

  @override
  _StreamDemoState createState() => _StreamDemoState();
}

class _StreamDemoState extends State<StreamDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("StreamDemo"),
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  const StreamDemoHome({Key? key}) : super(key: key);

  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  late StreamSubscription _streamSubscription;
  late StreamController<String> _streamDemo;
  late StreamSink _sinkDemo;
  String _data = '...';

  @override
  void initState() {
    super.initState();
    print('Create a stream.');
    _streamDemo = StreamController.broadcast();
    _sinkDemo = _streamDemo.sink;

    print('Start listening on a stream.');
    _streamSubscription =
        _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);

    _streamDemo.stream.listen(onDataTwo, onError: onError, onDone: onDone);
    print('Initialize completed.');
  }

  @override
  void dispose() {
    _streamDemo.close();
    super.dispose();

  }

  void onDone() {
    print('Done!');
  }

  void onError(error) {
    print('Error: $error');
  }

  void onData(String data) {
    setState(() {
      _data = data;
    });
    print('$data');
  }

  void onDataTwo(String data) {
    print('onDataTwo: $data');
  }

  void _pauseStream() {
    print('Pause subscription');
    _streamSubscription.pause();
  }

  void _resumeStream() {
    print('Resume subscription');
    _streamSubscription.resume();
  }

  void _cancelStream() {
    print('Cancel subscription');
    _streamSubscription.cancel();
  }

  _addDataToStream() async {
    print('Add data to stream.');

    String data = await fetchData();
    // _streamDemo.add(data);
    _sinkDemo.add(data);
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    return "hello---";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_data),
            StreamBuilder(
                stream: _streamDemo.stream,
                initialData: "...",
                builder: (context, snapshot) {
                  return Text("${snapshot.data}");
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: _addDataToStream,
                  child: Text('Add'),
                ),
                TextButton(
                  onPressed: _pauseStream,
                  child: Text('Pause'),
                ),
                TextButton(
                  onPressed: _resumeStream,
                  child: Text('Resume'),
                ),
                TextButton(
                  onPressed: _cancelStream,
                  child: Text('Cancel'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
