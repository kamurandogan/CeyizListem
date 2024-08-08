import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wedding_shopping_check/feature/product_list/widget/product_list/product_list.dart';
import 'package:widgets/error_image/error_image.dart';

final class GetList {
  final AsyncSnapshot<DocumentSnapshot<Object?>> snapshot;
  final String firebaseId;
  GetList(this.snapshot, this.firebaseId);

  Widget get() {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }

    if (snapshot.hasError) {
      if (kDebugMode) {
        print("Error fetching data: ${snapshot.error}");
      }
      ErrorImage.instance.show();
    }

    if (!snapshot.hasData || !snapshot.data!.exists) {
      if (kDebugMode) {
        print("No data found for the document ID: $firebaseId");
      }
      ErrorImage.instance.show();
    }

    final data = snapshot.data?.data() as Map<String, dynamic>?;
    if (data == null || !data.containsKey(firebaseId)) {
      if (kDebugMode) {
        print("No valid data found for key: $firebaseId");
      }
      ErrorImage.instance.show();
    }
    if (kDebugMode) {
      print('its okay');
    }

    // Veri kontrolü ve listeyi oluşturma
    final List<String> sortedList = data?[firebaseId] != null ? List<String>.from(data?[firebaseId]) : <String>[];

// Listeyi sıralama
    sortedList.sort();

// Anahtar oluşturma
    Key key = Key(sortedList.isNotEmpty ? sortedList[sortedList.length - 1] : 'default_key');

// ProductList döndürme
    return ProductList(
      myKey: key,
      list: sortedList,
    );
  }
}
