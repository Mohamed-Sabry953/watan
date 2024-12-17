import 'package:final_project_2024/core/compponents/reuseable_components.dart';
import 'package:final_project_2024/features/homeLayout.dart';
import 'package:final_project_2024/features/onBoarding/onBoardingPage.dart';
import 'package:final_project_2024/features/register/presentation/ui/emailVerificationPage/email_verification_page.dart';
import 'package:final_project_2024/features/register/presentation/ui/forgetPassPage/forget_pass_page.dart';
import 'package:final_project_2024/features/register/presentation/ui/forgetPassPage/updatePassPage.dart';
import 'package:final_project_2024/features/register/presentation/ui/forgetPassPage/verifyOtpScreen.dart';
import 'package:final_project_2024/features/servicesFeature/donate/presentation/ui/donatePage.dart';
import 'package:flutter/material.dart';

import '../../features/register/presentation/ui/registerScreen/registerScreen.dart';
import '../../features/servicesFeature/boycott/presentation/ui/BoycottPage.dart';
import '../../features/servicesFeature/boycott/presentation/ui/QR Page.dart';
import '../../features/servicesFeature/boycott/presentation/ui/resultPage.dart';

class AppRoutesName {
  static const String onBoardingPage="/";
  static const String registerScreen="registerScreen";
  static const String forgetPass="forgetPass";
  static const String homeLayout="homeLayout";
  static const String emailVerification="emailVerification";
  static const String verifyOtpScreen="verifyOtpScreen";
  static const String updatePassScreen="updatePassScreen";
  static const String boycottpage="boycottpage";
  static const String qrPage="qrPage";
  static const String donateScreen="donateScreen";
  static const String resultScreen="resultScreen";
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
        case AppRoutesName.verifyOtpScreen:
        return MaterialPageRoute(builder: (context) =>  VerifyOtpScreen(),);
        case AppRoutesName.updatePassScreen:
        return MaterialPageRoute(builder: (context) =>  UpdatePassPage(),);
        case AppRoutesName.onBoardingPage:
        return MaterialPageRoute(builder: (context) =>  Onboardingpage(),);
        case AppRoutesName.forgetPass:
        return MaterialPageRoute(builder: (context) =>  ForgetPassScreen(),);
        case AppRoutesName.boycottpage:
        return MaterialPageRoute(builder: (context) =>  Boycottpage(),);
        case AppRoutesName.qrPage:
        return MaterialPageRoute(builder: (context) =>  Qr_page(),);
        case AppRoutesName.donateScreen:
        return MaterialPageRoute(builder: (context) =>  DonateScreen(),);
        case AppRoutesName.resultScreen:
        return MaterialPageRoute(builder: (context) =>  ResultsScreen(),);
      default:
        return MaterialPageRoute(
          builder: (context) => unDefineRoute(),
        );

  }}
}