import 'package:flutter/material.dart';

class AnimationDemo extends StatefulWidget {
  const AnimationDemo({Key? key}) : super(key: key);

  @override
  _AnimationDemoState createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("AnimationDemo"),
        ),
        body: AnimationDemoHome());
  }
}

class AnimationDemoHome extends StatefulWidget {
  const AnimationDemoHome({Key? key}) : super(key: key);

  @override
  _AnimationDemoHomeState createState() => _AnimationDemoHomeState();
}

class _AnimationDemoHomeState extends State<AnimationDemoHome> with TickerProviderStateMixin {

  late AnimationController animationController;
  late Animation animation;
  late Animation animationColor;
  late CurvedAnimation curve;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      duration: Duration(milliseconds: 1000),
        // value: 32,
        // lowerBound: 32,
        // upperBound: 100,
        vsync: this);
    
    curve =  CurvedAnimation(parent: animationController, curve: Curves.bounceInOut);

    animation = Tween(begin: 32.0,end: 100.0).animate(curve);
    animationColor =  ColorTween(begin: Colors.red,end: Colors.yellow).animate(curve);

    // animationController.addListener(() {
    //   print('${animationController.value}');
    //     setState(() {});
    // });
    animationController.addStatusListener((status) {
      print(status);
    });
    // animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedHeart(
        animations: [
          animation,
          animationColor
        ],
        controller: animationController,
      ),
    );
  }
}

class AnimatedHeart extends AnimatedWidget {
  final AnimationController controller;
  final List animations;

  AnimatedHeart({required this.animations, required this.controller})
      : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        switch(controller.status){
          case AnimationStatus.completed:
            controller.reverse();
          break;
          default:
            controller.forward();
        }
      },
      icon: Icon(Icons.favorite),
      iconSize: animations[0].value,
      color: animations[1].value,
    );
  }
}
