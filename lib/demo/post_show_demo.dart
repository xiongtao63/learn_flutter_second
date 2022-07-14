import 'package:flutter/material.dart';

import '../model/post.dart';

class PostShow extends StatefulWidget {
  final Post post;
  const PostShow({Key? key,required this.post}) : super(key: key);

  @override
  _PostShowState createState() => _PostShowState();
}

class _PostShowState extends State<PostShow> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PostShow"),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              Image.network(widget.post.imageUrl),
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Column(
                  children: [
                    Text("${widget.post.title}",style: Theme.of(context).textTheme.titleLarge,),
                    Text("${widget.post.author}",style: Theme.of(context).textTheme.subtitle1,),
                    SizedBox(height: 32.0),
                    Text("${widget.post.description}",style: Theme.of(context).textTheme.bodyText1,)
                  ],
                ),
              )
            ],
        ),
      ),
    );
  }
}