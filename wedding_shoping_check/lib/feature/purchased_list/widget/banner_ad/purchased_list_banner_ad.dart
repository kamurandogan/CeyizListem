import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:wedding_shopping_check/product/service/ad_service/ad_manager.dart';

class PurchasedListBannerAd {
  static PurchasedListBannerAd? _instance;
  static PurchasedListBannerAd get instance {
    _instance ??= PurchasedListBannerAd._init();
    return _instance!;
  }

  PurchasedListBannerAd._init();

  Widget bannerAdIsAvailable() {
    if (BannerAdManager.instance.bannerAd != null) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: SafeArea(
          child: SizedBox(
            width: BannerAdManager.instance.bannerAd!.size.width.toDouble(),
            height: BannerAdManager.instance.bannerAd!.size.height.toDouble(),
            child: AdWidget(ad: BannerAdManager.instance.bannerAd!),
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
