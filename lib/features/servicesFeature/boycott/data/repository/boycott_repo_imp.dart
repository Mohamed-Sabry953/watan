import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';
import 'package:final_project_2024/core/errors/failure.dart';
import 'package:final_project_2024/core/services/APIs/boycott_api.dart';
import 'package:final_project_2024/features/servicesFeature/boycott/data/models/AlternativeModel.dart';
import 'package:final_project_2024/features/servicesFeature/boycott/data/repository/boycott_repo.dart';
import 'package:flutter/foundation.dart';

import '../models/BoycottModel.dart';

class BoycottRepoImp implements BoycottRepo{
  final BoycottApi boycottApi;
  AlternativeModel? alternativeModel;
  BoycottRepoImp(this.boycottApi);

  @override
  Future<Either<Failure, AlternativeModel>> getAlternative() async {
    try{
      var response=await boycottApi.getProducts();
      if(response.statusCode==200){
        if (kDebugMode) {
          print(response);
        }
        alternativeModel=AlternativeModel.fromJson(response.data);
        return Right(AlternativeModel.fromJson(response.data));
      }
      else{
        // print("Login failed: ${response.statusMessage}");
        return Left(ServerFailure("Login fail${response.statusMessage}"));
      }
    }on DioError catch(e){
      if (e.response != null) {
        if (kDebugMode) {
          print('Login error: ${e.response?.data}');
        }
        return Left(ServerFailure.fromDioError(e));
      }
      else {
        if (kDebugMode) {
          print('Login error: ${e.message}');
        }
        return Left(ServerFailure(e.message!));
      }
    }
  }
  @override
  Future<Either<Failure, BoycottModel>> checkBoycott({required String code}) async {
    try{
      Response response=await boycottApi.checkBoycott(code);
      if(response.statusCode==200){

        return Right(BoycottModel.fromJson(response.data));
      }
      else{
        // print("Login failed: ${response.statusMessage}");
        return Left(ServerFailure("Login fail${response.statusMessage}"));
      }
    }on DioError catch(e){
      if (e.response != null) {
        if (kDebugMode) {
          print('Login error: ${e.response?.data}');
        }
        return Left(ServerFailure.fromDioError(e));
      } else {
        if (kDebugMode) {
          print('Login error: ${e.message}');
        }
        return Left(ServerFailure.fromDioError(e));
      }
    }
  }

}