// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:wedding_shopping_check/feature/product_list/mixin/product_list_screen_mixin.dart';
import 'package:wedding_shopping_check/feature/product_list/view/product_list_view.dart';
import 'package:wedding_shopping_check/product/constans/strings.dart';
import 'package:wedding_shopping_check/product/service/ad_service/ad_manager.dart';
import 'package:widgets/ad_widget/banner_ad_widget.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({
    super.key,
    required this.firebaseId,
  });
  final String firebaseId;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> with ProductListScreenMixin {
  @override
  void initState() {
    selectedPage = widget.firebaseId;
    BannerAdManager.instance.load();

    InterstitialAdManager.instance.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          ProductListView(firebaseId: widget.firebaseId),
          BannerAdManager.instance.bannerAd != null
              ? MyBannerAd(bannerAd: BannerAdManager.instance.bannerAd!)
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
