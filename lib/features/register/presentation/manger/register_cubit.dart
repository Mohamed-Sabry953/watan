
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepo) : super(RegisterInitial());
  RegisterRepo registerRepo;

  static RegisterCubit get(context) => BlocProvider.of(context);
  bool checkBox = false;
  String verifictionEmail="";
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

  Future<void> postSignup(
      {
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(SignupLoading());
    var result = await registerRepo.signup(
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword);
    result.fold(
      (failure) { emit(SignupFailure(failure.errMessage));
        if (kDebugMode) {
          print(failure.errMessage);
        }
        },
      (registerItem) { emit(SignupSuccess(registerItem),
      );
        sendVerifyCode(email: email);
        if (kDebugMode) {
          print(registerItem);
        }
      }
    );

  }
  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    var result = await registerRepo.login(
      email: email,
      password: password
    );
    result.fold(
      (failure) { emit(LoginFailure(failure.errMessage));
        },
      (registerItem) { emit(LoginSuccess(registerItem),
      );
        if (kDebugMode) {
          print(registerItem);
        }
      }
    );

  }
  Future<void> sendVerifyCode({required String email}) async {
    emit(LoginLoading());
    var result = await registerRepo.sendVerifyCode(
      email: email,
    );
    result.fold(
      (failure) { emit(SentVerifyCodeFailState(failure.errMessage));
        },
      (response) { emit(SentVerifyCodeSucState(response),
      );
      verifictionEmail=email;
        if (kDebugMode) {
          print(response);
        }
      }
    );

  }
  Future<void> verifyEmail({required String email,required String otp}) async {
    emit(LoginLoading());
    var result = await registerRepo.verifyEmail(
      email: email,
      otp: otp
    );
    result.fold(
      (failure) { emit(SentVerifyCodeFailState(failure.errMessage));
        },
      (response) { emit(SentVerifyCodeSucState(response),
      );
        if (kDebugMode) {
          print(response);
        }
      }
    );

  }
}
