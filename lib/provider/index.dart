import 'package:flutter/material.dart';

class ProviderIndexPage extends StatefulWidget {
  const ProviderIndexPage({Key? key}) : super(key: key);

  @override
  State<ProviderIndexPage> createState() => _ProviderIndexPageState();
}

class _ProviderIndexPageState extends State<ProviderIndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ProviderIndexPage"),
      ),

      body: Container(
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
                Navigator.of(context).pushNamed("/providerDemo");
              }, child: Text("Provider")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
                Navigator.of(context).pushNamed("/changeNotifierProviderDemo");
              }, child: Text("ChangeNotifierProvider")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
                Navigator.of(context).pushNamed("/futureProviderDemo");
              }, child: Text("FutureProvider")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
                Navigator.of(context).pushNamed("/streamProviderDemo");
              }, child: Text("StreamProvider")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
                Navigator.of(context).pushNamed("/multiProviderDemo");
              }, child: Text("MultiProvider")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
                Navigator.of(context).pushNamed("/proxyProviderDemo");
              }, child: Text("ProxyProvider")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
                Navigator.of(context).pushNamed("/changeNotifierProxyProviderDemo");
              }, child: Text("ChangeNotifierProxyProvider")),
            ),
          ],
        )
        ),

    );
  }
}
