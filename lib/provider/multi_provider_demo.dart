import 'package:flutter/material.dart';
import 'package:learn_flutter_second/provider/other.dart';
import 'package:provider/provider.dart';

import 'model.dart';


//StreamProvider提供流值，是围绕StreamBuilder，所提供的值会在传入的时候替换掉新值。
// 和FutureProvider一样，主要的区别在于值会根据多次触发重新构建UI。
class MultiProviderDemo extends StatefulWidget {
  const MultiProviderDemo({Key? key}) : super(key: key);

  @override
  State<MultiProviderDemo> createState() => _MultiProviderDemoState();
}

class _MultiProviderDemoState extends State<MultiProviderDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MultiProviderDemo"),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserModel1()),
          ChangeNotifierProvider(create: (_) => UserModel4()),
        ],
        child: multiProviderExample(),
      ),
    );
  }

  Center multiProviderExample() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<UserModel1>(
            builder: (_, userModel, child) {
              return Text(userModel.name,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 30
                  )
              );
            },
          ),
          Consumer<UserModel4>(
            builder: (_, userModel, child) {
              return Text(userModel.age.toString(),
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 30
                  )
              );
            },
          ),
          Consumer2<UserModel1, UserModel4>(
            builder: (_, userModel1, userModel4, child) {
              return Padding(
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: (){
                    userModel1.changeName();
                    userModel4.changeName();
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
