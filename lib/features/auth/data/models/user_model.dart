class UserModel {
  final String name;
  final String email;
  final String? imageUrl;
  final String? token;
  final String? address;
  final String? visa;

  UserModel({
    required this.name,
    required this.email,
    this.imageUrl,
    this.address,
    this.visa,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name: json["name"] ?? "",
    email: json["email"] ?? "",
    imageUrl: json["image"] ?? "",
    token: json["token"] ?? "",
    address: json["address"] ?? "",
    visa: json["Visa"] ?? "",
  );
}
