import 'package:flutter/material.dart';
import 'package:patch_assessment/constants/app_constants.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 16, bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          color: kColorPallet2,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color:
                  Colors.black.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: const TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                vertical: 20),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            hintText: 'What are you looking for?',
            hintStyle:
                TextStyle(color: Colors.grey),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
