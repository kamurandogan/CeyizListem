import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wedding_shopping_check/feature/product_list/service/get_list.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({super.key, required this.firebaseId});
  final String firebaseId;

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  @override
  Widget build(BuildContext context) {
    final CollectionReference products = FirebaseFirestore.instance.collection('products');

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * .05,
      ),
      child: FutureBuilder<DocumentSnapshot>(
        future: products.doc('Kitchen').get(),
        builder: (context, snapshot) {
          return GetList(snapshot, widget.firebaseId).get();
        },
      ),
    );
  }
}
