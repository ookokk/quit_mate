import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdContainer extends StatefulWidget {
  const AdContainer({super.key});

  @override
  AdContainerState createState() => AdContainerState();
}

class AdContainerState extends State<AdContainer> {
  static const _insets = 16.0;
  AdManagerBannerAd? _inlineAdaptiveAd;
  bool _isLoaded = false;
  AdSize? _adSize;
  late Orientation _currentOrientation;

  double get _adWidth => MediaQuery.of(context).size.width - (2 * _insets);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _currentOrientation = MediaQuery.of(context).orientation;
    _loadAd();
  }

  void _loadAd() async {
    await _inlineAdaptiveAd?.dispose();
    setState(() {
      _inlineAdaptiveAd = null;
      _isLoaded = false;
    });
    AdSize size = AdSize.getCurrentOrientationInlineAdaptiveBannerAdSize(
        _adWidth.truncate());

    _inlineAdaptiveAd = AdManagerBannerAd(
      //adUnitId: 'ca-app-pub-2971104999770163/4048926185',
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      sizes: [size],
      request: const AdManagerAdRequest(),
      listener: AdManagerBannerAdListener(
        onAdLoaded: (Ad ad) async {
          debugPrint('Inline adaptive banner loaded: ${ad.responseInfo}');
          AdManagerBannerAd bannerAd = (ad as AdManagerBannerAd);
          final AdSize? size = await bannerAd.getPlatformAdSize();
          if (size == null) {
            debugPrint(
                'Error: getPlatformAdSize() returned null for $bannerAd');
            return;
          }
          setState(() {
            _inlineAdaptiveAd = bannerAd;
            _isLoaded = true;
            _adSize = size;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          debugPrint('Inline adaptive banner failedToLoad: $error');
          ad.dispose();
        },
      ),
    );
    await _inlineAdaptiveAd!.load();
  }

  Widget _getAdWidget() {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (_currentOrientation == orientation &&
            _inlineAdaptiveAd != null &&
            _isLoaded &&
            _adSize != null) {
          return Align(
              child: SizedBox(
            width: _adWidth,
            height: 150,
            child: AdWidget(
              ad: _inlineAdaptiveAd!,
            ),
          ));
        }
        if (_currentOrientation != orientation) {
          _currentOrientation = orientation;
          _loadAd();
        }
        return Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: _insets),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _getAdWidget(),
              ],
            ),
          ),
        ),
      );

  @override
  void dispose() {
    super.dispose();
    _inlineAdaptiveAd?.dispose();
  }
}
