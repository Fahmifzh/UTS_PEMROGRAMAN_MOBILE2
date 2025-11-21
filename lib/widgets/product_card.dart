// lib/widgets/product_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product_model.dart';
import '../blocs/cart_cubit.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  String formatPrice(int price) {
    // sederhana: Rp 10.000
    return 'Rp ${price.toString()}';
  }

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(12);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: radius),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: radius.topLeft),
              child: Image.asset(
                product.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 14)),
                const SizedBox(height: 4),
                Text(formatPrice(product.price),
                    style: const TextStyle(fontSize: 13)),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<CartCubit>().addToCart(product);
                      final snack = SnackBar(
                        content: Text('"${product.name}" ditambahkan ke keranjang'),
                        duration: const Duration(milliseconds: 700),
                        behavior: SnackBarBehavior.floating,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snack);
                    },
                    child: const Text('Tambah'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
