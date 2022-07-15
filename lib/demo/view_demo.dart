import 'package:flutter/material.dart';
import 'package:learn_flutter_second/model/post.dart';

class ViewDemo extends StatefulWidget {
  const ViewDemo({Key? key}) : super(key: key);

  @override
  _ViewDemoState createState() => _ViewDemoState();
}

class _ViewDemoState extends State<ViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ViewDemo"),
      ),
      // body: GridViewBuilderDemo(),
      // body: GridViewExtentDemo(),
      body: GridViewCountDemo(),
    );
  }
}


class GridViewBuilderDemo extends StatelessWidget {
  const GridViewBuilderDemo({Key? key}) : super(key: key);

  Widget _gridItemBuilder(context,index){
    return Container(
      child: Image.network(posts[index].imageUrl,fit: BoxFit.cover,),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8),
      itemCount: posts.length,
        // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        //   // crossAxisCount: 3,
        //     maxCrossAxisExtent: 250,
        //   crossAxisSpacing: 8,
        //   mainAxisSpacing: 8
        //
        // ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemBuilder: _gridItemBuilder
    );
  }
}


class GridViewExtentDemo extends StatelessWidget {
  const GridViewExtentDemo({Key? key}) : super(key: key);

  List<Widget> _buildTiles(int length) {
    return List.generate(length, (index){
      return Container(
        color: Colors.grey[300],
        alignment: Alignment(0.0,0.0),
        child: Text('Item $index',
            style: TextStyle(fontSize: 18.0, color: Colors.grey)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      padding: EdgeInsets.all(16),
        maxCrossAxisExtent: 150,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: _buildTiles(100),
      scrollDirection: Axis.horizontal,
    );
  }
}


class GridViewCountDemo extends StatelessWidget {
  const GridViewCountDemo({Key? key}) : super(key: key);
  List<Widget> _buildTiles(int length) {
    return List.generate(length, (int index) {
      return Container(
        color: Colors.grey[300],
        alignment: Alignment(0.0, 0.0),
        child: Text('Item $index',
            style: TextStyle(fontSize: 18.0, color: Colors.grey)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(8),
        crossAxisCount: 3,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: _buildTiles(100),
      scrollDirection: Axis.horizontal,
    );
  }
}


