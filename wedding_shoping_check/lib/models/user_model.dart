// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:wedding_shopping_check/models/product_model.dart';

class User {
  final String? name;
  double? totalPaid;
  List<Products> purchasedKitchensList;
  List<Products> purchasedBeyazsList;
  List<Products> purchasedBedroomsList;
  List<Products> purchasedSaloonsList;
  List<Products> purchasedElectronicsList;
  List<Products> purchasedHomeTextilesList;
  List<Products> purchasedHomeToolsList;
  List<Products> purchasedLightingsList;
  List<Products> purchasedDecorationsList;
  List<Products> purchasedBathroomsList;

  User({
    this.name,
    this.totalPaid,
    required this.purchasedKitchensList,
    required this.purchasedBeyazsList,
    required this.purchasedBedroomsList,
    required this.purchasedSaloonsList,
    required this.purchasedElectronicsList,
    required this.purchasedHomeTextilesList,
    required this.purchasedHomeToolsList,
    required this.purchasedLightingsList,
    required this.purchasedDecorationsList,
    required this.purchasedBathroomsList,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'totalPaid': totalPaid,
      'purchasedKitchensList': purchasedKitchensList.map((x) => x.toMap()).toList(),
      'purchasedBeyazsList': purchasedBeyazsList.map((x) => x.toMap()).toList(),
      'purchasedBedroomsList': purchasedBedroomsList.map((x) => x.toMap()).toList(),
      'purchasedSaloonsList': purchasedSaloonsList.map((x) => x.toMap()).toList(),
      'purchasedElectronicsList': purchasedElectronicsList.map((x) => x.toMap()).toList(),
      'purchasedHomeTextilesList': purchasedHomeTextilesList.map((x) => x.toMap()).toList(),
      'purchasedHomeToolsList': purchasedHomeToolsList.map((x) => x.toMap()).toList(),
      'purchasedLightingsList': purchasedLightingsList.map((x) => x.toMap()).toList(),
      'purchasedDecorationsList': purchasedDecorationsList.map((x) => x.toMap()).toList(),
      'purchasedBathroomsList': purchasedBathroomsList.map((x) => x.toMap()).toList(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] != null ? map['name'] as String : null,
      totalPaid: map['totalPaid'] != null ? map['totalPaid'] as double : null,
      purchasedKitchensList: List<Products>.from(
        (map['purchasedKitchensList'] as List<int>).map<Products>(
          (x) => Products.fromMap(x as Map<String, dynamic>),
        ),
      ),
      purchasedBeyazsList: List<Products>.from(
        (map['purchasedBeyazsList'] as List<int>).map<Products>(
          (x) => Products.fromMap(x as Map<String, dynamic>),
        ),
      ),
      purchasedBedroomsList: List<Products>.from(
        (map['purchasedBedroomsList'] as List<int>).map<Products>(
          (x) => Products.fromMap(x as Map<String, dynamic>),
        ),
      ),
      purchasedSaloonsList: List<Products>.from(
        (map['purchasedSaloonsList'] as List<int>).map<Products>(
          (x) => Products.fromMap(x as Map<String, dynamic>),
        ),
      ),
      purchasedElectronicsList: List<Products>.from(
        (map['purchasedElectronicsList'] as List<int>).map<Products>(
          (x) => Products.fromMap(x as Map<String, dynamic>),
        ),
      ),
      purchasedHomeTextilesList: List<Products>.from(
        (map['purchasedHomeTextilesList'] as List<int>).map<Products>(
          (x) => Products.fromMap(x as Map<String, dynamic>),
        ),
      ),
      purchasedHomeToolsList: List<Products>.from(
        (map['purchasedHomeToolsList'] as List<int>).map<Products>(
          (x) => Products.fromMap(x as Map<String, dynamic>),
        ),
      ),
      purchasedLightingsList: List<Products>.from(
        (map['purchasedLightingsList'] as List<int>).map<Products>(
          (x) => Products.fromMap(x as Map<String, dynamic>),
        ),
      ),
      purchasedDecorationsList: List<Products>.from(
        (map['purchasedDecorationsList'] as List<int>).map<Products>(
          (x) => Products.fromMap(x as Map<String, dynamic>),
        ),
      ),
      purchasedBathroomsList: List<Products>.from(
        (map['purchasedBathroomsList'] as List<int>).map<Products>(
          (x) => Products.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);
}
