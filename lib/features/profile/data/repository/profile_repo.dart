import 'dart:io';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import '../../../../core/errors/failure.dart';

abstract class ProfileRepo{
  Future<Either<Failure,Response>>updateProfile({required String name,required File? image});
}