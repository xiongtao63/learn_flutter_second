import 'package:flutter/material.dart';
import 'package:learn_flutter_second/main.dart';

class SliderDemo extends StatefulWidget {
  const SliderDemo({Key? key}) : super(key: key);

  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double _sliderItemA = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SliderDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Slider(
                    value: _sliderItemA,
                    onChanged: (v){
                      setState(() {
                        _sliderItemA = v;
                      });
                    },
                  min: 0.0,
                  max: 100.0,
                  activeColor: Theme.of(context).accentColor,
                  inactiveColor: Theme.of(context).accentColor.withOpacity(0.3),
                  divisions: 100,
                  label: "${_sliderItemA.toInt()}",
                )
              ],
            ),
            SizedBox(width: 20),
            Text('SliderValue: $_sliderItemA')

          ],
        ),
      ),
    );
  }
}