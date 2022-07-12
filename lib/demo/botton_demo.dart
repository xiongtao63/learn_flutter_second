import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonDemo extends StatefulWidget {
  const ButtonDemo({Key? key}) : super(key: key);

  @override
  _ButtonDemoState createState() => _ButtonDemoState();
}

class _ButtonDemoState extends State<ButtonDemo> {
  elevatedButtonDemo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Theme(
            data: Theme.of(context).copyWith(
                // buttonColor: Theme.of(context).colorScheme.secondary,
                buttonTheme: ButtonThemeData(
                    buttonColor: Colors.red,
                    textTheme: ButtonTextTheme.normal,
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(40)))),
            child: ElevatedButton(
              child: Text('Button'),
              onPressed: () {},
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(10.0),
                  overlayColor: MaterialStateProperty.all(Colors.grey[100])),
            )),
        SizedBox(width: 16),
        ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text('Button'),
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(12.0),
              foregroundColor:
                  MaterialStateProperty.all(Theme.of(context).accentColor),
              overlayColor: MaterialStateProperty.all(Colors.grey[100])),
        )
      ],
    );
  }

  textButtonDemo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {},
          child: Text('Button'),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              overlayColor: MaterialStateProperty.all(Colors.grey)),
        ),
        SizedBox(width: 20),
        TextButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text("Button"),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              overlayColor: MaterialStateProperty.all(Colors.grey)),
        )
      ],
    );
  }

  outlineButtonDemo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Theme(
            data: Theme.of(context).copyWith(
                buttonColor: Theme.of(context).accentColor,
                buttonTheme: ButtonThemeData(
                  textTheme: ButtonTextTheme.primary,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                )),
            child: OutlinedButton(
              onPressed: () {},
              child: Text('Button'),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(Colors.yellow),
                  overlayColor: MaterialStateProperty.all(Colors.grey),
                  side: MaterialStateProperty.all(
                      BorderSide(color: Colors.blue))),
            )),
        SizedBox(width: 16),
        OutlinedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text("Button"),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.yellow),
              overlayColor: MaterialStateProperty.all(Colors.grey),
              side: MaterialStateProperty.all(BorderSide(color: Colors.blue))),
        )
      ],
    );
  }

  fixWidthButtonDemo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 130,
          child: OutlinedButton(
            child: Text("Button"),
            onPressed: () {},
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                side: MaterialStateProperty.all(
                    BorderSide(color: Colors.black12, width: 3))),
          ),
        )
      ],
    );
  }

  expandButtonDemo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: OutlinedButton(
          onPressed: () {},
          child: Text("Button"),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              side: MaterialStateProperty.all(
                  BorderSide(color: Colors.black12, width: 3))),
        )),
        SizedBox(width: 20),
        Expanded(
          flex: 2,
            child: OutlinedButton(
          child: Text("111"),
          onPressed: () {},
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              side: MaterialStateProperty.all(
                  BorderSide(color: Colors.black12, width: 3))),
        ))
      ],
    );
  }

  buttonBarDemo(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Theme(
            data: Theme.of(context).copyWith(
              buttonTheme: ButtonThemeData(
                padding: EdgeInsets.symmetric(horizontal: 32.0)
              )
            ),
            child: ButtonBar(
              children: [
                OutlinedButton(
                  child: Text("Button"),
                  onPressed: () {},
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      side: MaterialStateProperty.all(
                          BorderSide(color: Colors.black12, width: 3))),
                ),
                OutlinedButton(
                  child: Text("Button"),
                  onPressed: () {},
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      side: MaterialStateProperty.all(
                          BorderSide(color: Colors.black12, width: 3))),
                )
              ],
            )
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ButtonDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            elevatedButtonDemo(),
            textButtonDemo(),
            outlineButtonDemo(),
            fixWidthButtonDemo(),
            expandButtonDemo(),
            buttonBarDemo()
          ],
        ),
      ),
    );
  }
}
