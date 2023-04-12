import 'package:flutter/material.dart';
import 'package:learn_flutter_second/provider/other.dart';
import 'package:provider/provider.dart';

import 'model.dart';


//简单来说，FutureProvider用于提供在组件树中准备好使用其值时可能尚未准备好的值，主要是确保空值不会传递给任何子组件，而且FutureProvider有一个初始值，子组件可以使用该Future值并告诉子组件使用新的值来进行重建。
//
// 注意：
//
// FutureProvider只会重建一次
// 默认显示初始值
// 然后显示Future值
// 最后不会再次重建
class FutureProviderDemo extends StatefulWidget {
  const FutureProviderDemo({Key? key}) : super(key: key);

  @override
  State<FutureProviderDemo> createState() => _FutureProviderDemoState();
}

class _FutureProviderDemoState extends State<FutureProviderDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FutureProviderDemo"),
      ),
      body: FutureProvider<UserModel2>(
        initialData: UserModel2(name: "初始值"),
        create: (_) => UserFuture().asyncGetUserModel2(),
        child: futureProviderExample(),
      ),
    );
  }

  Center futureProviderExample() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<UserModel2>(
            builder: (_, userModel, child) {
              return Text(userModel.name ?? "",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 30
                  )
              );
            },
          ),
          Consumer<UserModel2>(
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
