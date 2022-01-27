// ignore_for_file: file_names, camel_case_types, unnecessary_new
import 'package:flutter_getobx_testing/model/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final List<User> _users = [
    User(
        0,
        "Aung Aung",
        "aungaung@gmail.com",
        "Yangon",
        "092342342",
        "https://cdn-icons-png.flaticon.com/128/3011/3011265.png",
        DateTime.now().toString(),
        DateTime.now().toString()),
    User(
        2,
        "Ma Ma",
        "mama@gmail.com",
        "Mandalay",
        "0977652134",
        "https://cdn-icons-png.flaticon.com/128/3011/3011293.png",
        DateTime.now().toString(),
        DateTime.now().toString()),
    User(
        3,
        "Ko Ko",
        "koko@gmail.com",
        "Yangon",
        "092342342",
        "https://cdn-icons-png.flaticon.com/128/3011/3011294.png",
        DateTime.now().toString(),
        DateTime.now().toString()),
    User(
        4,
        "Moe Moe",
        "moemoeg@gmail.com",
        "Yangon",
        "0956534555",
        "https://cdn-icons-png.flaticon.com/128/3011/3011288.png",
        DateTime.now().toString(),
        DateTime.now().toString()),
  ].obs;

  RxList<User> updatedUserList = RxList<User>();
  RxList<User> deletedUserList = RxList<User>();

  List<User> get users {
    return [..._users];
  }

  List<User> get updatedUser => updatedUserList;
//get updated user count
  int get updatedUserCount {
    // return  _items?.length?? 0;
    return updatedUserList.length;
  }

//update user data
  void updatingUser(User user) {
    // ignore: prefer_contains
    int originaUserIndex = _users.indexWhere((x) => x.userId == user.userId);

    //for original list
    if (originaUserIndex >= 0) {
      _users[originaUserIndex] = user;
    } else {
      return;
    }

    //for update user list
    int userIndex = updatedUserList.indexWhere((x) => x.userId == user.userId);
    if (userIndex >= 0) {
      updatedUserList[userIndex] = _users[originaUserIndex];
    } else {
      updatedUserList.add(_users[originaUserIndex]);
    }
  }

  get deletedUser => deletedUserList;
//get deleted user count
  int get deletedUserCount {
    return deletedUserList.length;
  }

  void deletingUser(User user) {
    _users.remove(user);
    // ignore: prefer_contains
    if (deletedUserList.indexOf(user) == -1) {
      deletedUserList.add(user);
    }
  }
}
