import 'package:hungry_app/features/cart/data/models/cart_model.dart';

class CartRequestModel {
  final List<CartModel> items ;

  CartRequestModel(this.items);

  Map<String,dynamic> toJson() => {
    "items" :  items.map((e) => e.toJson(),).toList() ,
  };
}