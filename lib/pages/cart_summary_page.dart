// lib/pages/cart_summary_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart_cubit.dart';

class CartSummaryPage extends StatelessWidget {
  const CartSummaryPage({Key? key}) : super(key: key);

  String formatPrice(int price) => 'Rp ${price.toString()}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ringkasan Keranjang'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  if (state.items.isEmpty) {
                    return const Center(child: Text('Keranjang kosong'));
                  }
                  final items = state.items.values.toList();
                  return ListView.separated(
                    itemCount: items.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final cartItem = items[index];
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.asset(
                                cartItem.product.image,
                                width: 64,
                                height: 64,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(cartItem.product.name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600)),
                                    const SizedBox(height: 4),
                                    Text(formatPrice(cartItem.product.price)),
                                  ],
                                ),
                              ),
                              // Bonus: qty controls
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      final newQty = cartItem.qty - 1;
                                      context.read<CartCubit>().updateQuantity(cartItem.product, newQty);
                                    },
                                    icon: const Icon(Icons.remove_circle_outline),
                                  ),
                                  Text('${cartItem.qty}'),
                                  IconButton(
                                    onPressed: () {
                                      final newQty = cartItem.qty + 1;
                                      context.read<CartCubit>().updateQuantity(cartItem.product, newQty);
                                    },
                                    icon: const Icon(Icons.add_circle_outline),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 8),
                              IconButton(
                                onPressed: () {
                                  context.read<CartCubit>().removeFromCart(cartItem.product);
                                },
                                icon: const Icon(Icons.delete_outline),
                                tooltip: 'Hapus',
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                final totalItems = state.getTotalItems();
                final totalPrice = state.getTotalPrice();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Total item: $totalItems'),
                    const SizedBox(height: 6),
                    Text('Total harga: ${formatPrice(totalPrice)}', style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: state.items.isEmpty
                          ? null
                          : () {
                              // Checkout: clear cart
                              showDialog(
                                context: context,
                                builder: (c) {
                                  return AlertDialog(
                                    title: const Text('Konfirmasi Checkout'),
                                    content: Text('Bayar ${formatPrice(totalPrice)} untuk $totalItems item?'),
                                    actions: [
                                      TextButton(onPressed: () => Navigator.of(c).pop(), child: const Text('Batal')),
                                      ElevatedButton(
                                        onPressed: () {
                                          context.read<CartCubit>().clearCart();
                                          Navigator.of(c).pop();
                                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Transaksi selesai!')));
                                        },
                                        child: const Text('Bayar'),
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                      child: const Text('Checkout'),
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
