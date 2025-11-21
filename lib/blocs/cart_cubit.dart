// lib/blocs/cart_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/product_model.dart';

class CartItem {
  final ProductModel product;
  final int qty;
  CartItem({required this.product, required this.qty});

  CartItem copyWith({ProductModel? product, int? qty}) {
    return CartItem(
      product: product ?? this.product,
      qty: qty ?? this.qty,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'product': product.toMap(),
      'qty': qty,
    };
  }
}

class CartState extends Equatable {
  final Map<String, CartItem> items; // key = product.id

  const CartState({required this.items});

  factory CartState.initial() => const CartState(items: {});

  CartState copyWith({Map<String, CartItem>? items}) {
    return CartState(items: items ?? this.items);
  }

  int getTotalItems() {
    int total = 0;
    for (var item in items.values) {
      total += item.qty;
    }
    return total;
  }

  int getTotalPrice() {
    int total = 0;
    for (var item in items.values) {
      total += item.product.price * item.qty;
    }
    return total;
  }

  @override
  List<Object?> get props => [items];
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState.initial());

  void addToCart(ProductModel product) {
    final current = Map<String, CartItem>.from(state.items);
    if (current.containsKey(product.id)) {
      final exist = current[product.id]!;
      current[product.id] = exist.copyWith(qty: exist.qty + 1);
    } else {
      current[product.id] = CartItem(product: product, qty: 1);
    }
    emit(state.copyWith(items: current));
  }

  void removeFromCart(ProductModel product) {
    final current = Map<String, CartItem>.from(state.items);
    if (current.containsKey(product.id)) {
      current.remove(product.id);
      emit(state.copyWith(items: current));
    }
  }

  void updateQuantity(ProductModel product, int qty) {
    if (qty <= 0) {
      removeFromCart(product);
      return;
    }
    final current = Map<String, CartItem>.from(state.items);
    if (current.containsKey(product.id)) {
      final item = current[product.id]!;
      current[product.id] = item.copyWith(qty: qty);
      emit(state.copyWith(items: current));
    }
  }

  int getTotalItems() => state.getTotalItems();

  int getTotalPrice() => state.getTotalPrice();

  void clearCart() {
    emit(state.copyWith(items: {}));
  }
}
