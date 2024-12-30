class ApiConstance{
  static const String baseUrl = 'https://teal-fox-665808.hostingersite.com';
  static const String chatBotBaseUrl = 'https://d46d-197-54-188-44.ngrok-free.app';
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
  static const String getComment = '$baseUrl/api/comments_posts/';
  static const String setComment = '$baseUrl/api/comments/';
  static const String setNewPost = '$baseUrl/api/posts';

  //===========================Boycott========================================
  static const String alternative = '$baseUrl/api/category/all';
  static const String checkBoycott = '$baseUrl/api/check-code_name';

  //===========================Profile========================================
  static const String profile = '$baseUrl/api/profile';
  static const String updateProfile = '$baseUrl/api/editprofile';



}