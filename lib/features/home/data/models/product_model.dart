class ProductModel {
  final int id;
  final String image;
  final String name;
  final String description;
  final String rating;
  final String price;

  ProductModel({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
    required this.rating,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"] ?? 0,
      image: json["image"] ?? "",
      name: json["name"]?? "",
      description: json["description"]?? "",
      rating: json["rating"]?? "",
      price: json["price"]?? "",
    );
  }
}
