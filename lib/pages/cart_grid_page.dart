// lib/pages/cart_grid_page.dart
import 'package:flutter/material.dart';
import '../widgets/product_card.dart';
import '../models/product_model.dart';

class CartGridPage extends StatelessWidget {
  final List<ProductModel> products;

  const CartGridPage({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.68,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(product: products[index]);
      },
    );
  }
}
