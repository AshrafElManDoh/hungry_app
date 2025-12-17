class ToppingModel {
  final int id;
  final String image;
  final String name;

  ToppingModel({required this.image, required this.name, required this.id});

  factory ToppingModel.fromJson(Map<String, dynamic> json) =>
      ToppingModel(image: json["image"], name: json["name"], id: json["id"]);
}
