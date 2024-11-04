import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:final_project_2024/features/register/data/model/RegisterDataModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repo/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepo) : super(RegisterInitial());
  RegisterRepo registerRepo;

  static RegisterCubit get(context) => BlocProvider.of(context);
  bool checkBox = false;
  CrossFadeState registerCrossFadeState = CrossFadeState.showFirst;

  void checkBoxOperate() {
    checkBox = !checkBox;
    emit(ChangeCheckBoxState());
  }

  void changeFadeRegister() {
    registerCrossFadeState = CrossFadeState.showSecond;
    emit(ChangeFadeState());
  }

  void backFadeRegister() {
    registerCrossFadeState = CrossFadeState.showFirst;
    emit(BackFadeState());
  }

  Future<void> postSignup(String name,String email,String password,String confirmPassword,) async {
    emit(SignupLoading());
    var result = await registerRepo.signup(
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword);
    result.fold(
      (failure) { emit(SignupFailure(failure.errMessage));
        print(failure.errMessage);
        },
      (registerItem) { emit(SignupSuccess(registerItem),
      );
        if (kDebugMode) {
          print(registerItem);
        }
      }
    );

  }
  Future<void> login(String email,String password) async {
    emit(LoginLoading());
    var result = await registerRepo.login(
      email: email,
      password: password
    );
    result.fold(
      (failure) { emit(LoginFailure(failure.errMessage));
        print(failure.errMessage);
        },
      (registerItem) { emit(LoginSuccess(registerItem),
      );
        if (kDebugMode) {
          print(registerItem);
        }
      }
    );

  }
}
