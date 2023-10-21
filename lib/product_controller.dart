import 'package:ecommerceapp/product_list.dart';
import 'package:ecommerceapp/products_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductNotifier extends StateNotifier<List<ProductModel>> {
  ProductNotifier() : super(productItems);

  void toggleExpand(int index) {
    if (index >= 0 && index < state.length) {
      final updatedState = List<ProductModel>.from(state);
      updatedState[index] = state[index].copyWith(isExpanded: !state[index].isselected);
      state = updatedState;
    }
  }
}

final productNotifierProvider = StateNotifierProvider<ProductNotifier, List<ProductModel>>((ref) {
  return ProductNotifier();
});
