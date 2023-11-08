import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/generated/assets.dart';
import 'package:quit_mate/src/core/cache/sp_background_image/sp_background_image.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';

class SetBGImageView extends ConsumerStatefulWidget {
  const SetBGImageView({
    Key? key,
  }) : super(key: key);

  @override
  SetBGImageViewState createState() => SetBGImageViewState();
}

class SetBGImageViewState extends ConsumerState<SetBGImageView> {
  final backgroundImages = [
    Assets.imagesWp1,
    Assets.imagesWp2,
    Assets.imagesWp3,
  ];

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    final sharedBGManager = SPBackgroundImage();

    return SafeArea(
      child: Scaffold(
        backgroundColor: currentTheme.scaffoldBackgroundColor,
        body: Column(
          children: [
            SizedBox(
              height: 500,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 9 / 16,
                ),
                itemCount: backgroundImages.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      await sharedBGManager
                          .setNewBackgroundImage(backgroundImages[index]);
                      setState(() {});
                    },
                    child: Image.asset(
                      backgroundImages[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            TextButton(
                onPressed: () async {
                  final ahmet = await sharedBGManager.getBackgroundImage();
                  print(ahmet);
                },
                child: Text('CHECK')),
          ],
        ),
      ),
    );
  }
}
