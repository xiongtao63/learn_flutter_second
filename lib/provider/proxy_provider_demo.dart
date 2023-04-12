import 'package:flutter/material.dart';
import 'package:learn_flutter_second/provider/other.dart';
import 'package:provider/provider.dart';

import 'model.dart';


//当我们有多个模型的时候，会有模型依赖另一个模型的情况，在这种情况下，我们可以使用ProxyProvider从另一个提供者获取值，然后将其注入到另一个提供者中
class ProxyProviderDemo extends StatefulWidget {
  const ProxyProviderDemo({Key? key}) : super(key: key);

  @override
  State<ProxyProviderDemo> createState() => _ProxyProviderDemoState();
}

class _ProxyProviderDemoState extends State<ProxyProviderDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ProxyProviderDemo"),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserModel5()),
          ProxyProvider<UserModel5,WalletModel>(update: (_,userModel,walletModel){
            return WalletModel(userModel5: userModel);
          })
        ],
        child: proxyProviderExample(),
      ),
    );
  }

  Center proxyProviderExample() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<UserModel5>(
            builder: (_, userModel, child) {
              return Text(userModel.name,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 30
                  )
              );
            },
          ),
          Consumer<UserModel5>(
            builder: (_, userModel, child) {
              return Padding(
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: (){
                    userModel.changeName(newName: "hello");
                  },
                  child: Text("改变值"),
                ),
              );
            },
          ),
          Consumer<WalletModel>(
            builder: (_, walletModel, child) {
              return Padding(
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: (){
                    walletModel.changeName();
                  },
                  child: Text("通过代理改变值"),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
