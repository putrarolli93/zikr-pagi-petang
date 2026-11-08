import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../services/ad_service.dart';

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({super.key});

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  BannerAd? _bannerAd;
  bool _isAdLoaded = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) _loadBannerAd();
    });
  }

  void _loadBannerAd({bool useFallback = false}) {
    // In debug mode, if production fails or for testing, fall back to official AdMob test banner ID
    final adUnitId = (kDebugMode && useFallback)
        ? 'ca-app-pub-3940256099942544/6300978111'
        : AdService.bannerAdUnitId;

    _bannerAd = BannerAd(
      adUnitId: adUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          debugPrint(
              '✅ BannerAd loaded successfully! (Unit ID: $adUnitId)');
          if (mounted) {
            setState(() {
              _isAdLoaded = true;
            });
          }
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint(
              '❌ BannerAd failed to load ($adUnitId): ${error.message} (code: ${error.code})');
          ad.dispose();
          if (mounted) {
            setState(() {
              _isAdLoaded = false;
            });
          }

          // If production unit ID failed in debug mode (e.g. No Fill error code 3), use official test ad fallback
          if (kDebugMode && !useFallback) {
            debugPrint(
                '⚠️ Production banner unit ID returned no fill in debug mode. Falling back to AdMob Test Banner ID...');
            if (mounted) _loadBannerAd(useFallback: true);
            return;
          }

          // Retry loading after 5 seconds
          Future.delayed(const Duration(seconds: 5), () {
            if (mounted) _loadBannerAd();
          });
        },
      ),
    );

    _bannerAd!.load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isAdLoaded || _bannerAd == null) {
      return const SizedBox.shrink();
    }

    return Container(
      width: _bannerAd!.size.width.toDouble(),
      height: _bannerAd!.size.height.toDouble(),
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: AdWidget(ad: _bannerAd!),
    );
  }
}
