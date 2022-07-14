import 'package:flutter/material.dart';
import 'package:learn_flutter_second/demo/post_show_demo.dart';

import '../model/post.dart';

class ListViewDemo extends StatefulWidget {
  const ListViewDemo({Key? key}) : super(key: key);

  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {

  Widget _listItemBuilder(context,index){
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(10),
      child: Stack(
        children: [
          Column(
            children: [
              AspectRatio(aspectRatio: 16/9,
              child: Image.network(posts[index].imageUrl, fit: BoxFit.cover,),),
              SizedBox(height: 10),
              Text(
                posts[index].title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 10),
              Text(
                posts[index].author,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(height: 10),
            ],
          ),
          Positioned.fill(child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PostShow(post: posts[index]))
                );
              },
              splashColor: Colors.white.withOpacity(0.3),
              highlightColor: Colors.white.withOpacity(0.1),
            ),
          ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListViewDemo"),
      ),
      body: ListView.builder(
        itemCount: posts.length,
          itemBuilder: _listItemBuilder
      ),
    );
  }
}