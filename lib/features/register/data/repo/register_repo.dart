import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:final_project_2024/features/register/data/model/RegisterDataModel.dart';

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
}