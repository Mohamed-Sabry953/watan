import 'package:final_project_2024/core/compponents/reuseable_components.dart';
import 'package:final_project_2024/features/home/presentation/ui/commentsPage.dart';
import 'package:final_project_2024/features/home/presentation/ui/createPostPage.dart';
import 'package:final_project_2024/features/home/presentation/ui/privacyPolicy.dart';
import 'package:final_project_2024/features/homeLayout.dart';
import 'package:final_project_2024/features/onBoarding/OnBoardingThree.dart';
import 'package:final_project_2024/features/profile/presentation/ui/profilePage.dart';
import 'package:final_project_2024/features/register/presentation/ui/emailVerificationPage/email_verification_page.dart';
import 'package:final_project_2024/features/register/presentation/ui/forgetPassPage/forget_pass_page.dart';
import 'package:final_project_2024/features/register/presentation/ui/forgetPassPage/updatePassPage.dart';
import 'package:final_project_2024/features/register/presentation/ui/forgetPassPage/verifyOtpScreen.dart';
import 'package:final_project_2024/features/register/presentation/ui/registerScreen/loginPage.dart';
import 'package:final_project_2024/features/register/presentation/ui/registerScreen/signupPage.dart';
import 'package:final_project_2024/features/servicesFeature/donate/presentation/ui/donatePage.dart';
import 'package:flutter/material.dart';
import '../../features/notification/presentation/ui/notification.dart';
import '../../features/onBoarding/OnBoardingOne.dart';
import '../../features/onBoarding/OnBoardingTwo.dart';
import '../../features/profile/presentation/ui/updateProfilePage.dart';
import '../../features/servicesFeature/boycott/presentation/ui/BoycottPage.dart';
import '../../features/servicesFeature/boycott/presentation/ui/QR Page.dart';
import '../../features/servicesFeature/boycott/presentation/ui/resultPage.dart';
import '../../features/servicesFeature/donate/presentation/ui/organizationsPage.dart';
import '../../features/servicesFeature/mapsServices/presentation/ui/Country_Maps.dart';
import '../../features/servicesFeature/mapsServices/presentation/ui/Country_Page.dart';
import '../../features/servicesFeature/mapsServices/presentation/ui/Nation_Page.dart';
import '../../features/welcomePage/onBoardingPage.dart';

class AppRoutesName {
  static const String onBoardingPage="/";
  static const String loginScreen="loginScreen";
  static const String signupScreen="signupScreen";
  static const String forgetPass="forgetPass";
  static const String homeLayout="homeLayout";
  static const String emailVerification="emailVerification";
  static const String verifyOtpScreen="verifyOtpScreen";
  static const String updatePassScreen="updatePassScreen";
  static const String boycottpage="boycottpage";
  static const String qrPage="qrPage";
  static const String donateScreen="donateScreen";
  static const String resultScreen="resultScreen";
  static const String profileScreen="profileScreen";
  static const String updateProfileScreen="updateProfileScreen";
  static const String commentScreen="commentScreen";
  static const String newPostScreen="newPostScreen";
  static const String notificationScreen="notificationScreen";
  static const String privacyPolicy="privacyPolicy";
  static const String onboardingOne="onboardingOne";
  static const String onboardingTwo="onboardingTwo";
  static const String onboardingThree="onboardingThree";
  static const String organizationDetailsScreen="organizationDetailsScreen";
  static const String countryPage="country_page";
  static const String nationPage="nation_page";
  static const String countryMaps="countryMaps";
}
class AppRoute{
  static Route onGenerate(RouteSettings settings){
    switch(settings.name){
      case AppRoutesName.loginScreen:
        return MaterialPageRoute(builder: (context) =>  LoginPage(),);
        case AppRoutesName.signupScreen:
        return MaterialPageRoute(builder: (context) =>  SignupPage(),);
        case AppRoutesName.homeLayout:
        return MaterialPageRoute(builder: (context) =>  HomeLayout(),);
        case AppRoutesName.emailVerification:
        return MaterialPageRoute(builder: (context) =>  EmailVerificationScreen(),);
        case AppRoutesName.verifyOtpScreen:
        return MaterialPageRoute(builder: (context) =>  VerifyOtpScreen(),);
        case AppRoutesName.updatePassScreen:
        return MaterialPageRoute(builder: (context) =>  UpdatePassPage(),);
        case AppRoutesName.onBoardingPage:
        return MaterialPageRoute(builder: (context) =>  const WelcomePage(),);
        case AppRoutesName.forgetPass:
        return MaterialPageRoute(builder: (context) =>  ForgetPassScreen(),);
        case AppRoutesName.boycottpage:
        return MaterialPageRoute(builder: (context) =>  const Boycottpage(),);
        case AppRoutesName.qrPage:
        return MaterialPageRoute(builder: (context) =>  const Qr_page(),);
        case AppRoutesName.donateScreen:
        return MaterialPageRoute(builder: (context) =>  const DonateScreen(),);
        case AppRoutesName.resultScreen:
        return MaterialPageRoute(builder: (context) =>  const ResultsScreen(),);
        case AppRoutesName.profileScreen:
        return MaterialPageRoute(builder: (context) =>  const ProfileScreen(),);
        case AppRoutesName.commentScreen:
        return MaterialPageRoute(builder: (context) =>  const CommentsPage(),);
        case AppRoutesName.newPostScreen:
        return MaterialPageRoute(builder: (context) =>  const CreatePostPage(),);
        case AppRoutesName.updateProfileScreen:
        return MaterialPageRoute(builder: (context) =>  const UpdateProfilePage(),);
        case AppRoutesName.notificationScreen:
        return MaterialPageRoute(builder: (context) =>  NotificationScreen(),);
        case AppRoutesName.privacyPolicy:
        return MaterialPageRoute(builder: (context) =>  const PrivacyPolicyPage(),);
        case AppRoutesName.onboardingOne:
        return MaterialPageRoute(builder: (context) =>  const OnboardingOne(),);
        case AppRoutesName.onboardingTwo:
        return MaterialPageRoute(builder: (context) =>  const OnboardingTwo(),);
        case AppRoutesName.onboardingThree:
        return MaterialPageRoute(builder: (context) =>   const OnboardingThree(),);
      case AppRoutesName.countryPage:
        return MaterialPageRoute(builder: (context) =>  CountryPage(),);
      case AppRoutesName.nationPage:
        return MaterialPageRoute(builder: (context) =>  NationPage(),);
        case AppRoutesName.organizationDetailsScreen:
        return MaterialPageRoute(builder: (context) =>    OrganizationDetailsScreen(),);
        case AppRoutesName.countryMaps:
        return MaterialPageRoute(builder: (context) =>    CountryMaps(),);
      default:
        return MaterialPageRoute(
          builder: (context) => unDefineRoute(),
        );

  }}
}