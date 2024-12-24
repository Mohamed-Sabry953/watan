import 'dart:io';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:final_project_2024/core/services/APIs/profile_api.dart';
import 'package:final_project_2024/features/profile/data/repository/profile_repo.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/errors/failure.dart';

class ProfileRepoImp implements ProfileRepo{
  final ProfileApi profileApi;

  ProfileRepoImp(this.profileApi);

  @override
  Future<Either<Failure, Response>> updateProfile({required String name, required File? image}) async {
    try{
      var response=await profileApi.updateProfile(name,image);
      if(response.statusCode==200){
        if (kDebugMode) {
          print(response);
        }
        return Right(response);
      }
      else{
        // print("Login failed: ${response.statusMessage}");
        return Left(ServerFailure("Login fail${response.statusMessage}"));
      }
    }
    on DioError catch(e){
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