import 'package:hungry_app/features/product/data/models/topping_model.dart';

class CartItemModel {
  final int itemId;
  final int productId;
  final int quantity;
  final String name;
  final String image;
  final String price;
  final String spicy;
  final List<ToppingModel> toppings;
  final List<ToppingModel> sideOptions;

  CartItemModel({
    required this.itemId,
    required this.productId,
    required this.quantity,
    required this.name,
    required this.image,
    required this.price,
    required this.spicy,
    required this.toppings,
    required this.sideOptions,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      itemId: json['item_id'],
      productId: json['product_id'],
      quantity: json['quantity'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
      spicy: json['spicy'],
      toppings: (json['toppings'] as List)
          .map((topping) => ToppingModel.fromJson(topping))
          .toList(),
      sideOptions: (json['side_options'] as List)
          .map((side) => ToppingModel.fromJson(side))
          .toList(),
    );
  }
}
