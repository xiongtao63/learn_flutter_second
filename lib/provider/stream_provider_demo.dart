import 'package:flutter/material.dart';
import 'package:learn_flutter_second/provider/other.dart';
import 'package:provider/provider.dart';

import 'model.dart';


//StreamProvider提供流值，是围绕StreamBuilder，所提供的值会在传入的时候替换掉新值。
// 和FutureProvider一样，主要的区别在于值会根据多次触发重新构建UI。
class StreamProviderDemo extends StatefulWidget {
  const StreamProviderDemo({Key? key}) : super(key: key);

  @override
  State<StreamProviderDemo> createState() => _StreamProviderDemoState();
}

class _StreamProviderDemoState extends State<StreamProviderDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("StreamProviderDemo"),
      ),
      body: StreamProvider<UserModel3>(
        initialData: UserModel3(name: "初始值"),
        create: (_) => UserStream().getStreamUserModel(),
        child: streamProviderExample(),
      ),
    );
  }

  Center streamProviderExample() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<UserModel3>(
            builder: (_, userModel, child) {
              return Text(userModel.name ?? "",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 30
                  )
              );
            },
          ),
          Consumer<UserModel3>(
            builder: (_, userModel, child) {
              return Padding(
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: (){
                    userModel.changeName();
                  },
                  child: Text("改变值"),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
