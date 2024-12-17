import 'package:flutter/material.dart';
import 'package:patch_assessment/constants/app_constants.dart';
import 'package:patch_assessment/models/products_model.dart';
import 'package:patch_assessment/provider/product_provider.dart';
import 'package:patch_assessment/widgets/category_widget.dart';
import 'package:patch_assessment/widgets/custom_navbar.dart';
import 'package:patch_assessment/widgets/placeholder_widget.dart';
import 'package:patch_assessment/widgets/product_card_widget.dart';
import 'package:patch_assessment/widgets/searchbar_widget.dart';
import 'package:patch_assessment/widgets/sorting_chip_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLowestPriceFirst = true;
  String? _selectedCategory;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) {
      context
          .read<ProductProvider>()
          .fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          const CustomNavBar(currentIndex: 0),
      body: Stack(
        children: [
          // Purple background section
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context)
                    .size
                    .height *
                0.18,
            child: Container(
              color: kColorPallet1,
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                const Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 16.0),
                  child: SearchBarWidget(),
                ),

                // Title and Product Count
                Padding(
                  padding:
                      const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      const Text(
                          'Choose from any category',
                          style: kTitleText),
                      const SizedBox(height: 10),
                      Consumer<ProductProvider>(
                        builder: (context,
                            productProvider,
                            child) {
                          return productProvider
                                  .isLoading
                              ? const CategoryChipPlaceholder()
                              : buildCategoryChips(
                                  context,
                                  _selectedCategory,
                                  (category) {
                                  setState(() {
                                    _selectedCategory =
                                        category;
                                  });
                                });
                        },
                      ),
                      const SizedBox(height: 10),
                      const Text(
                          '30 products to choose from',
                          style: kTitleText),
                    ],
                  ),
                ),

                // Sorting Options
                Padding(
                  padding:
                      const EdgeInsets.symmetric(
                          horizontal: 16.0),
                  child: Row(
                    children: [
                      buildSortChip(
                          'Lowest Price',
                          _isLowestPriceFirst,
                          (value) => setState(() {
                                _isLowestPriceFirst =
                                    true;
                              })),
                      const SizedBox(width: 8),
                      buildSortChip(
                          'Highest Price',
                          !_isLowestPriceFirst,
                          (value) => setState(() {
                                _isLowestPriceFirst =
                                    false;
                              })),
                    ],
                  ),
                ),

                // Product Grid
                Expanded(
                  child:
                      Consumer<ProductProvider>(
                    builder: (context,
                        productProvider, child) {
                      if (productProvider
                          .isLoading) {
                        return const ProductGridPlaceholder();
                      }

                      if (productProvider.error !=
                          null) {
                        return Center(
                            child: Text(
                                'Error: ${productProvider.error}'));
                      }

                      // Filter products by category if a category is selected
                      List<ProductModel>
                          filteredProducts =
                          _selectedCategory !=
                                  null
                              ? productProvider
                                  .getProductsByCategory(
                                      _selectedCategory!)
                              : productProvider
                                  .products;

                      // Then sort the filtered products
                      List<ProductModel>
                          displayProducts =
                          productProvider.sortProducts(
                              filteredProducts,
                              _isLowestPriceFirst);

                      return GridView.builder(
                        padding:
                            const EdgeInsets.all(
                                16),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: displayProducts
                            .length,
                        itemBuilder:
                            (context, index) {
                          return productCardWidget(
                              displayProducts[
                                  index]);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
