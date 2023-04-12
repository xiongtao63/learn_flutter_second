import 'package:flutter/material.dart';

class ConsumerIndexPage extends StatefulWidget {
  const ConsumerIndexPage({Key? key}) : super(key: key);

  @override
  State<ConsumerIndexPage> createState() => _ConsumerIndexPageState();
}

class _ConsumerIndexPageState extends State<ConsumerIndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ConsumerIndexPage"),
      ),

      body: Container(
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
                Navigator.of(context).pushNamed("/providerOfDemo");
              }, child: Text("Provider.of")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
                Navigator.of(context).pushNamed("/consumerDemo");
              }, child: Text("Consumer")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
                Navigator.of(context).pushNamed("/selectorDemo");
              }, child: Text("Selector")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
                Navigator.of(context).pushNamed("/inheritedContextDemo");
              }, child: Text("InheritedContext")),
            ),

          ],
        )
        ),

    );
  }
}
