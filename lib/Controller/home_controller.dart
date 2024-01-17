import 'package:flutter/material.dart';
import '../Model/user_data.dart';

class HomeController extends ChangeNotifier {
  List<UserData> allUsers = [
    UserData(name: 'Пользователь 1', lastMessage: 'Последнее сообщение от пользователя 1', isOnline: true),
    UserData(name: 'Пользователь 2', lastMessage: 'Последнее сообщение от пользователя 2', isOnline: false),
  ];

  List<UserData> displayedUsers = [];

  HomeController() {
    displayedUsers = List.from(allUsers);
  }

  void searchUsers(String query) {
    displayedUsers = allUsers
        .where((user) => user.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
