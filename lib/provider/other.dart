import 'model.dart';

class UserFuture {

  Future<UserModel2> asyncGetUserModel2() async {
    await Future.delayed(Duration(milliseconds: 2000));
    return UserModel2(name: "获取新的数据");
  }

}

class UserStream {

  Stream<UserModel3> getStreamUserModel() {
    return Stream<UserModel3>.periodic(Duration(milliseconds: 1000),
            (value) => UserModel3(name: "$value")
    ).take(10);
  }
}