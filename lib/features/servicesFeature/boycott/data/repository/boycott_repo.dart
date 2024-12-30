import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:final_project_2024/features/servicesFeature/boycott/data/models/AlternativeModel.dart';
import 'package:final_project_2024/features/servicesFeature/boycott/data/models/BoycottModel.dart';

import '../../../../../core/errors/failure.dart';
import '../models/TestAlternitive.dart';
import '../models/TestCodeModel.dart';

abstract class BoycottRepo{
  Future<Either<Failure,TestAlternitive>>getAlternative();
  Future<Either<Failure,BoycottModel>>getboycott_product({required String boycottname});

  Future<Either<Failure,TestCodeModel>>checkBoycott({required String code});
}