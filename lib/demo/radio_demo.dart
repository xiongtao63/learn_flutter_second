import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  const RadioDemo({Key? key}) : super(key: key);

  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  int _radioGroupA = 0;

  _handleRadioValueChanged(value){
    setState(() {
      _radioGroupA = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RadioDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('RadioGroupValue: $_radioGroupA'),
            SizedBox(height: 20,),
            RadioListTile(
              title: Text("option A"),
                subtitle: Text('Description'),
                secondary: Icon(Icons.filter_1),
                selected: _radioGroupA == 0,
                value: 0,
                groupValue: _radioGroupA,
                onChanged: _handleRadioValueChanged
            ),
            RadioListTile(
              title: Text("option B"),
                subtitle: Text('Description'),
                secondary: Icon(Icons.filter_2),
                selected: _radioGroupA == 1,
                value: 1,
                groupValue: _radioGroupA,
                onChanged: _handleRadioValueChanged
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                    value: 0,
                    groupValue: _radioGroupA,
                    onChanged: _handleRadioValueChanged,
                  activeColor: Colors.blue,
                ),
                SizedBox(width: 20,),
                Radio(
                    value: 1,
                    groupValue: _radioGroupA,
                    onChanged: _handleRadioValueChanged,
                  activeColor: Colors.blue,
                )
              ],
            )


          ],
        ),
      ),
    );
  }
}