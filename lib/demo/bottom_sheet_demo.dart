import 'package:flutter/material.dart';

class BottomSheetDemo extends StatefulWidget {
  const BottomSheetDemo({Key? key}) : super(key: key);

  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>(); //管理面板状态


  _openBottomSheet(){
    _bottomSheetScaffoldKey
        .currentState
        ?.showBottomSheet((context){
          return BottomAppBar(
            child: Container(
              height: 90,
              width: double.infinity,
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(Icons.pause_circle_outline),
                  SizedBox(width: 20),
                  Text('01:30 / 03:30'),
                  Expanded(
                      child:Text('Fix you - Coldplay', textAlign: TextAlign.right,),
                  )
                ],
              ),
            ),
          );
    });
  }

  _openModalBottomSheet() async{
    final result = await showModalBottomSheet(
        context: context,
        builder: (context){
          return Container(
            height: 200.0,
            child: Column(
              children: [
                  ListTile(
                    title: Text('Option A'),
                    onTap: (){
                      Navigator.pop(context,"A");
                    },
                  ),
                  ListTile(
                    title: Text('Option B'),
                    onTap: (){
                      Navigator.pop(context,"B");
                    },
                  ),
                  ListTile(
                    title: Text('Option C'),
                    onTap: (){
                      Navigator.pop(context,"C");
                    },
                  ),
              ],
            ),
          );
        }
    );
    print(result);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomSheetScaffoldKey,
      appBar: AppBar(
        title: const Text("BottomSheetDemo"),
        elevation: 0.0,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: _openBottomSheet,
                    child: Text('Open BottomSheet'),
                ),
                SizedBox(width: 5),
                ElevatedButton(
                    onPressed: _openModalBottomSheet,
                    child: Text('Modal BottomSheet'),
                ),
              ],
            )


      ),
    );
  }


}