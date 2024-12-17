import 'package:flutter/material.dart';
import 'package:patch_assessment/constants/app_constants.dart';
import 'package:patch_assessment/models/products_model.dart';

Widget productCardWidget(ProductModel product) {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
      side: BorderSide(
        color: kColorPallet1,
        width: 2,
      ),
    ),
    child: Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius:
              const BorderRadius.vertical(
                  top: Radius.circular(15)),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              product.image,
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[200],
                  child: const Icon(
                      Icons.broken_image),
                );
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 10, right: 10),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  product.title,
                  style: kProductTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  product.description,
                  style: kProductDescription,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: kProductPrice,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
