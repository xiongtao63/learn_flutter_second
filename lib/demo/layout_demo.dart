import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutDemo extends StatefulWidget {
  const LayoutDemo({Key? key}) : super(key: key);

  @override
  _LayoutDemoState createState() => _LayoutDemoState();
}

class _LayoutDemoState extends State<LayoutDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LayoutDemo"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StackDemo(),
            SizedBox(height: 10,),
            ConstrainedBoxDemo(),
            SizedBox(height: 10,),
            AspectRatioDemo(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconBadge(Icons.add,size: 30,),
                IconBadge(Icons.settings,size: 20,),
                IconBadge(Icons.unarchive,size: 40,)
              ],
            )

          ],
        ),
      ),
    );
  }
}

class StackDemo extends StatelessWidget {
  const StackDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        SizedBox(
          height: 200,
          width: 300,
          child: Container(
            alignment: Alignment(0.0, -0.9),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color.fromRGBO(3, 54, 255, 1.0),
            ),
          ),
        ),
        SizedBox(
          height: 32,
        ),
        SizedBox(
          height: 200,
          width: 300,
          child: Container(
            alignment: Alignment(0.0, -0.9),
            decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(30),
                color: Color.fromRGBO(3, 54, 255, 1.0),
                shape: BoxShape.circle,
                gradient: RadialGradient(colors: [
                  Color.fromRGBO(7, 102, 255, 1.0),
                  Color.fromRGBO(3, 54, 255, 1.0),
                ])),
            child: Icon(
              Icons.brightness_2,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
        Positioned(
            top: 40,
            left: 50,
            child: Icon(
              Icons.ac_unit,
              color: Colors.white,
              size: 30,
            )),
        Positioned(
            bottom: 20,
            right: 30,
            child: Icon(
              Icons.ac_unit,
              color: Colors.white,
              size: 30,
            )),
        Positioned(
            top: 40,
            left: 180,
            child: Icon(
              Icons.ac_unit,
              color: Colors.white,
              size: 30,
            )),
        Positioned(
            top: 70,
            left: 10,
            child: Icon(
              Icons.ac_unit,
              color: Colors.white,
              size: 10,
            )),
        Positioned(
            top: 114,
            left: -4,
            child: Icon(
              Icons.ac_unit,
              color: Colors.white,
              size: 10,
            )),
      ],
    );
  }
}

class ConstrainedBoxDemo extends StatelessWidget {
  const ConstrainedBoxDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 100, maxWidth: 100),
      child: Container(
        color: Color.fromRGBO(3, 54, 255, 1.0),
      ),
    );
  }
}


class AspectRatioDemo extends StatelessWidget {
  const AspectRatioDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(aspectRatio: 16/9,
    child: Container(
      color: Color.fromRGBO(3, 54, 255, 1.0),
    ),);
  }
}


class IconBadge  extends StatelessWidget {
  final IconData icon;
  final double size;
  IconBadge(this.icon,{this.size = 32});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(icon,size: size,color: Colors.white,),
      width: size +20,
      height: size+ 20,
      color: Color.fromRGBO(3, 54, 255, 1.0),
    );
  }
}


