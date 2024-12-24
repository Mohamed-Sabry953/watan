import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:final_project_2024/features/register/data/model/UserModel.dart';
import 'package:flutter/material.dart';
import '../../../../core/errors/failure.dart';

abstract class RegisterRepo{
  Future<Either<Failure,Response>>login({required String email, required String password});
  Future<Either<Failure,Response>> signup(
  {
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
}
      );
  Future<Either<Failure,Response>>sendVerifyCode({required String email});
  Future<Either<Failure,Response>>verifyEmail({required String email,required String otp});
  Future<Either<Failure,Response>>forgetPass(BuildContext context,{required String email});
  Future<Either<Failure,Response>>checkOtp(BuildContext context,{required String email,required String otp});
  Future<Either<Failure,Response>>resetPass({required String email,required String pass,required passConfirm});
  Future<Either<Failure,UserModel>>getProfile(BuildContext context);
}