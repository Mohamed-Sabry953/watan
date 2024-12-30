import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';
import 'package:final_project_2024/core/errors/failure.dart';
import 'package:final_project_2024/core/services/APIs/boycott_api.dart';
import 'package:final_project_2024/features/servicesFeature/boycott/data/models/AlternativeModel.dart';
import 'package:final_project_2024/features/servicesFeature/boycott/data/repository/boycott_repo.dart';
import 'package:flutter/foundation.dart';

import '../models/BoycottModel.dart';
import '../models/TestAlternitive.dart';
import '../models/TestCodeModel.dart';

class BoycottRepoImp implements BoycottRepo{
  final BoycottApi boycottApi;
  TestAlternitive? alternativeModel;
  BoycottModel? boycottModel;
  BoycottRepoImp(this.boycottApi);

  @override
  Future<Either<Failure, TestAlternitive>> getAlternative() async {
    try{
      var response=await boycottApi.getProducts();
      if(response.statusCode==200){
        if (kDebugMode) {
          print(response);
        }
        alternativeModel=TestAlternitive.fromJson(response.data);
        return Right(TestAlternitive.fromJson(response.data));
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
  Future<Either<Failure, TestCodeModel>> checkBoycott({required String code}) async {
    try{
      Response response=await boycottApi.checkBoycott(code);
      if(response.statusCode==200){

        return Right(TestCodeModel.fromJson(response.data));
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

  @override
  Future<Either<Failure, BoycottModel>> getboycott_product({required String boycottname}) async {
    try {
      var response = await boycottApi.getboycott_Products(
          boycottname: boycottname);
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response);
        }
        boycottModel = BoycottModel.fromJson(response.data);
        return Right(boycottModel!);
      }
      else {
        // print("Login failed: ${response.statusMessage}");
        return Left(ServerFailure("Login fail${response.statusMessage}"));
      }
    }
    on DioError catch (e) {
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

}