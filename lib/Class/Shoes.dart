// To parse this JSON data, do
//
//     final shoes = shoesFromMap(jsonString);

import 'dart:convert';

import 'package:shoppingapp/Values/app_images.dart';

Shoes shoesFromMap(String str) => Shoes.fromMap(json.decode(str));

String shoesToMap(Shoes data) => json.encode(data.toMap());

class Shoes {
  final int id;
  final String title;
  final String image;
  final String content;
  final int price;
  final int quantity;
  final int? total;
  final int? quanti;

  Shoes({
    required this.id,
    required this.title,
    required this.image,
    required this.content,
    required this.price,
    required this.quantity,
    this.total,
    this.quanti,
  });

  factory Shoes.fromMap(Map<String, dynamic> json) => Shoes(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        content: json["content"],
        price: json["price"],
        quantity: json["quantity"],

      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "image": image,
        "content": content,
        "price": price,
        "quantity": quantity,
     
      };

  Shoes copyWith(int? quanti, int? total) {
    return Shoes(
        id: id,
        title: title,
        image: image,
        content: content,
        price: price,
        quantity: quantity,
        quanti: quanti ?? this.quanti,
        total: total ?? this.total,
        );
  }
}

List<Shoes> productShoes = [
  Shoes(
      id: 1,
      title: "Nike Air Max",
      image: MyImages.shoes1,
      content:
          "The Nike Air Max 270 is red-hot! These low-top kicks are all about the big Air unit that’s impossible to ignore. Structured, comfy and made for all-day wear—who’s ready to bring the heat?",
      price: 130,
      quantity: 20,),
  Shoes(
      id: 2,
      title: "Air Jordan 1 High OG Craft",
      image: MyImages.shoes2,
      content:
          "Heat the streets with this crafted take on the AJ1. Luxe leather gets the Light Olive and Pale Ivory treatment, finished to perfection with blazing Bright Mandarin accents",
      price: 180,
      quantity: 20,),
  Shoes(
      id: 3,
      title: "Nike Air Force",
      image: MyImages.shoes3,
      content:
          "Kick it in comfort in the Nike Air Force 1. The feel of classic leather and details that made this shoe an icon are sure to make your sneaker style stand out on the street.",
      price: 80,
      quantity: 20,),
  Shoes(
      id: 4,
      title: "Air Jordan 14",
      image: MyImages.shoes4,
      content:
          "Heat the streets with this crafted take on the AJ1. Luxe leather gets the Light Olive and Pale Ivory treatment, finished to perfection with blazing Bright Mandarin accents",
      price: 123,
      quantity: 20,),
  Shoes(
      id: 5,
      title: "Air Jordan 1 Low",
      image: MyImages.shoes5,
      content:
          "Always in, always fresh. The Air Jordan 1 Low sets you up with a piece of Jordan history and heritage that's comfortable all day.",
      price: 115,
      quantity: 20,),
  Shoes(
      id: 6,
      title: "Air Jordan 1 Mid SE",
      image: MyImages.shoes6,
      content:
          "Up your AJ1 game. This luxe, tonal edition features stonewashed suede, heritage leather, and waxed laces. Lace up and hit that tunnel.",
      price: 135,
      quantity: 20,),
];

List<Shoes> productCarts = [];
