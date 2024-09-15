import 'package:flutter/material.dart';

/// searchbar widget
class SearchBarWidget extends StatelessWidget {
  final Function(String) onSearch;
  const SearchBarWidget({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onSearch,
      decoration: const InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
            borderSide: BorderSide(
              style: BorderStyle.solid,
              color: Color(0xffddecf5),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
            borderSide:
                BorderSide(style: BorderStyle.solid, color: Color(0xffddecf5)),
          ),
          filled: true,
          fillColor: Colors.white,
          suffixIcon:
              Icon(Icons.search, color: Colors.grey), // Search icon at the end
          contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 10)),
    );
  }
}
