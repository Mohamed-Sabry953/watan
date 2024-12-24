import 'dart:io';

import 'package:dio/dio.dart';

import '../../cache/cachData.dart';
import '../../utils/constant/apiConstance.dart';

class HomeApi{
  final Dio dio ;

  HomeApi(this.dio);

  Future<Response> getPosts() async {
    var response=await dio.get(
      ApiConstance.posts,
      options: Options(
          method: "GET",
          headers: {
            "Content-Type": "application/json",
            "Accept":"application/json"
          }
      )
    );
    return response;
  }
  Future<Response> setNewPosts(String content,File? image) async {
    String token=await CacheData.getUserToken(key: "user_token");
    FormData data =FormData.fromMap({
      "title":content,
      "content":content,
      "media[]":image !=null?await MultipartFile.fromFile(image.path,
          filename: image.path.split('/').last):[],
    });
    var response=await dio.post(
        ApiConstance.setNewPost,
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
  Future<Response> getLatestPosts() async {
    var response=await dio.get(
      ApiConstance.latestPost,
      options: Options(
          method: "GET",
          headers: {
            "Content-Type": "application/json",
            "Accept":"application/json"
          }
      )
    );
    return response;
  }
  Future<Response> getComment(String commentId) async {
    String token=await CacheData.getUserToken(key: "user_token");
    var response=await dio.get(
        "${ApiConstance.getComment}$commentId",
        options: Options(
            method: "GET",
            headers: {
              "Content-Type": "application/json",
              "Accept":"application/json",
              "Authorization": "Bearer $token"
            }
        )
    );
    return response;
  }
  Future<Response> setComment(String comment ,String commentId) async {
    String token=await CacheData.getUserToken(key: "user_token");
    var response=await dio.post(
        "${ApiConstance.setComment}$commentId",
        data: {
          "comment":comment
        },
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