

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../util/util.dart';

final List<Widget> list = List.generate(10, (index) {
  return Container(
    height: 40,
    color: Colors.green.withOpacity(index / 10),
    child: Text('第$index个'),
  );
});

class RootPageHead extends StatelessWidget {
  const RootPageHead({Key? key}) : super(key: key);

  void _onSearch() {
    Get.snackbar('搜索', '敬请期待');
  }

  void _onMsg() {
    Get.bottomSheet(
      SizedBox(
        height: 400,
        child: Column(
          children: [
            Container(
              height: 40,
              alignment: Alignment.center,
              color: Colors.black,
              child: Text(
                '评论',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              height: 360,
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return list[index];
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'images/logo.png',
          height: toRpx(size: 80),
        ),
        Expanded(
          child: _searchContainer(),
        ),
        InkWell(
          onTap: _onMsg,
          child: Image.asset(
            'images/msg.png',
            height: toRpx(size: 60),
          ),
        ),
      ],
    );
  }

  Widget _searchContainer() {
    return Container(
      height: 30,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(22),
      ),
      child: InkWell(
        onTap: _onSearch,
        borderRadius: BorderRadius.circular(22),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, right: 2),
              child: Icon(
                Icons.search,
                size: 18,
                color: Colors.black87,
              ),
            ),
            Text(
              '搜索关键词',
              style: TextStyle(
                fontSize: 13,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}