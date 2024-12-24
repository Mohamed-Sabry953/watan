import 'dart:io';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:final_project_2024/features/home/data/models/PostsModel.dart';

import '../../../../core/errors/failure.dart';
import '../models/CommentsModel.dart';

abstract class HomeRepo{
  Future<Either<Failure,PostsModel>>getPosts();
  Future<Either<Failure,PostsModel>>getLatestPosts();
  Future<Either<Failure,CommentsModel>>getComments({required String commentId});
  Future<Either<Failure,Response>>setComments({required String comment,required String commentId});
  Future<Either<Failure,Response>>setNewPost({required String content,required File? image});
}