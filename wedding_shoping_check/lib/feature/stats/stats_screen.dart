// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:wedding_shopping_check/feature/stats/widget/pie_chart.dart';
import 'package:wedding_shopping_check/product/service/ad_service/ad_manager.dart';

class StatsView extends StatefulWidget {
  const StatsView({super.key});

  @override
  State<StatsView> createState() => _StatsViewState();
}

class _StatsViewState extends State<StatsView> {
  @override
  void initState() {
    BannerAdManager.instance.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Stack(
          children: [
            const PieChart(),
            if (BannerAdManager.instance.bannerAd != null)
              Align(
                alignment: Alignment.bottomCenter,
                child: SafeArea(
                  child: SizedBox(
                    width: BannerAdManager.instance.bannerAd!.size.width.toDouble(),
                    height: BannerAdManager.instance.bannerAd!.size.height.toDouble(),
                    child: AdWidget(ad: BannerAdManager.instance.bannerAd!),
                  ),
                ),
              )
            else
              const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
