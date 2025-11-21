// lib/pages/cart_home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product_model.dart';
import 'cart_grid_page.dart';
import 'cart_summary_page.dart';
import '../blocs/cart_cubit.dart';

class CartHomePage extends StatelessWidget {
  final List<ProductModel> products;
  const CartHomePage({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ami Shop'),
        actions: [
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart_outlined),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CartSummaryPage()));
                    },
                  ),
                  if (state.getTotalItems() > 0)
                    Positioned(
                      right: 6,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.secondary,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${state.getTotalItems()}',
                          style: const TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ),
                ],
              );
            },
          )
        ],
      ),
      body: CartGridPage(products: products),
    );
  }
}
