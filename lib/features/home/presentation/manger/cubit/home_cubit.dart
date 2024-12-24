import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:final_project_2024/core/utils/constant/generic_variables.dart';
import 'package:final_project_2024/features/home/data/models/CommentsModel.dart';
import 'package:final_project_2024/features/home/data/models/PostsModel.dart';
import 'package:final_project_2024/features/home/data/repository/home_repo_imp.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepoImp) : super(HomeInitial());
  final HomeRepoImp homeRepoImp;
  final TextEditingController comment=TextEditingController();
  final TextEditingController post=TextEditingController();
  final ImagePicker picker = ImagePicker();
  File? image;


  static HomeCubit get(context)=>BlocProvider.of(context);


  void onChangeTextField(String value){
    post.text=value;
    emit(OnChangeTextFieldState());
  }
  Future<void> pickImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    print(pickedFile?.path);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      emit(PickImageFromGalleryState());
    }
  }
  Future<void> getPosts() async {
    emit(HomeLoadingState());
    var result = await homeRepoImp.getPosts(
    );
    result.fold(
            (failure) { emit(GetPostsFailState(failure.errMessage));
        },
            (postsModel) { emit(GetPostsSucState(postsModel),
        );
        }
    );

  }
  Future<void> getLatestPosts() async {
    emit(HomeLoadingState());
    var result = await homeRepoImp.getLatestPosts(
    );
    result.fold(
            (failure) { emit(GetLatestPostsFailState(failure.errMessage));
        },
            (postsModel) { emit(GetLatestPostsSucState(postsModel),
        );
        }
    );

  }
  Future<void> getComments(String commentId) async {
    emit(HomeLoadingState());
    var result = await homeRepoImp.getComments(
      commentId: commentId
    );
    result.fold(
            (failure) { emit(GetCommentsFailState(failure.errMessage));
        },
            (postsModel) { emit(GetCommentsSucState(postsModel),
        );
        }
    );

  }
  Future<void> setComments(String commentId) async {
    emit(HomeLoadingState());
    var result = await homeRepoImp.setComments(
      comment: comment.text,
      commentId: commentId
    );
    result.fold(
            (failure) { emit(SetCommentsFailState(failure.errMessage));
        },
            (postsModel) async {
              await getComments(GenericVariables.commentId!);
              emit(SetCommentsSucState(postsModel),);
              comment.text="";
        }
    );

  }
  Future<void> setNewPost(BuildContext context) async {
    emit(HomeLoadingState());
    var result = await homeRepoImp.setNewPost(
      content: post.text,
      image: image
    );
    result.fold(
            (failure) { emit(SetCommentsFailState(failure.errMessage));
        },
            (postsModel) async {
              await getPosts();
              Navigator.pop(context);
              emit(SetCommentsSucState(postsModel),);

        }
    );

  }
}
