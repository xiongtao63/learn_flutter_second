
import 'package:flutter/material.dart';
import 'package:learn_flutter_second/provider/model.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class ProviderOfDemo extends StatefulWidget {
  const ProviderOfDemo({Key? key}) : super(key: key);

  @override
  State<ProviderOfDemo> createState() => _ProviderOfDemoState();
}

class _ProviderOfDemoState extends State<ProviderOfDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ProviderOfDemo"),
      ),
      body: ChangeNotifierProvider(
        create: (_) => CountNotifier1(),
        child: ProviderOfExample(),
      ),
    );
  }


}

class ProviderOfExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Provider.of<CountNotifier1>(context).count.toString(),
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
                  Provider.of<CountNotifier1>(context,listen: false).increment();
                },
                child: Text("点击加1"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
