// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/cart_cubit.dart';
import 'pages/cart_home_page.dart';
import 'models/product_model.dart';

void main() {
  runApp(const AmiCartApp());
}

class AmiCartApp extends StatelessWidget {
  const AmiCartApp({Key? key}) : super(key: key);

  // sample product list using your images
  List<ProductModel> getSampleProducts() {
    return [
      ProductModel(id: 'p1', name: 'Baju Keren 1', price: 120000, image: 'assets/images/baju1.jpg'),
      ProductModel(id: 'p2', name: 'Baju Keren 2', price: 150000, image: 'assets/images/baju2.jpg'),
      ProductModel(id: 'p3', name: 'Baju Keren 3', price: 90000, image: 'assets/images/baju3.jpg'),
      // duplicate variants to fill grid
      ProductModel(id: 'p4', name: 'Baju Limited 4', price: 175000, image: 'assets/images/baju1.jpg'),
      ProductModel(id: 'p5', name: 'Baju Casual 5', price: 80000, image: 'assets/images/baju2.jpg'),
      ProductModel(id: 'p6', name: 'Baju Retro 6', price: 110000, image: 'assets/images/baju3.jpg'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // Palet: pastel ungu / peach / sand (hindari biru/hijau)
    final primary = Colors.deepPurple;
    final secondary = Colors.purpleAccent;

    return BlocProvider(
      create: (_) => CartCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ami Shop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple).copyWith(
            secondary: secondary,
          ),
          scaffoldBackgroundColor: const Color(0xFFF7F3FF), // very light purple-ish
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 2,
            ),
          ),
        ),
        home: CartHomePage(products: getSampleProducts()),
      ),
    );
  }
}
