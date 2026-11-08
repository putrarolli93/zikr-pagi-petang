import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdService {
  // AdMob Application ID: ca-app-pub-5079073523461972~2997669121

  // 100% Real Production Ad Unit IDs
  static const String bannerAdUnitId =
      'ca-app-pub-5079073523461972/6170627374';
  static const String interstitialAdUnitId =
      'ca-app-pub-5079073523461972/9100043046';
  static const String nativeAdUnitId =
      'ca-app-pub-5079073523461972/7647360576';

  static InterstitialAd? _interstitialAd;
  static bool _isInterstitialAdLoading = false;

  // Frequency Capping & Cooldown Configuration
  static int _clickCounter = 0;
  static DateTime? _lastAdShownTime;

  /// Show interstitial ad every [clicksInterval] clicks (e.g. 3 clicks)
  /// with a minimum [cooldownSeconds] seconds cooldown (e.g. 90 seconds)
  static const int clicksInterval = 3;
  static const int cooldownSeconds = 90;

  /// Initialize MobileAds SDK
  static Future<void> init() async {
    try {
      // Register test device ID in debug mode to comply with Google AdMob policy
      if (kDebugMode) {
        await MobileAds.instance.updateRequestConfiguration(
          RequestConfiguration(
            testDeviceIds: [
              '793B6FEFB2154D589F2515EAEA312AAA', // Registered Samsung test device ID
            ],
          ),
        );
      }

      final status = await MobileAds.instance.initialize();
      debugPrint('MobileAds initialized: ${status.adapterStatuses}');

      // Delay initial ad load by 1.5s so Android System WebView completes binding
      Future.delayed(const Duration(milliseconds: 1500), () {
        loadInterstitialAd();
      });
    } catch (e) {
      debugPrint('Error initializing MobileAds: $e');
    }
  }

  /// Preload Interstitial Ad
  static void loadInterstitialAd({bool useFallback = false}) {
    if (_isInterstitialAdLoading || _interstitialAd != null) return;
    _isInterstitialAdLoading = true;

    final adUnitId = (kDebugMode && useFallback)
        ? 'ca-app-pub-3940256099942544/1033173712'
        : interstitialAdUnitId;

    InterstitialAd.load(
      adUnitId: adUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _isInterstitialAdLoading = false;
          debugPrint(
              '✅ InterstitialAd loaded successfully! (Unit ID: $adUnitId)');
        },
        onAdFailedToLoad: (error) {
          debugPrint(
              '❌ InterstitialAd failed to load ($adUnitId): ${error.message} (code: ${error.code})');
          _interstitialAd = null;
          _isInterstitialAdLoading = false;

          // If production unit ID failed in debug mode (e.g. No Fill error code 3), use official test ad fallback
          if (kDebugMode && !useFallback) {
            debugPrint(
                '⚠️ Production interstitial unit ID returned no fill in debug mode. Falling back to AdMob Test Interstitial ID...');
            loadInterstitialAd(useFallback: true);
            return;
          }

          // Retry loading after 5 seconds
          Future.delayed(const Duration(seconds: 5), () {
            loadInterstitialAd();
          });
        },
      ),
    );
  }

  /// Show Interstitial Ad with Click Counter & Time Cooldown Frequency Capping
  static void showInterstitialAd({required VoidCallback onComplete}) {
    _clickCounter++;
    debugPrint(
        '📊 Interstitial click counter: $_clickCounter/$clicksInterval');

    final now = DateTime.now();
    final isCooldownPassed = _lastAdShownTime == null ||
        now.difference(_lastAdShownTime!).inSeconds >= cooldownSeconds;

    final shouldShowAd =
        (_clickCounter >= clicksInterval) && isCooldownPassed;

    if (shouldShowAd && _interstitialAd != null) {
      _clickCounter = 0;
      _lastAdShownTime = now;
      debugPrint('🎬 Threshold reached & cooldown passed. Showing Interstitial Ad!');

      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          debugPrint('InterstitialAd dismissed.');
          ad.dispose();
          _interstitialAd = null;
          loadInterstitialAd();
          onComplete();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          debugPrint('InterstitialAd failed to show: ${error.message}');
          ad.dispose();
          _interstitialAd = null;
          loadInterstitialAd();
          onComplete();
        },
      );
      _interstitialAd!.show();
    } else {
      if (!shouldShowAd) {
        debugPrint(
            '⚡ Skipping InterstitialAd for user comfort (clicks: $_clickCounter/$clicksInterval, cooldown passed: $isCooldownPassed).');
      } else {
        debugPrint(
            'ℹ️ InterstitialAd not ready yet. Executing action directly.');
        loadInterstitialAd();
      }
      onComplete();
    }
  }
}
