import 'package:flutter/material.dart';

final class DeviceSize {
  static double kWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double kHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
}
