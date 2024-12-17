import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import '../../../../core/errors/failure.dart';

abstract class ChatBotRepo{
  Future<Either<Failure,Response>>chatBot({required String message});
}