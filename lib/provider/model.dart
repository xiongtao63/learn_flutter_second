import 'package:flutter/material.dart';

class UserModel {

  String name = "Jimi";

  void changeName() {
    name = "hello";
  }
}

class UserModel1 with ChangeNotifier {

  String name = "Jimi";

  void changeName() {
    name = "hello";
    notifyListeners();
  }
}

class UserModel2{

  UserModel2({this.name});

  String? name = "Jimi";

  Future<void> changeName() async {
    await Future.delayed(Duration(milliseconds: 2000));
    name = "hello";
  }
}

class UserModel3{

  UserModel3({this.name});

  String? name = "Jimi";

  void changeName() {
    name = "hello";
  }
}

class UserModel4 with ChangeNotifier {

  String name = "Jimi";
  int age = 18;

  void changeName() {
    name = "hello";
    age = 20;
    notifyListeners();
  }
}

class UserModel5 with ChangeNotifier {

  String name = "Jimi";

  void changeName({required String newName}) {
    name = newName;
    notifyListeners();
  }
}


class WalletModel {

  UserModel5? userModel5;

  WalletModel({this.userModel5});

  void changeName() {
    userModel5?.changeName(newName: "JIMI");
  }
}

class BookModel {

  static var _books = [
    Book(1, "夜的命名数"),
    Book(2, "大奉打更人"),
    Book(3, "星门"),
    Book(4, "大魏读书人"),
    Book(5, "我师兄实在太稳健了"),
    Book(6, "深空彼岸"),
  ];

  // 获取书籍长度
  int get length => _books.length;

  // 根据ID获取书籍
  Book getById(int id) => _books[id -1];

  // 根据索引获取数据
  Book getByPosition(int position) => _books[position];

// 更多....
}

class Book {
  final int bookId;
  final String bookName;

  Book(this.bookId, this.bookName);
}


class BookManagerModel with ChangeNotifier {

  // 依赖bookModel
  final BookModel _bookModel;

  // 获取数据所有的ID
  List<int>? _bookIds;

  // 构造函数
  BookManagerModel(this._bookModel, {BookManagerModel? bookManagerModel})
      : _bookIds = bookManagerModel?._bookIds ?? [];

  // 获取所有的书
  List<Book> get books => _bookIds!.map((id) => _bookModel.getById(id)).toList();

  // 根据索引获取数据
  Book getByPosition(int position) => books[position];

  // 获取书籍的长度
  int get length => _bookIds?.length ?? 0;

  // 添加书籍
  void addFaves(Book book) {
    _bookIds!.add(book.bookId);
    notifyListeners();
  }

  // 删除书籍
  void removeFaves(Book book) {
    _bookIds!.remove(book.bookId);
    notifyListeners();
  }
}