import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchDemo extends StatefulWidget {
  const SwitchDemo({Key? key}) : super(key: key);

  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool _switchItemA = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SwitchDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SwitchListTile(
              value: _switchItemA,
              onChanged: (bool v) {
                setState(() {
                  _switchItemA = v;
                });
              },
              title: Text('Switch Item A'),
              subtitle: Text("Description"),
              secondary:
                  Icon(_switchItemA ? Icons.visibility : Icons.visibility_off),
              selected: _switchItemA,
              activeColor: Colors.red,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _switchItemA ? '😁' : '😐',
                  style: TextStyle(fontSize: 32.0),
                ),
                Switch(
                  value: _switchItemA,
                  onChanged: (bool v) {
                    setState(() {
                      _switchItemA = v;
                    });
                  },
                  activeColor: Colors.orange,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
