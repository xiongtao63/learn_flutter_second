import 'dart:async';

import 'package:flutter/material.dart';

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
