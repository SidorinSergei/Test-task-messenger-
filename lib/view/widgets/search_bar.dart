import 'package:flutter/material.dart';

class SearchBar<T> extends StatelessWidget {
  final String labelText;
  final ValueChanged<T>? onTextChanged;

  const SearchBar({
    Key? key,
    required this.labelText,
    this.onTextChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Color(0xFFEDF2F6),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/search.png',
            width: 24,
            height: 24,
            color: Color(0xFF9DB7CB),
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: TextField(
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 16,
                color: Color(0xFF2B333E),
              ),
              onChanged: (value) {
                if (onTextChanged != null) {
                  onTextChanged!(value as T);
                }
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: labelText,
                labelStyle: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 16,
                  color: Color(0xFF9DB7CB),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
