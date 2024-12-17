import 'package:bloc/bloc.dart';
import 'package:final_project_2024/features/home/data/models/PostsModel.dart';
import 'package:final_project_2024/features/home/data/repository/home_repo_imp.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepoImp) : super(HomeInitial());
  final HomeRepoImp homeRepoImp;
  static HomeCubit get(context)=>BlocProvider.of(context);

  Future<void> getPosts() async {
    emit(HomeLoadingState());
    var result = await homeRepoImp.getPosts(
    );
    result.fold(
            (failure) { emit(GetPostsFailState(failure.errMessage));
        },
            (postsModel) { emit(GetPostsSucState(postsModel),
        );
        if (kDebugMode) {
          print(postsModel);
        }
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
        if (kDebugMode) {
          print(postsModel);
        }
        }
    );

  }
}
