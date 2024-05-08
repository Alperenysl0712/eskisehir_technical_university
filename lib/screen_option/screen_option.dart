import 'package:eskisehir_technical_university/widgets/screen_detail_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenOption{

  BuildContext? context;
  var screenH = 0.0;
  var screenW = 0.0;

  ScreenOption(this.context){
    screenH = ScreenDetailWidget(context!).getHeight();
    screenW = ScreenDetailWidget(context!).getWidth();
  }

  double getToolH_obs_login(){
    if (screenH < 750) {
      return 70;
    }
    else if (screenH < 940){
      return 125;
    }
    else if (screenH < 1150){
      return 120;
    }
    else{
      return screenH * 0.05;
    }
  }

  double get_login_logo(){
    if (screenH < 700) {
      return screenH * 0.25;
    } else {
      return screenH * 0.32;
    }
  }

  double getToolH_obs_main(double screen){
    if (screen < 750) {
      return 85;
    }
    else if(screen < 1150) {
      return screen * 0.145;
    }
    else{
      return screen * 0.06;
    }
  }

  double getScreenHeight(){
    return screenH;
  }

  double getScreenWidth(){
    return screenW;
  }
}