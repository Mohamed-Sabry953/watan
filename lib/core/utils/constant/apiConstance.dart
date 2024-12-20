class ApiConstance{
  static const String baseUrl = 'https://8053-105-33-13-96.ngrok-free.app';
  static const String chatBotBaseUrl = 'https://895b-196-136-10-79.ngrok-free.app';
//=============================auth=========================================
  static const String registerApiUrl = '$baseUrl/api/register';
  static const String loginApiUrl = '$baseUrl/api/login';
  static const String sendVerifyCode = '$baseUrl/api/send-email-verification';
  static const String verifyEmail = '$baseUrl/api/email-verification';
  static const String forgetPass = '$baseUrl/api/password/forgot-password';
  static const String checkOtp = '$baseUrl/api/password/checkOtp';
  static const String resetPass = '$baseUrl/api/password/reset';

  //==============================chatBot====================================
  static const String chatBot = '$chatBotBaseUrl/chatbot';

  //=============================Home========================================
  static const String posts = '$baseUrl/api/posts/users';
  static const String latestPost = '$baseUrl/api/posts/latestnews';

  //===========================Boycott========================================
  static const String alternative = '$baseUrl/api/products/all';
  static const String checkBoycott = '$baseUrl/api/check-code_name';


}