import 'dart:convert';

import 'package:flutter/material.dart';


import 'package:http/http.dart' as http;

class HttpDemo extends StatefulWidget {
  const HttpDemo({Key? key}) : super(key: key);

  @override
  _HttpDemoState createState() => _HttpDemoState();
}

class _HttpDemoState extends State<HttpDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HttpDemo"),
      ),
      body: HttpDemoHome(),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  const HttpDemoHome({Key? key}) : super(key: key);

  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {

  Future<List<Post>> fetchPosts() async{
    var url = Uri.parse('https://resources.ninghao.net/demo/posts.json');
    final response = await http.get(url);
    print('statusCode: ${response.statusCode}');
    print('body: ${response.body}');

    if(response.statusCode == 200){
      final responseBody = jsonDecode(response.body);
      List<Post> posts = responseBody["posts"].map<Post>((item) => Post.fromJson(item)).toList();
      return posts;
    }else{
      throw Exception('Failed to fetch posts.');
    }


  }

  testHttp() async{
    var url = Uri.parse('https://example.com/whatsit/create');
    var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    print(await http.read(Uri.parse('https://example.com/foobar.txt')));
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: fetchPosts(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          print('data: ${snapshot.data}');
          print('connectionState: ${snapshot.connectionState}');

          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: Text("loading...."),
            );
          }
          return ListView(
            children: snapshot.data.map<Widget>((item){
              return ListTile(
                title: Text(item.title),
                subtitle: Text(item.author),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(item.imageUrl),
                ),
                onTap: (){
                  testHttp();
                }
                ,
              );
            }).toList(),
          );
        }
    );
  }
}


class Post {
  final int id;
  final String title;
  final String description;
  final String author;
  final String imageUrl;

  Post(
      this.id,
      this.title,
      this.description,
      this.author,
      this.imageUrl,
      );

  Post.fromJson(Map json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        author = json['author'],
        imageUrl = json['imageUrl'];

  Map toJson() => {
    'title': title,
    'descritpion': description,
  };
}