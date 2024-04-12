import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  String title;
  String description;
  String price;
  String rating;
  String category;
  String thumbnail;
  String id;

  Product({
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.category,
    required this.thumbnail,
    required this.id,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        title: json["title"],
        description: json["description"],
        price: json["price"],
        rating: json["rating"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "price": price,
        "rating": rating,
        "category": category,
        "thumbnail": thumbnail,
        "id": id,
      };
}

// class Product {
//   final int id;
//   final String title;
//   final String price;
//   final String rating;
//   final String category;
//   final String thumbnail;

//   const Product({
//     required this.id,
//     required this.title,
//     required this.price,
//     required this.rating,
//     required this.category,
//     required this.thumbnail,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return switch (json) {
//       {
//         'id': int id,
//         'title': String title,
//         'price': String price,
//         'rating': String rating,
//         'category': String category,
//         'thumbnail': String thumbnail,
//       } =>
//         Product(
//           id: id,
//           title: title,
//           price: price,
//           rating: rating,
//           category: category,
//           thumbnail: thumbnail,
//         ),
//       _ => throw const FormatException('Error'),
//     };
//   }
// }
