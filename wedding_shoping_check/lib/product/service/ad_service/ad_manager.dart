import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class InterstitialAdManager {
  static InterstitialAdManager? _instance;
  static InterstitialAdManager get instance {
    _instance ??= InterstitialAdManager._init();
    return _instance!;
  }

  InterstitialAdManager._init();

// interstitial ad
  InterstitialAd? _interstitialAd;

// interstitial ad constants
  final String interstitialAdTest = 'ca-app-pub-3940256099942544/1033173712';

  Future<void> load() async {
    await InterstitialAd.load(
      adUnitId: kDebugMode ? interstitialAdTest : dotenv.env['INTERSTITIAL_AD_ID']!,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;

          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdShowedFullScreenContent: (InterstitialAd ad) {
              if (kDebugMode) {
                print('Interstitial ad showed.');
              }
            },
            onAdImpression: (InterstitialAd ad) {
              if (kDebugMode) {
                print('Interstitial ad impression occurred.');
              }
            },
            onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError err) {
              ad.dispose();
              if (kDebugMode) {
                print('Interstitial ad failed to show: $err');
              }
            },
            onAdDismissedFullScreenContent: (InterstitialAd ad) {
              ad.dispose();
              if (kDebugMode) {
                print('Interstitial ad dismissed.');
              }
              load();
            },
            onAdClicked: (InterstitialAd ad) {
              if (kDebugMode) {
                print('Interstitial ad clicked.');
              }
            },
          );

          if (kDebugMode) {
            print('Interstitial ad loaded: $ad');
          }
        },
        onAdFailedToLoad: (LoadAdError error) {
          if (kDebugMode) {
            print('Interstitial ad failed to load: $error');
          }
        },
      ),
    );
  }

  void show() {
    if (_interstitialAd != null) {
      _interstitialAd!.show();
      _interstitialAd = null; // Reklam gösterildikten sonra sıfırlayın
    } else {
      if (kDebugMode) {
        print('Interstitial ad is not ready yet.');
      }
    }
  }
}

class BannerAdManager {
  static BannerAdManager? _instance;
  static BannerAdManager get instance {
    _instance ??= BannerAdManager._init();
    return _instance!;
  }

  BannerAdManager._init();

  bool isLoaded = false;

  // banner ad
  BannerAd? bannerAd;

// banner ad constants

  final String bannerAdTest = 'ca-app-pub-3940256099942544/6300978111';

  void load() {
    bannerAd = BannerAd(
      adUnitId: kDebugMode ? bannerAdTest : dotenv.env['BANNER_AD_ID']!,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          isLoaded = true;
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          // Dispose the ad here to free resources.
          ad.dispose();

          // Print error message for debugging.
          if (kDebugMode) {
            print('Ad failed to load: $err');
          }
        },
      ),
    )..load();
  }
}
