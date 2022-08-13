import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLayout{
  static getSize(BuildContext context){
    return MediaQuery.of(context).size;
  }
  static _getScreenHeight(){
    return Get.height;
  }
  static _getScreenWidth(){
    return Get.width;
  }
  static getHeight(double pixels){
    return (_getScreenHeight()*pixels)/_getScreenHeight();
  }
  static getWidth(double pixels){
    return (_getScreenWidth()*pixels)/_getScreenWidth();
  }
}