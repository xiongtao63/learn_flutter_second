import 'package:flutter/material.dart';

class DrawerPageDemo extends StatelessWidget {
  const DrawerPageDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            title: const Text("DrawerPageDemo"),
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
              Text("page1"),
              Text("page2"),
              Text("page3"),
              Text("page4"),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const UserAccountsDrawerHeader(
                  accountName: Text("张三", style: TextStyle(fontWeight: FontWeight.bold),),
                  accountEmail: Text("936564446@qq.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage("https://www.itying.com/images/flutter/1.png"),
                  ),
                  decoration: BoxDecoration(
                      color:Colors.yellow,
                      image: DecorationImage(
                          image: NetworkImage("https://www.itying.com/images/flutter/3.png"),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Color.fromRGBO(255, 255, 0, 0.5),
                              BlendMode.hardLight)
                      )
                  ),
                ),
                ListTile(
                  title: const Text(
                    "Message",
                    textAlign: TextAlign.right,

                  ),
                  trailing: const Icon(Icons.message, color: Colors.black12,size: 22.0),
                  onTap: () => Navigator.pop(context),
                ),
                ListTile(
                  title: Text(
                    'Favorite',
                    textAlign: TextAlign.right,
                  ),
                  trailing: Icon(Icons.favorite, color: Colors.black12, size: 22.0),
                  onTap: () => Navigator.pop(context),
                ),
                ListTile(
                  title: Text(
                    'Settings',
                    textAlign: TextAlign.right,
                  ),
                  trailing: Icon(Icons.settings, color: Colors.black12, size: 22.0),
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        )
    );
  }
}