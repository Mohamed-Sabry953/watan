import 'package:dio/dio.dart';

import '../../utils/constant/apiConstance.dart';

class BoycottApi{
  final Dio dio;

  BoycottApi(this.dio);

  Future<Response> getallBoycottProducts() async {
    var response=await dio.get(
        ApiConstance.boycott,
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
  Future<Response> getallAlternativeProducts() async {
    var response=await dio.get(
        ApiConstance.alternative,
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

  Future<Response> getboycott_Products({required String boycottname}) async {
    var response=await dio.get(
        "${ApiConstance.boycottTest}$boycottname",
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
  Future<Response> checkBoycott(String code) async {
    var response=await dio.post(
        ApiConstance.checkBoycott,
        data: {
          "code": code,
        },
        options: Options(
            method: "POST",
            headers: {
              "Content-Type": "application/json",
              "Accept":"application/json"
            }
        )
    );
    return response;
  }
}