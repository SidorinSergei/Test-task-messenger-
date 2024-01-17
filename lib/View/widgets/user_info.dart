import 'package:flutter/material.dart';
import 'dart:math';

class UserBlock extends StatelessWidget {
  final String userName;
  final String lastMessage;
  final bool isOnline;

  UserBlock({
    required this.userName,
    required this.lastMessage,
    required this.isOnline,
  });

  Color _generateUserColor(String userName) {
    final int hash = userName.hashCode;
    final Random random = Random(hash);
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color userColor = _generateUserColor(userName);

    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUserAvatar(userColor),
            SizedBox(width: 8.0),
            _buildUserInfo(),
            Spacer(),
            if (isOnline) _buildOnlineIndicator(),
          ],
        ),
      ),
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

  Widget _buildUserInfo() {
    String truncatedMessage =
    lastMessage.length > 40 ? lastMessage.substring(0, 30) + "..." : lastMessage;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          userName,
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          truncatedMessage,
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 12.0,
            color: Colors.grey,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildOnlineIndicator() {
    return Container(
      width: 10.0,
      height: 10.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.green,
      ),
    );
  }
}
