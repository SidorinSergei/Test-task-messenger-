
import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  final String userName;
  final Color userColor;

  UserProfilePage({required this.userName, required this.userColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: _buildAppBarContent(),
        elevation: 0,
        leading: _buildBackButton(context),
        toolbarHeight: 80.0,
      ),
    );
  }

  Widget _buildAppBarContent() {
    return Row(
      children: [
        _buildUserAvatar(userColor),
        SizedBox(width: 8.0),
        Text(
          userName,
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 18.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildUserAvatar(Color color) {
    String initials = _getInitials(userName);
    return CircleAvatar(
      radius: 30.0,
      backgroundColor: color,
      child: Text(
        initials,
        style: TextStyle(
          fontFamily: 'Gilroy',
          fontSize: 20.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  String _getInitials(String name) {
    List<String> names = name.split(" ");
    String initials = "";
    if (names.length > 0) {
      initials += names[0][0];
      if (names.length > 1) {
        initials += names[1][0];
      }
    }
    return initials;
  }

  Widget _buildBackButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      color: Colors.black,
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
