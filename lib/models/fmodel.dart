import 'dart:convert';

class Food {
  int totalSize;
  List<Product> products;

  Food({
    required this.totalSize,
    required this.products,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        totalSize: json["total_size"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  // Map<String, dynamic> toJson() => {
  //       "total_size": totalSize,
  //       "products": List<dynamic>.from(products.map((x) => x.toJson())),
  //     };
}

class Product {
  int id;
  int pid;
  String name;
  int price;
  double star;
  String img;
  String location;

  Product({
    required this.id,
    required this.pid,
    required this.name,
    required this.price,
    required this.star,
    required this.img,
    required this.location,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        pid: json["pid"],
        name: json["name"],
        price: json["price"],
        star: json["star"]?.toDouble(),
        img: json["img"],
        location: json["location"],
      );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "pid": pid,
  //       "name": name,
  //       "price": price,
  //       "star": star,
  //       "img": img,
  //       "location": location,
  //     };
}

class CartItemModel {
  late int id;
  late int pid;
  late String name;
  late int price;
  late String img;
  late int quantity;

  CartItemModel(
      {required this.id,
      required this.pid,
      required this.name,
      required this.price,
      required this.img,
      required this.quantity});

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        id: json["id"],
        pid: json["pid"],
        name: json["name"],
        price: json["price"],
        img: json["img"],
        quantity: json["quantity"],
      );
}
