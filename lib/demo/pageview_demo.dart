import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/post.dart';

class PageViewBuilderDemo extends StatefulWidget {
  const PageViewBuilderDemo({Key? key}) : super(key: key);

  @override
  _PageViewBuilderDemoState createState() => _PageViewBuilderDemoState();
}

class _PageViewBuilderDemoState extends State<PageViewBuilderDemo> {

 Widget _pageItemBuilder(context,index){
    return Stack(
      children: [
        Image.network(posts[index].imageUrl,fit: BoxFit.cover,),
        // SizedBox.expand(
        //   child: Image.network(posts[index].imageUrl,fit: BoxFit.cover,),
        // ),
        Positioned(
          top: 8,
            left: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(posts[index].title,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(posts[index].author),
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
        title: const Text("PageViewBuilderDemo"),
      ),
      // body: PageView.builder(
      //   itemCount: posts.length,
      //     itemBuilder: _pageItemBuilder
      // ),
      body: PageViewDemo(),
    );
  }
}


class PageViewDemo extends StatelessWidget {
  const PageViewDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      onPageChanged: (int index){
        debugPrint("${index}");
      },
      controller: PageController(
        initialPage: 1,
        keepPage: false,
        viewportFraction: 0.5
      ),
      children: [
        Container(
          color: Colors.brown,
          alignment: Alignment(0.0, 0.0),
          child: Text('ONE',
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        Container(
          color: Colors.grey[900],
          alignment: Alignment(0.0, 0.0),
          child: Text('TWO',
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        Container(
          color: Colors.blueGrey[900],
          alignment: Alignment(0.0, 0.0),
          child: Text('THREE',
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
      ],
    );
  }
}
