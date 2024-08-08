// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Products {
  String? name;
  String? brand;
  double? price;
  int? piece;
  bool? isPurchased;
  List<String> image = [];

  Products({
    this.name,
    this.brand,
    this.price,
    this.piece,
    this.isPurchased,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'brand': brand,
      'price': price,
      'piece': piece,
      'isPurchased': isPurchased,
      'image': image,
    };
  }

  factory Products.fromMap(Map<String, dynamic> map) {
    return Products(
      name: map['name'] != null ? map['name'] as String : null,
      brand: map['brand'] != null ? map['brand'] as String : null,
      price: map['price'] != null ? map['price'] as double : null,
      piece: map['piece'] != null ? map['piece'] as int : null,
      isPurchased:
          map['isPurchased'] != null ? map['isPurchased'] as bool : null,
      image: (map['image'] as List).map((item) => item.toString()).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Products.fromJson(String source) =>
      Products.fromMap(json.decode(source) as Map<String, dynamic>);
}
