import 'package:dio/dio.dart';

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
}