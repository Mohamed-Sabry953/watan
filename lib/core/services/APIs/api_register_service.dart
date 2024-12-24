import 'package:dio/dio.dart';
import 'package:final_project_2024/core/cache/cachData.dart';

import '../../utils/constant/apiConstance.dart';

class RegisterApiService {
  final Dio dio;

  RegisterApiService(this.dio);

  Future<Response> signup({
    required String url,
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    var response = await dio.post(url,
    data: {
      "name":name,
      "email":email,
      "password":password,
      "password_confirmation":confirmPassword,
    },
      options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept":"application/json"
          }
      )
    );
    return response;
  }
  Future<Response> login(String email, String password) async {
    Map<String, dynamic> loginData = {
      "email": email,
      "password": password,
    };
    var response=await dio.post(
      ApiConstance.loginApiUrl,
      data: loginData,
      options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept":"application/json"
          }
      )
    );
    return response;
  }
  Future<Response> sendVerifyCode(String email) async {
    Map<String, dynamic> otpData = {
      "email": email,
    };
    var response=await dio.post(
      ApiConstance.sendVerifyCode,
      data: otpData,
    );
    return response;
  }
  Future<Response> verifyEmail(String email,String otp) async {
    Map<String, dynamic> verifyEmailData = {
      "email": email,
      "otp": otp,
    };
    var response=await dio.post(
      ApiConstance.verifyEmail,
      data: verifyEmailData,
    );
    return response;
  }
  Future<Response> sendResetPassCode(String email) async {
    Map<String, dynamic> otpData = {
      "email": email,
    };
    var response=await dio.post(
      ApiConstance.forgetPass,
      data: otpData,
    );
    return response;
  }
  Future<Response> checkOtpAndEmail(String email,String otp) async {
    Map<String, dynamic> verifyEmailData = {
      "email": email,
      "otp": otp,
    };
    var response=await dio.post(
      ApiConstance.checkOtp,
      data: verifyEmailData,
    );
    return response;
  }
  Future<Response> resetPass(String email,String pass,String passConfirm) async {
    Map<String, dynamic> verifyEmailData = {
      "email": email,
      "password": pass,
      "password_confirmation":passConfirm
    };
    var response=await dio.post(
      ApiConstance.resetPass,
      data: verifyEmailData,
    );
    return response;
  }

  // profile method
  Future<Response> getProfile() async {
    String token=await CacheData.getUserToken(key: "user_token");
    var response=await dio.get(
        ApiConstance.profile,
        options: Options(
            method: "GET",
            headers: {
              "Accept": "application/json",
              "type": "text",
              "Authorization": "Bearer $token"
            }
        )
    );
    return response;
  }

}
