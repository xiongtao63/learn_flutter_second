
import 'package:flutter/material.dart';
import 'package:learn_flutter_second/provider/model.dart';
import 'package:provider/provider.dart';

class ProviderDemo extends StatefulWidget {
  const ProviderDemo({Key? key}) : super(key: key);

  @override
  State<ProviderDemo> createState() => _ProviderDemoState();
}

class _ProviderDemoState extends State<ProviderDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ProviderDemo"),
      ),
      body: Provider<UserModel>(
        create: (_) => UserModel(),
        child: providerExample(),
      ),
    );
  }

  providerExample(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<UserModel>(
            builder: (_, userModel, child) {
              return Text(userModel.name,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 30
                  )
              );
            },
          ),
          Consumer<UserModel>(
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
