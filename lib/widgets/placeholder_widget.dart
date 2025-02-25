import 'package:flutter/material.dart';
import 'package:patch_assessment/constants/app_constants.dart';
import 'package:shimmer/shimmer.dart';

class ProductGridPlaceholder
    extends StatelessWidget {
  const ProductGridPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return _buildPlaceholderCard();
      },
    );
  }

  Widget _buildPlaceholderCard() {
    return Shimmer.fromColors(
      baseColor: kColorPallet3,
      highlightColor: kColorPallet2,
      child: Container(
        decoration: BoxDecoration(
          color: kColorPallet2,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              color: kColorPallet1,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 20,
                    color: kColorPallet2,
                  ),
                  const SizedBox(height: 8),
                  // Placeholder for product price
                  Container(
                    width: 100,
                    height: 20,
                    color: kColorPallet2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryChipPlaceholder
    extends StatelessWidget {
  const CategoryChipPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(5, (index) {
          return Padding(
            padding:
                const EdgeInsets.only(right: 8.0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Chip(
                label: Container(
                  width: 80,
                  height: 20,
                  color: Colors.white,
                ),
                backgroundColor: Colors.white,
              ),
            ),
          );
        }),
      ),
    );
  }
}
