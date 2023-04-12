import 'package:flutter/material.dart';
import 'package:learn_flutter_second/provider/other.dart';
import 'package:provider/provider.dart';

import 'model.dart';

//和ProxyProvider原理一样，唯一的区别在于它构建和同步ChangeNotifier的ChangeNotifierProvider，当提供者数据变化时，将会重构UI。
//
// 下面我们给出一个例子：
//
// 获取书籍列表
// 获取收藏书籍列表
// 点击书籍可加入或者取消收藏
// 通过代理实时重构UI
class ChangeNotifierProxyProviderDemo extends StatefulWidget {
  const ChangeNotifierProxyProviderDemo({Key? key}) : super(key: key);

  @override
  State<ChangeNotifierProxyProviderDemo> createState() =>
      _ChangeNotifierProxyProviderDemoState();
}

class _ChangeNotifierProxyProviderDemoState
    extends State<ChangeNotifierProxyProviderDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ChangeNotifierProxyProviderDemo"),
      ),
      body: MultiProvider(
        providers: [
          Provider(create: (_) => BookModel()),
          ChangeNotifierProxyProvider<BookModel,BookManagerModel>(
            create: (_) => BookManagerModel(BookModel()),
            update: (_, bookModel, bookManagerModel) =>
                BookManagerModel(bookModel),
          )
        ],
        child: ChangeNotifierProxyProviderExample(),
      ),
    );
  }


}

class ChangeNotifierProxyProviderExample extends StatefulWidget {
  @override
  _ChangeNotifierProxyProviderExampleState createState() => _ChangeNotifierProxyProviderExampleState();
}

class _ChangeNotifierProxyProviderExampleState extends State<ChangeNotifierProxyProviderExample> {


  var _selectedIndex = 0;
  var _pages = [PageA(), PageB()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: "书籍列表"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "收藏"
          )
        ],
      ),
    );
  }
}

class PageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var bookModel = Provider.of<BookModel>(context);

    return ListView.builder(
      itemCount: bookModel.length,
      itemBuilder: (_, index) => BookItem(id: index + 1),
    );
  }
}

class PageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var bookManagerModel = Provider.of<BookManagerModel>(context);
    var bookCount = bookManagerModel.length;

    return ListView.builder(
      itemCount: bookCount,
      itemBuilder: (_, index) => BookItem(id: bookManagerModel.getByPosition(index).bookId),
    );
  }
}

class BookItem extends StatelessWidget {

  final int id;

  BookItem({
    Key? key,
    required this.id
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var bookModel = Provider.of<BookModel>(context);
    var book = bookModel.getById(id);

    return ListTile(
      leading: CircleAvatar(
        child: Text("${book.bookId}"),
      ),
      title: Text("${book.bookName}",
        style: TextStyle(
            color: Colors.black87
        ),
      ),
      trailing: BookButton(book: book),
    );
  }
}

class BookButton extends StatelessWidget {

  final Book book;

  BookButton({
    Key? key,
    required this.book
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var bookManagerModel = Provider.of<BookManagerModel>(context);

    return GestureDetector(
      onTap: bookManagerModel.books.contains(this.book)
          ?  () => bookManagerModel.removeFaves(this.book)
          :  () => bookManagerModel.addFaves(this.book),
      child: SizedBox(
        width: 100,
        height: 60,
        child: bookManagerModel.books.contains(this.book)
            ?  Icon(Icons.star, color: Colors.red,)
            :  Icon(Icons.star_border),
      ),
    );
  }
}
