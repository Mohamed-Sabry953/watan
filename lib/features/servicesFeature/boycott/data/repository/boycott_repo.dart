import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:final_project_2024/features/servicesFeature/boycott/data/models/AlternativeModel.dart';
import 'package:final_project_2024/features/servicesFeature/boycott/data/models/BoycottModel.dart';

import '../../../../../core/errors/failure.dart';

abstract class BoycottRepo{
  Future<Either<Failure,AlternativeModel>>getAlternative();
  Future<Either<Failure,BoycottModel>>checkBoycott({required String code});
}