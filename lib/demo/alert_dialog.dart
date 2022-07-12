
import 'package:flutter/material.dart';


enum Action{
    OK,
    Cancel
}
class AlertDialogDemo extends StatefulWidget {
  const AlertDialogDemo({Key? key}) : super(key: key);

  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}


class _AlertDialogDemoState extends State<AlertDialogDemo> {

  String _choice = 'Nothing';

  Future _openAlertDialog() async{
  final action =   await showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('AlertDialog'),
            content: Text('Are you sure about this?'),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.of(context).pop(Action.Cancel);
                  },
                  child: Text('Cancel'),
              ),
              TextButton(
                  onPressed: (){
                    Navigator.of(context).pop(Action.OK);
                  },
                  child: Text('OK'),
              )
            ],
          );
        }
    );
    switch(action){
      case Action.OK:
        setState(() {
          _choice = "Ok";
        });
        break;
      case Action.Cancel:
        setState(() {
          _choice = "Cancel";
        });
        break;
      default:
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AlertDialogDemo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your choice is: $_choice'),
            SizedBox(height: 16.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: _openAlertDialog,
                    child: Text('Open AlertDialog'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}



