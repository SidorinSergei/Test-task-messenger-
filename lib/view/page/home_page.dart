import 'package:flutter/material.dart';
import '../widgets/search_bar.dart' as CustomSearchBar;
import '../widgets/page_title.dart';
import '../widgets/user_info.dart';
import '../widgets/divider_line.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 35),
          PageTitle(text: 'Чаты', fontSize: 32, fontWeight: FontWeight.bold),
          CustomSearchBar.SearchBar<String>(
            labelText: 'Поиск',
            onTextChanged: (value) {},
          ),
          DividerLine(),
          Expanded(
            child: ListView(
              children: [
                UserBlock(
                  userName: 'Пользователь 1',
                  lastMessage: 'Последнее сообщение от пользователя 1',
                  isOnline: true, // Замените на актуальное состояние пользователя
                ),
                UserBlock(
                  userName: 'льзователь 2',
                  lastMessage: 'Последнее сообщение от пользователя 2',
                  isOnline: false,
                ),
                // Добавьте другие UserBlock по мере необходимости
              ],
            ),

          ),
        ],
      ),
    );
  }
}
