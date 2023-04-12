
import 'package:flutter/material.dart';
import 'package:learn_flutter_second/provider/model.dart';
import 'package:provider/provider.dart';

import 'model.dart';

//用Consumer包裹组件
// 里面有个builder构造器，当我们把body改成下面重新运行后可以发现和使用Provider.of的结果一样，但是这里不需要在像使用Provider.of那样每次使用都要写一大串的重复性代码。
class ConsumerDemo extends StatefulWidget {
  const ConsumerDemo({Key? key}) : super(key: key);

  @override
  State<ConsumerDemo> createState() => _ConsumerDemoState();
}

class _ConsumerDemoState extends State<ConsumerDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ConsumerDemo"),
      ),
      body: ChangeNotifierProvider(
        create: (_) => CountNotifier1(),
        child: ConsumerExampleOptimize(),
      ),
    );
  }


}

class ConsumerExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Consumer(builder: (BuildContext context, CountNotifier1 countNotifier1, Widget? child) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(countNotifier1.count.toString(),
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 50
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 20
                ),
                child: ElevatedButton(
                  onPressed: (){
                    countNotifier1.increment();
                  },
                  child: Text("点击加1"),
                ),
              )
            ],
          ),
        );
      },

      ),
    );
  }
}
class ConsumerExampleOptimize extends StatelessWidget {//优化

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Consumer(builder: (BuildContext context, CountNotifier1 countNotifier1, Widget? child) {
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
            )
        );
      },

      ),
    );
  }
}
