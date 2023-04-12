

// tabbar
import 'package:flutter/material.dart';

import '../other/root_page_head.dart';
import '../tabbar/preferred_tab_bar.dart';

const List<Widget> _tabs = [
  const Tab(text: '微读'),
  const Tab(text: '推荐'),
  const Tab(text: '歌曲'),
  const Tab(text: '歌手'),
  const Tab(text: '小视频'),
  const Tab(text: '听书'),
  const Tab(text: '文章'),
  const Tab(text: '视频'),
  const Tab(text: '话题'),
];

// tabbarView
final List<Widget> _tabsContent = [
  Center(child: Text("微读"),),
  Center(child: Text("推荐"),),
  Center(child: Text("歌曲"),),
  Center(child: Text("歌手"),),
  Center(child: Text("小视频"),),
  Center(child: Text("听书"),),
  Center(child: Text("文章"),),
  Center(child: Text("视频"),),
  Center(child: Text("话题"),),
];

// 首页
class KeepAlivePage extends StatefulWidget {
  KeepAlivePage({ Key? key}) : super(key: key);

  @override
  _KeepAlivePageState createState() => _KeepAlivePageState();
}

class _KeepAlivePageState extends State<KeepAlivePage>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  // tabController实例
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // 实例化TabController
    _tabController = TabController(
      initialIndex: 1,
      length: _tabs.length,
      vsync: this,
    );
    // 监听切换事件
    _tabController.addListener(() {
      print(_tabController.index);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: RootPageHead(),
        bottom: PreferredTabBar(
          tabController: _tabController,
          tabs: _tabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabsContent,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}