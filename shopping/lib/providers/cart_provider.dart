import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/product.dart';

part 'cart_provider.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  Set<Product> build() {
    return const { };
  }

  void add(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  void remove(Product product) {
    if (state.contains(product)) {
      state = state.where((p) => p.id != product.id).toSet();
    }
  }
}

// manual
// final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(() {
//   return CartNotifier();
// });

@riverpod
int cartTotal(ref) {
  final cartProducts = ref.watch(cartNotifierProvider);
  int total = 0;

  for (Product product in cartProducts) {
    total += product.price;
  }

  return total;
}

@riverpod
int cartCount(ref) {
  final cartProducts = ref.watch(cartNotifierProvider);
  return cartProducts.length;
}