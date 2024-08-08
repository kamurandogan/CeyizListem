// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:wedding_shopping_check/feature/purchased_list/mixin/purchased_list_mixin.dart';
import 'package:wedding_shopping_check/feature/purchased_list/view/purchased_list_view_companent/purchased_listview.dart';
import 'package:wedding_shopping_check/feature/purchased_list/widget/banner_ad/purchased_list_banner_ad.dart';
import 'package:wedding_shopping_check/models/product_model.dart';
import 'package:wedding_shopping_check/product/service/ad_service/ad_manager.dart';
import 'package:widgets/paddings/paddings.dart';

class PurchasedListWidget extends StatefulWidget {
  const PurchasedListWidget({
    super.key,
    required this.firebaseId,
    required List<Products> list,
  });

  final String firebaseId;

  @override
  State<PurchasedListWidget> createState() => _PurchasedListWidgetState();
}

class _PurchasedListWidgetState extends State<PurchasedListWidget> with PurchasedListMixin {
  @override
  void initState() {
    BannerAdManager.instance.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Padding(
              padding: CommonPaddings.instance.columnPadding,
              child: PurchasedListview(
                firebaseId: widget.firebaseId,
              )),
          PurchasedListBannerAd.instance.bannerAdIsAvailable(),
        ],
      ),
    );
  }
}
