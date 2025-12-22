class OrderHistoryModel {
  final int id;
  final String status;
  final String totalPrice;
  final String createdAt;
  final String image;

  OrderHistoryModel({
    required this.id,
    required this.status,
    required this.totalPrice,
    required this.createdAt,
    required this.image,
  });

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) {
    return OrderHistoryModel(
      id: json["id"],
      status: json["status"],
      totalPrice: json["total_price"],
      createdAt: json["created_at"],
      image: json["product_image"],
    );
  }
}



        ///     {
        //     "id": 127,
        //     "status": "confirmed",
        //     "total_price": "760.00",
        //     "created_at": "2025-12-22 08:12",
        //     "product_image": "http://sonic-zdi0.onrender.com/storage/products/cheeseburger.jpg"
        // }