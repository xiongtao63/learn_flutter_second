
import 'package:flutter/material.dart';
import 'package:learn_flutter_second/provider/model.dart';
import 'package:provider/provider.dart';

import 'model.dart';

//InheritedContext是Provider内置扩展了BuildContext，它不保存了组件在树中自己位置的引用，我们在上面的案例中见到Provider.of<CountNotifier1>(context，listen: false)，其实这个of方法就是使用Flutter查找树并找到Provider子类型为CountNotifier1而已。
//
// 三大方式：
// BuildContext.read: BuildContext.read<CountNotifier1>()可以替换掉Provider.of<CountNotifier1>(context，listen: false)，它会找到CountNotifier1并返回它。
// BuildContext.watch: BuildContext.watch<CountNotifier1>()可以替换掉Provider.of<CountNotifier1>(context，listen: false)，看起来和read没有什么不同，但是使用watch你就不需要在使用Consumer。
// BuildContext.select: BuildContext.select<CountNotifier1>()可以替换掉Provider.of<CountNotifier1>(context，listen: false)，看起来和watch也没有什么不同，但是使用select你就不需要在使用Selector。
class InheritedContextDemo extends StatefulWidget {
  const InheritedContextDemo({Key? key}) : super(key: key);

  @override
  State<InheritedContextDemo> createState() => _InheritedContextDemoState();
}

class _InheritedContextDemoState extends State<InheritedContextDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("InheritedContextDemo"),
      ),
      body: ChangeNotifierProvider(
        create: (_) => CountNotifier2(),
        child: InheritedContextExample5(),
      ),
    );
  }


}
//使用Provider.of()
class InheritedContextExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// Provider.of 获取值
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Provider.of<CountNotifier2>(context).count.toString(),
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 50
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () => Provider.of<CountNotifier2>(context, listen: false).increment(),
                child: Text("点击加1"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//使用BuildContext.read  读取值  不更新
class InheritedContextExample1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// read 获取值
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(context.read<CountNotifier2>().count.toString(),
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 50
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () => Provider.of<CountNotifier2>(context, listen: false).increment(),
                child: Text("点击加1"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//使用Consumer
class InheritedContextExample2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// Consumer 获取值
      body: Center(
        child: Consumer<CountNotifier2>(
          builder: (_, countNotifier2, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(countNotifier2.count.toString(),
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 50
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () => countNotifier2.increment(),
                    child: Text("点击加1"),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

//使用BuildContext.watch  监听值的变化
class InheritedContextExample3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    /// 重要
    final countNotifier2 = context.watch<CountNotifier2>();

    return Scaffold(

      /// watch
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(countNotifier2.count.toString(),
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 50
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () => countNotifier2.increment(),
                child: Text("点击加1"),
              ),
            ),
          ],
        ),
      ),

    );
  }
}

//使用Seletor
class InheritedContextExample4 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// Selector
      body: Center(
        child: Selector<CountNotifier2, int>(
          selector: (_, countNotifier2) => countNotifier2.count,
          builder: (_, count, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(count.toString(),
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 50
                  ),
                ),
                child!
              ],
            );
          },
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: ElevatedButton(
              onPressed: () => Provider.of<CountNotifier2>(context, listen: false).increment(),
              child: Text("点击加1"),
            ),
          ),
        ),
      ),

    );
  }
}

//使用BuildContext.select
class InheritedContextExample5 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    /// 重要
    final count = context.select((CountNotifier2 countNotifier2) => countNotifier2.count);

    return Scaffold(

      /// select
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(count.toString(),
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 50
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () => Provider.of<CountNotifier2>(context, listen: false).increment(),
                child: Text("点击加1"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
