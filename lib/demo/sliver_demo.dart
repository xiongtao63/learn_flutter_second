import 'package:flutter/material.dart';
import 'package:learn_flutter_second/model/post.dart';

class SliverDemo extends StatefulWidget {
  const SliverDemo({Key? key}) : super(key: key);

  @override
  _SliverDemoState createState() => _SliverDemoState();
}

class _SliverDemoState extends State<SliverDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // title: Text("dddd"),
            // pinned: true,//将标题固定在顶部
            floating: true, //标题随着滚动消失
            expandedHeight: 178,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('SliverDemo'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 15.0,
                    letterSpacing: 3.0,
                    fontWeight: FontWeight.w400,
                  )
              ),
              background: Image.network(posts[0].imageUrl, fit: BoxFit.cover,),
            ),

          ),
          SliverSafeArea(
              sliver: SliverPadding(
                padding: EdgeInsets.all(8),
                sliver: SliverListDemo(),
                // sliver: SliverGridDemo(),
              )
          )
        ],
      ),
    );
  }
}


class SliverGridDemo extends StatelessWidget {
  const SliverGridDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        delegate: SliverChildBuilderDelegate(
                (context, index) {
              return Container(
                child: Image.network(
                  posts[index].imageUrl,
                  fit: BoxFit.cover,
                ),
              );
            },
            childCount: posts.length
        ),


        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.7

        )
    );
  }
}


class SliverListDemo extends StatelessWidget {
  const SliverListDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
              (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Material(
                borderRadius: BorderRadius.circular(12),
                elevation: 14,
                shadowColor: Colors.grey.withOpacity(0.9),
                child: Stack(
                  children: [
                    AspectRatio(aspectRatio: 16 / 9,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 2.0,color: Colors.red),
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: NetworkImage(
                              posts[index].imageUrl,
                            ),
                            fit: BoxFit.cover,
                          )
                        ),
                        // child: Image.network(
                        //   posts[index].imageUrl,
                        //   fit: BoxFit.cover,
                        // ),
                      )
                    ),
                    Positioned(
                        top: 32,
                        left: 32,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              posts[index].title,
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white
                              ),
                            ),
                            Text(
                              posts[index].author,
                              style: TextStyle(
                                  fontSize: 13.0,
                                  color: Colors.white
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            );
          },
          childCount: posts.length
      ),
    );
  }
}


