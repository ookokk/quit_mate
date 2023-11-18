import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/generated/assets.dart';
import 'package:quit_mate/src/core/cache/sp_background_image/sp_background_image.dart';

class SetBGImageNotifier extends ChangeNotifier {
  final sharedBGManager = SPBackgroundImage();
  String _bgImagePath = Assets.imagesWp8;
  String get bgImagePath => _bgImagePath;
  SetBGImageNotifier();
  Future<void> initialize() async {
    await initBackgroundImage();
  }

  void updateImagePath(String newPath) async {
    _bgImagePath = newPath;
    notifyListeners();
  }

  Future<void> initBackgroundImage() async {
    _bgImagePath =
        (await sharedBGManager.getBackgroundImage()) ?? Assets.imagesWp8;
    notifyListeners();
  }
}

final bgImageProvider = ChangeNotifierProvider((ref) => SetBGImageNotifier());
