import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/generated/assets.dart';
import 'package:quit_mate/src/core/cache/sp_background_image/sp_background_image.dart';
import 'package:quit_mate/src/core/const/material/device_size.dart';
import 'package:quit_mate/src/core/const/strings.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/set_bg_image/widget/set_bg_image_btn.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SetBGImageView extends ConsumerStatefulWidget {
  const SetBGImageView({
    Key? key,
  }) : super(key: key);

  @override
  SetBGImageViewState createState() => SetBGImageViewState();
}

class SetBGImageViewState extends ConsumerState<SetBGImageView> {
  final PageController _pageController = PageController();
  final backgroundImages = [
    Assets.imagesWp1,
    Assets.imagesWp2,
    Assets.imagesWp3,
    Assets.imagesWp4,
    Assets.imagesWp5,
    Assets.imagesWp6,
    Assets.imagesWp7,
    Assets.imagesWp8,
    Assets.imagesWp9,
    Assets.imagesWp10,
  ];

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    final sharedBGManager = SPBackgroundImage();
    return SafeArea(
      child: Scaffold(
        floatingActionButton: SetBGImageBtn(
            text: Strings.setBGImage,
            onTap: () async {
              final int currentIndex = _pageController.page?.round() ?? 0;
              await sharedBGManager
                  .setNewBackgroundImage(backgroundImages[currentIndex]);
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        backgroundColor: currentTheme.hoverColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: DeviceSize.kHeight(context) * 0.7,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: backgroundImages.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(36),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.6,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.grey, width: 0.5),
                              image: DecorationImage(
                                image: AssetImage(backgroundImages[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              pageIndicatorAndArrowButtonsRow(currentTheme),
              ElevatedButton(
                onPressed: () {
                  /* final ahmet = await sharedBGManager.getBackgroundImage();
                  print(ahmet);
                  setState(() {});*/
                  final snackBar = SnackBar(
                    backgroundColor: Colors.black,
                    content: Text(
                      Strings.bgImageUpdated,
                      style: currentTheme.textTheme.titleMedium
                          ?.copyWith(color: Colors.white),
                    ),
                    duration: const Duration(seconds: 4),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: const Text('Kontrol'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding pageIndicatorAndArrowButtonsRow(ThemeData currentTheme) {
    return Padding(
      padding: const EdgeInsets.only(left: 22, right: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              if (_pageController.page != null && _pageController.page! > 0) {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: currentTheme.indicatorColor,
            ),
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: backgroundImages.length,
            effect: WormEffect(
                activeDotColor: currentTheme.primaryColor,
                paintStyle: PaintingStyle.stroke,
                dotHeight: 10,
                dotWidth: 10),
          ),
          IconButton(
            onPressed: () {
              if (_pageController.page != null &&
                  _pageController.page! < backgroundImages.length - 1) {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
            icon: Icon(
              Icons.arrow_forward_ios,
              color: currentTheme.indicatorColor,
            ),
          ),
        ],
      ),
    );
  }
}
