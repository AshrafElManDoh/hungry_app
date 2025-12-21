import 'package:hungry_app/features/cart/data/models/cart_item_model.dart';

class CartDataModel {
  final int id;
  final String totalPrice;
  final List<CartItemModel> items;

  CartDataModel({
    required this.id,
    required this.totalPrice,
    required this.items,
  });

  factory CartDataModel.fromJson(Map<String, dynamic> json) {
    return CartDataModel(
      id: json['id'],
      totalPrice: json['total_price'],
      items: (json['items'] as List)
          .map((item) => CartItemModel.fromJson(item))
          .toList(),
    );
  }
}
