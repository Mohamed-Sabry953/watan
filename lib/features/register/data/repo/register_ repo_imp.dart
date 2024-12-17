import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:either_dart/src/either.dart';
import 'package:final_project_2024/core/errors/failure.dart';
import 'package:final_project_2024/core/services/APIs/api_register_service.dart';
import 'package:final_project_2024/core/utils/constant/apiConstance.dart';
import 'package:final_project_2024/features/register/data/repo/register_repo.dart';
import 'package:flutter/foundation.dart';

import '../model/RegisterDataModel.dart';

class RegisterRepoImpl implements RegisterRepo {
  RegisterApiService registerApiService;
  static List<RegisterDataModel> tokens = [];

  RegisterRepoImpl(this.registerApiService);
  @override
  Future<Either<Failure, Response>> signup({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      Response data = await registerApiService.signup(
          url: ApiConstance.registerApiUrl,
          name: name,
          email: email,
          password: password,
          confirmPassword: confirmPassword);
      tokens.add(RegisterDataModel.fromJson(data.data));
      return Right(data);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Response>> login(
      {required String email, required String password}) async {
    try{
      Response response=await registerApiService.login(email, password);
      if(response.statusCode==200){
        return Right(response);
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
        return Left(ServerFailure(e.message!));
      }
    }
  }

  @override
  Future<Either<Failure, Response>> sendVerifyCode({required String email}) async {
    try{
      Response response=await registerApiService.sendVerifyCode(email);
      if(response.statusCode==200){
        return Right(response);
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
  Future<Either<Failure, Response>> verifyEmail({required String email, required String otp}) async {
    try{
      Response response=await registerApiService.verifyEmail(email, otp);
      if(response.statusCode==200){
        return Right(response);
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
  Future<Either<Failure, Response>> forgetPass({required String email}) async {
    try{
      Response response=await registerApiService.sendResetPassCode(email);
      if(response.statusCode==200){
        return Right(response);
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
  Future<Either<Failure, Response>> checkOtp({required String email, required String otp}) async {
    try{
      Response response=await registerApiService.checkOtpAndEmail(email, otp);
      if(response.statusCode==200){
        return Right(response);
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
  Future<Either<Failure, Response>> resetPass({required String email, required String pass,required passConfirm}) async {
    try{
      Response response=await registerApiService.resetPass(email, pass,passConfirm);
      if(response.statusCode==200){
        return Right(response);
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
