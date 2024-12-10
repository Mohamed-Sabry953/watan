import 'package:final_project_2024/core/compponents/reuseable_components.dart';
import 'package:final_project_2024/features/homeLayout.dart';
import 'package:final_project_2024/features/register/presentation/ui/emailVerificationPage/email_verification_page.dart';
import 'package:final_project_2024/features/register/presentation/ui/registerScreen/registerScreen.dart';
import 'package:flutter/material.dart';

class AppRoutesName {
  static const String registerScreen="/";
  static const String forgetPass="forgetPass";
  static const String homeLayout="homeLayout";
  static const String emailVerification="emailVerification";
}
class AppRoute{
  static Route onGenerate(RouteSettings settings){
    switch(settings.name){
      case AppRoutesName.registerScreen:
        return MaterialPageRoute(builder: (context) => const RegisterScreen(),);
        case AppRoutesName.homeLayout:
        return MaterialPageRoute(builder: (context) =>  HomeLayout(),);
        case AppRoutesName.emailVerification:
        return MaterialPageRoute(builder: (context) =>  EmailVerificationScreen(),);
      default:
        return MaterialPageRoute(
          builder: (context) => unDefineRoute(),
        );

  }}
}