import 'package:flutter/material.dart';

class TextFieldDemo extends StatefulWidget {
  const TextFieldDemo({Key? key}) : super(key: key);

  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {

  final textEditingController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController.text = "hi";
    textEditingController.addListener(() {
      debugPrint('input: ${textEditingController.text}');
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEditingController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TextFieldDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: TextField(
          controller: textEditingController,
          onChanged: (value){
            setState(() {
              debugPrint('input: $value');
            });
          },
          onSubmitted: (value){
            debugPrint('submit: $value');
          },
          decoration: InputDecoration(
            icon: Icon(Icons.subject),
            labelText: 'Title',
            hintText: 'Enter the post title.',
            // border: InputBorder.none,
      border: OutlineInputBorder()
          ),
        ),
      ),
    );
  }
}