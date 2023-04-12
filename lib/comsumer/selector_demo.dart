import 'package:flutter/material.dart';
import 'package:learn_flutter_second/provider/model.dart';
import 'package:provider/provider.dart';

import 'model.dart';


//Selector
// Selector类和Consumer类似，只是对build调用Widget方法时提供更精细的控制，简单点来说，Selector也是一个消费者，它允许你可以从模型中准备定义哪些属性。
class SelectorDemo extends StatefulWidget {
  const SelectorDemo({Key? key}) : super(key: key);

  @override
  State<SelectorDemo> createState() => _SelectorDemoState();
}

class _SelectorDemoState extends State<SelectorDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SelectorDemo"),
      ),
      body: ChangeNotifierProvider(
        create: (_) => UserModel6(),
        child: SelectorExample(),
      ),
    );
  }
}

class SelectorExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Selector(
        selector: (_, UserModel6 userModel) => userModel.age,
        builder: (_, age, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(age.toString(),
                  style: TextStyle(color: Colors.red, fontSize: 30)),
              child!
            ],
          );
        },
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () {
              Provider.of<UserModel6>(context, listen: false).increaseAge();
            },
            child: Text("改变年龄"),
          ),
        ),
      ),
    ));
  }
}

class consumerExampleOptimize extends StatelessWidget {
  //优化

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (BuildContext context, CountNotifier1 countNotifier1,
            Widget? child) {
          return Center(
              child: Consumer(
            builder: (_, CountNotifier1 countNotifier1, child) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      countNotifier1.count.toString(),
                      style: TextStyle(color: Colors.red, fontSize: 50),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          countNotifier1.increment();
                        },
                        child: Text("点击加1"),
                      ),
                    ),
                    child!
                  ],
                ),
              );
            },
            child: Container(
              child: Column(
                children: [
                  Text("更多组件1"),
                  Text("更多组件2"),
                  Text("更多组件3"),
                  Text("更多组件4"),
                  Text("更多组件5"),
                  Text("更多组件6"),
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
