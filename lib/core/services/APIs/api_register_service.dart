import 'package:dio/dio.dart';

import '../../utils/constant/apiConstance.dart';

class RegisterApiService {
  final Dio dio;

  RegisterApiService(this.dio);

  Future<Response> post({
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
    );
    return response;
  }
}
