import 'package:flutter/material.dart';

class TabbarPageDemo extends StatelessWidget {
  const TabbarPageDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            title: const Text("TabbarPageDemo"),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                tooltip: "Search",
                onPressed: (){
                  debugPrint('Search button is pressed.');
                },
              )
            ],
            elevation: 0.0,
            bottom: const TabBar(
              unselectedLabelColor: Colors.black38,
              indicatorColor: Colors.black54,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 1.0,
              tabs: [
                Tab(icon: Icon(Icons.local_florist)),
                Tab(icon: Icon(Icons.change_history)),
                Tab(icon: Icon(Icons.directions_bike)),
                Tab(icon: Icon(Icons.view_quilt))
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Center(child: Text("page1")),
              Center(child: Text("page2")),
              Center(child: Text("page3")),
              Center(child: Text("page4")),
            ],
          ),
        )
    );
  }
}