import 'dart:convert';

class User {
  final String id;
  final String name;
  final String phone;
  final String password;
  final String type;
  final String token;
  final String address;

  User( {
    required this.id,
    required this.name,
    required this.phone,
    required this.password,
    required this.type,
    required this.token,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'password': password,
      'type': type,
      'token': token,
      'address': address,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      password: map['password'] ?? '',
      type: map['type'] ?? '',
      token: map['token'] ?? '',
      address: map['address'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  User copyWith({
    String? id,
    String? name,
    String? phone,
    String? password,
    String? type,
    String? token,
    String? address,

    List<dynamic>? cart,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      type: type ?? this.type,
      token: token ?? this.token,
      address: token ?? this.address,
    );
  }
}

class updateUser {
  final String id;
  final String name;
  final String phone;
  final String password;
  final String productPhone;
  final List<String> images;

  updateUser( {
    required this.id,
    required this.name,
    required this.phone,
    required this.password,
    required this.images,
    required this.productPhone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'password': password,
      'images': images,
      'productPhone': productPhone,
    };
  }

  factory updateUser.fromMap(Map<String, dynamic> map) {
    return updateUser(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      productPhone: map['productPhone'] ?? '',
      password: map['password'] ?? '',
      images: List<String>.from(map['images']),
    );
  }

  String toJson() => json.encode(toMap());

  factory updateUser.fromJson(String source) => updateUser.fromMap(json.decode(source));

  updateUser copyWith({
    String? id,
    String? name,
    String? phone,

  }) {
    return updateUser(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      password: password,
      images: images,
      productPhone: phone ?? this.productPhone,
    );
  }
}
