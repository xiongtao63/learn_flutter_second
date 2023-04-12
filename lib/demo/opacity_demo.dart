import 'package:flutter/material.dart';

class OpacityDemo extends StatefulWidget {
  const OpacityDemo({Key? key}) : super(key: key);

  @override
  _OpacityDemoState createState() => _OpacityDemoState();
}

class _OpacityDemoState extends State<OpacityDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OpacityDemo"),
      ),
      body: Column(
        children: [_opacity(),_animationOpacity()],
      ),
    );
  }

  bool click = false;

  _animationOpacity() {
    return InkWell(
      onTap: (){
        setState(() {
          click = !click;

        });
      },
      child: AnimatedOpacity(
        onEnd: (){
          setState(() {
            click = !click;
          });
        },
        curve: Curves.bounceIn,//动画曲线
        opacity: click?0.5:1, //颜色透明度,1是全部显示,0是完全透明,0.5是一半透明
        duration: Duration(seconds:2),
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.grey],
              )
          ),
      )
      ),
    );
    return AnimatedOpacity(
      onEnd: (){
        setState(() {
          click = !click;
          print("=====0");
        });
      },
      duration: Duration(seconds: 3),
      opacity: click ? 0.2 : 0.8,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.grey],
            )
        ),
      ),
    );

  }

  _opacity() {
    return Stack(
      children: [
        Image.network(
          'https://img2.baidu.com/it/u=1395980100,2999837177&fm=253&app=120&size=w931&n=0&f=JPEG&fmt=auto?sec=1673456400&t=ebdfa1143e717c0fd2e5bef6048fca92',
        ),
        Positioned.fill(
            child: Opacity(
          opacity: 0.5,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white, Colors.blue],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter)),
          ),
        ))
      ],
    );
  }
}
