import 'package:flutter/material.dart';

import '../other/page_item.dart';

class BottomNavigatorPageDemo extends StatefulWidget {
  const BottomNavigatorPageDemo({Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return BottomNavigatorPageDemoState();
  }
}
class BottomNavigatorPageDemoState extends State<BottomNavigatorPageDemo>{
  final pages = [
    PageOne(),
    PageTwo(),
    PageThree(),
    PageFour(),
  ];

  int _currentIndex = 0;
  void _onTapHandler(int v){
    setState(() {
      _currentIndex = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            title: const Text("BottomNavigatorPageDemo"),
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
          ),
          body: pages[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: _onTapHandler,
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.black,
            items: const [
              BottomNavigationBarItem(
                  label: "Explore",
                  icon: Icon(Icons.explore)
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'List',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'My',
              ),
            ],
          ),
        )
    );
  }

}

