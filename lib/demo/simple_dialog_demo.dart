import 'package:flutter/material.dart';

class SimpleDialogDemo extends StatefulWidget {
  const SimpleDialogDemo({Key? key}) : super(key: key);

  @override
  _SimpleDialogDemoState createState() => _SimpleDialogDemoState();
}

enum Option{
  A,B,C
}

class _SimpleDialogDemoState extends State<SimpleDialogDemo> {

  String _choice = 'Nothing';

  _openSimpleDialog() async{
   final result =  await showDialog(
        context: context,
        builder: (context){
          return SimpleDialog(
            title: Text('SimpleDialog'),
            children: [
              SimpleDialogOption(
                child: Text("Options A"),
                onPressed: (){
                  Navigator.of(context).pop(Option.A);
                },
              ),
              SimpleDialogOption(
                child: Text("Options B"),
                onPressed: (){
                  Navigator.of(context).pop(Option.B);
                },
              ),
              SimpleDialogOption(
                child: Text("Options C"),
                onPressed: (){
                  Navigator.of(context).pop(Option.C);
                },
              ),
            ],
          );
        }
    );

   switch(result){
     case Option.A:
       setState(() {
         _choice = 'A';
       });
       break;
     case Option.B:
       setState(() {
         _choice = 'B';
       });
       break;
     case Option.C:
       setState(() {
         _choice = 'C';
       });
       break;
     default:
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SimpleDialogDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your choice is: $_choice'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.format_list_numbered),
        onPressed: _openSimpleDialog,
      ),
    );
  }
}