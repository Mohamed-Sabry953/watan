import 'dart:io';

import 'package:dio/dio.dart';

import '../../cache/cachData.dart';
import '../../utils/constant/apiConstance.dart';

class ProfileApi{
  final Dio dio;

  ProfileApi(this.dio);

  Future<Response> updateProfile(String name,File? image) async {
    String token=await CacheData.getUserToken(key: "user_token");
    FormData data =FormData.fromMap({
      "name":name,
      "profile_photo":image !=null?await MultipartFile.fromFile(image.path,
          filename: image.path.split('/').last):null,
    });
    var response=await dio.post(
        ApiConstance.updateProfile,
        data: data,
        options: Options(
            method: "POST",
            headers: {
              "Content-Type": "application/json",
              "Accept":"application/json",
              "Authorization": "Bearer $token"
            }
        )
    );
    return response;
  }
}