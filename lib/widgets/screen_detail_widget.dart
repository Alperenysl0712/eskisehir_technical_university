import 'package:flutter/material.dart';

class ScreenDetailWidget extends StatelessWidget{

  BuildContext? context;

  ScreenDetailWidget(this.context, {super.key});

  static double screenH = 0.0;
  static double screenW = 0.0;

  double getHeight() {
    screenH = MediaQuery.of(context!).size.height;
    return screenH;
  }

  double getWidth() {
    screenW = MediaQuery.of(context!).size.width;
    return screenW;
  }

  @override
  Widget build(BuildContext context) {

    throw UnimplementedError();
  }
}
