import 'package:flutter/material.dart';

class LangProvider extends ChangeNotifier{
   List<String> items = [
    "English",
    "Arabic",
  ];
   List<String> arItems = [
    "انجليزى",
    "عربى",
  ];
  String langValue="English";
  String langKey="en";
  void changeLang(String? value){
    langValue=value!;
    switch(langValue){
      case "English" || "انجليزى":
        langValue="English";
        langKey="en";
        notifyListeners();
      case "Arabic" || "عربى":
        langValue="عربى";
        langKey="ar";
        notifyListeners();
    }
    notifyListeners();
  }
}