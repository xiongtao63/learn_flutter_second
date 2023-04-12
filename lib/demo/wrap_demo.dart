import 'package:flutter/material.dart';

class WrapDemo extends StatefulWidget {
  const WrapDemo({Key? key}) : super(key: key);

  @override
  _WrapDemoState createState() => _WrapDemoState();
}

class _WrapDemoState extends State<WrapDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WrapDemo"),
      ),
      body: Wrap(
        //  Wrap({
        //     Key key,
        //     this.direction = Axis.horizontal,   //排列方向，默认水平方向排列
        //     this.alignment = WrapAlignment.start,  //子控件在主轴上的对齐方式
        //     this.spacing = 0.0,  //主轴上子控件中间的间距
        //     this.runAlignment = WrapAlignment.start,  //子控件在交叉轴上的对齐方式
        //     this.runSpacing = 0.0,  //交叉轴上子控件之间的间距
        //     this.crossAxisAlignment = WrapCrossAlignment.start,   //交叉轴上子控件的对齐方式
        //     this.textDirection,   //textDirection水平方向上子控件的起始位置
        //     this.verticalDirection = VerticalDirection.down,  //垂直方向上子控件的其实位置
        //     List<Widget> children = const <Widget>[],   //要显示的子控件集合
        //   })
        direction: Axis.horizontal,
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 4,
        runSpacing: 15,
        textDirection: TextDirection.rtl,
        verticalDirection: VerticalDirection.up,
        children: List.generate(10, (i){
          double w = 50+ i*10;
          double h = 50.0 + 5 * i;
          return Container(
            color: Colors.primaries[i],
            alignment: Alignment.center,
            height: h,
            width: w,
            child: Text('$i'),
          );
        }),
      ),
    );
  }
}