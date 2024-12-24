import 'dart:io';

import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';
import 'package:final_project_2024/core/errors/failure.dart';
import 'package:final_project_2024/core/services/APIs/home_api.dart';
import 'package:final_project_2024/features/home/data/models/CommentsModel.dart';
import 'package:final_project_2024/features/home/data/models/PostsModel.dart';
import 'package:final_project_2024/features/home/data/repository/home_repo.dart';
import 'package:flutter/foundation.dart';

class HomeRepoImp implements HomeRepo{
  final HomeApi homeApi;
  PostsModel? postsModel;
  CommentsModel? commentsModel;
  PostsModel? latestPosts;
  HomeRepoImp(this.homeApi);

  @override
  Future<Either<Failure, PostsModel>> getPosts() async {
    try{
      var response=await homeApi.getPosts();
      if(response.statusCode==200){
        if (kDebugMode) {
          print(response);
        }
        postsModel=PostsModel.fromJson(response.data);
        return Right(postsModel!);
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
      }
      else {
        if (kDebugMode) {
          print('Login error: ${e.message}');
        }
        return Left(ServerFailure(e.message!));
      }
    }
    }
  @override
  Future<Either<Failure, PostsModel>> getLatestPosts() async {
    try{
      var response=await homeApi.getLatestPosts();
      if(response.statusCode==200){
        latestPosts=PostsModel.fromJson(response.data);
        return Right(PostsModel.fromJson(response.data));
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
      }
      else {
        if (kDebugMode) {
          print('Login error: ${e.message}');
        }
        return Left(ServerFailure(e.message!));
      }
    }
    }
  @override
  Future<Either<Failure, CommentsModel>> getComments({required String commentId}) async {
      try{
        var response=await homeApi.getComment(commentId);
        if(response.statusCode==200){
          if (kDebugMode) {
            print(response);
          }
          commentsModel=CommentsModel.fromJson(response.data);
          return Right(commentsModel!);
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
  @override
  Future<Either<Failure, Response>> setComments({required String comment,required String commentId}) async {
    try{
      var response=await homeApi.setComment(comment,commentId);
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

  @override
  Future<Either<Failure, Response>> setNewPost({required String content, required File? image}) async {
    try{
      var response=await homeApi.setNewPosts(content,image);
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