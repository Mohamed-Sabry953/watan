

import 'dart:io';

import 'package:flutter/material.dart';




class AppConstants {
  static File? file;
  static bool? hasInternet;
  static sp5(context){
    var height=MediaQuery.of(context).size.height*.006;
    return height;
  } static sp10(context){
    var height=MediaQuery.of(context).size.height*.012;
    return height;
  }
  static sp15(context){
    var height=MediaQuery.of(context).size.height*.016;
    return height;
  }
  static  sp20(context){
    var height=MediaQuery.of(context).size.height*.022;
    return height;
  }
  static  sp30(context){
    var height=MediaQuery.of(context).size.height*.032;
    return height;
  }

  static  height5(context){
    var height=MediaQuery.of(context).size.height*.006;
    return height;
  }
  static  height10(context){
    var height=MediaQuery.of(context).size.height*.012;
    return height;
  }
  static  height15(context){
    var height=MediaQuery.of(context).size.height*.018;
    return height;
  }
  static  height20(context){
    var height=MediaQuery.of(context).size.height*.024;
    return height;
  }
  static  height30(context){
    var height=MediaQuery.of(context).size.height*.030;
    return height;
  }
  static  height55(context){
    var height=MediaQuery.of(context).size.height*.075;
    return height;
  }

  static  width5(context){
    var height=MediaQuery.of(context).size.height*.0075;
    return height;
  }
  static  width10(context){
    var height=MediaQuery.of(context).size.height*.015;
    return height;
  }
  static  width15(context){
    var height=MediaQuery.of(context).size.height*.02;
    return height;
  }
  static  width20(context){
    var height=MediaQuery.of(context).size.height*.024;
    return height;
  }
  static  width30(context){
    var height=MediaQuery.of(context).size.height*.036;
    return height;
  }
  static  width50(context){
    var height=MediaQuery.of(context).size.height*.056;
    return height;
  }
  static  height200(context){
    var height=MediaQuery.of(context).size.height*.4;
    return height;
  }
}