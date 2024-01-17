import 'package:flutter/material.dart';
import '../../Controller/home_controller.dart';
import '../widgets/search_bar.dart' as CustomSearchBar;
import '../widgets/page_title.dart';
import '../widgets/user_info.dart';
import '../widgets/divider_line.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeController(),
      child: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 35),
          PageTitle(text: 'Чаты', fontSize: 32, fontWeight: FontWeight.bold),
          CustomSearchBar.SearchBar<String>(
            labelText: 'Поиск',
            onTextChanged: homeController.searchUsers,
          ),
          DividerLine(),
          Expanded(
            child: ListView.builder(
              itemCount: homeController.displayedUsers.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    UserBlock(
                      userName: homeController.displayedUsers[index].name,
                      lastMessage: homeController.displayedUsers[index].lastMessage,
                      isOnline: homeController.displayedUsers[index].isOnline,
                    ),
                    DividerLine(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
