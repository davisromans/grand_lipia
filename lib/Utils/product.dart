import 'dart:convert';
import 'dart:io';
import 'package:test_app/Utils/rating.dart';

class Product {
  final String name;
  final String description;
  final String location;
  final List<String> images;
  final String buyer;
  final String seller;
  final double price;
  final String? id;
  final String status;
  final String dealer;
  final String url;
  final String buyerImage;
  final String receiver;
  final String sellerId;
  final String deliveryDate;
  final String terminate;
  final String buyerRating;
  final String sellerRating;
  Product({
    required this.name,
    required this.description,
    required this.location,
    required this.images,
    required this.buyer,
    required this.seller,
    required this.price,
    required this.status,
    required this.dealer,
    required this.url,
    required this.buyerImage,
    required this.receiver,
    required this.sellerId,
    required this.deliveryDate,
    required this.terminate,
    required this.buyerRating,
    required this.sellerRating,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'location': location,
      'images': images,
      'buyer': buyer,
      'seller': seller,
      'price': price,
      'id': id,
      'status': status,
      'dealer': dealer,
      'url': url,
      'buyerImage': buyerImage,
      'receiver': receiver,
      'sellerId' : sellerId,
      'deliveryDate' : deliveryDate,
      'terminate' : terminate,
      'buyerRating' : buyerRating,
      'sellerRating' : sellerRating,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      status: map['status'] ?? '',
      buyerImage: map['buyerImage'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      location: map['location'] ?? '',
      url: map['url'] ?? '',
      images: List<String>.from(map['images']),
      buyer: map['buyer'] ?? '',
      seller: map['seller'] ?? '',
      dealer: map['dealer'] ?? '',
      receiver: map['receiver'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      id: map['_id'],
      sellerId: map['sellerId'] ?? '',
      terminate: map['terminate'] ?? '',
      deliveryDate: map['deliveryDate'] ?? '',
      buyerRating: map['buyerRating'] ?? '',
      sellerRating: map['sellerRating'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}


