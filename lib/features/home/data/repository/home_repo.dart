import 'package:either_dart/either.dart';
import 'package:final_project_2024/features/home/data/models/PostsModel.dart';

import '../../../../core/errors/failure.dart';

abstract class HomeRepo{
  Future<Either<Failure,PostsModel>>getPosts();
  Future<Either<Failure,PostsModel>>getLatestPosts();
}