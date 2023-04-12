import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model.dart';

//它跟Provider组件不同，ChangeNotifierProvider会监听模型对象的变化，而且当数据改变时，它也会重建Consumer（消费者）
//模型类使用了ChangeNotifier，那么我们就可以访问notifyListeners()并且在调用它的任何时候，
// ChangeNotifierProvider都会收到通知并且消费者将重建UI。
class ChangeNotifierProviderDemo extends StatefulWidget {
  const ChangeNotifierProviderDemo({Key? key}) : super(key: key);

  @override
  State<ChangeNotifierProviderDemo> createState() =>
      _ChangeNotifierProviderDemoState();
}

class _ChangeNotifierProviderDemoState
    extends State<ChangeNotifierProviderDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ChangeNotifierProviderDemo"),
      ),
      body: ChangeNotifierProvider<UserModel1>(
        create: (_) => UserModel1(),
        child: changeNotifierProviderExample(),
      ),
    );
  }

  Center changeNotifierProviderExample() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<UserModel1>(
            builder: (_, userModel, child) {
              return Text(userModel.name,
                  style: TextStyle(color: Colors.red, fontSize: 30));
            },
          ),
          Consumer<UserModel1>(
            builder: (_, userModel, child) {
              return Padding(
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {
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
