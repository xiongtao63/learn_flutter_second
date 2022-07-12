import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RichTextDemo extends StatelessWidget {
  const RichTextDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RichTextDemo"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          richText(),
          SizedBox(height: 100),
          text()
        ],
      ),
    );
  }
  Widget richText(){
    return RichText(
        text: TextSpan(
            text: "xiongtao",
            style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 30,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400),
            children: [
              TextSpan(
                  text: ".net",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey
                  )
              )
            ]
        )
    );
  }

  text(){
    final TextStyle textStyle = TextStyle(
      fontSize: 20,
    );
    final String _author = '李白';
    final String _title = '将进酒';
    return Text(
      '《 $_title 》—— $_author。君不见黄河之水天上来，奔流到海不复回。君不见高堂明镜悲白发，朝如青丝暮成雪。人生得意须尽欢，莫使金樽空对月。天生我材必有用，千金散尽还复来。烹羊宰牛且为乐，会须一饮三百杯。',
      textAlign: TextAlign.left,
      style: textStyle,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}
