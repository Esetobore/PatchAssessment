import 'package:flutter/material.dart';
import 'package:patch_assessment/constants/app_constants.dart';

Widget buildCategoryChips(
    BuildContext context,
    String? selectedCategory,
    Function(String?) onCategorySelected) {
  final Map<String, String> categoryImages = {
    'electronics':
        'assets/images/electronics.jpg',
    'jewelery': 'assets/images/jewelry.jpg',
    "men's clothing":
        'assets/images/mens_clothing.jpg',
    "women's clothing":
        'assets/images/womens_clothing.jpg',
  };

  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children:
          categoryImages.keys.map((category) {
        return Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 8.0),
          child: GestureDetector(
            onTap: () => onCategorySelected(
                selectedCategory == category
                    ? null
                    : category),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: kColorPallet2,
                  backgroundImage: AssetImage(
                      categoryImages[category]!),
                ),
                const SizedBox(height: 8),
                Text(
                  category
                      .split("'")
                      .first
                      .toUpperCase(),
                  style: TextStyle(
                    color: selectedCategory ==
                            category
                        ? kColorPallet1
                        : Colors.black,
                    fontWeight:
                        selectedCategory ==
                                category
                            ? FontWeight.bold
                            : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    ),
  );
}
