
import 'package:dio/dio.dart';
import 'package:final_project_2024/config/routes/app_routes.dart';
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
  int currentIndex=1;
  CrossFadeState registerCrossFadeState = CrossFadeState.showFirst;

  void checkBoxOperate() {
    checkBox = !checkBox;
    emit(ChangeCheckBoxState());
  }

  void changeFadeRegister() {
    registerCrossFadeState = CrossFadeState.showSecond;
    emit(ChangeFadeState());
  }
  void changeBottomNavIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavIndexState());
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
  Future<void> verifyEmail(BuildContext context,{required String email,required String otp}) async {
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
        Navigator.pushNamedAndRemoveUntil(context, AppRoutesName.homeLayout,(route) => false,);
        if (kDebugMode) {
          print(response);
        }
      }
    );

  }
  Future<void> forgetPass(BuildContext context,{required String email}) async {
    emit(LoginLoading());
    var result = await registerRepo.forgetPass(
      email: email,
    );
    result.fold(
      (failure) { emit(SendForgetPassCodeFailState(failure.errMessage));
        },
      (response) { emit(SendForgetPassCodeSucState(response),
      );
      verifictionEmail=email;
      Navigator.pushNamed(context, AppRoutesName.verifyOtpScreen);
        if (kDebugMode) {
          print(response);
        }
      }
    );

  }
  Future<void> checkOtp(BuildContext context, {required String email,required String otp}) async {
    emit(LoginLoading());
    var result = await registerRepo.checkOtp(
      email: email,
      otp: otp
    );
    result.fold(
      (failure) { emit(CheckOtpCodeFailState(failure.errMessage));
        },
      (response) { emit(CheckOtpCodeSucState(response),
      );
        Navigator.pushReplacementNamed(context, AppRoutesName.updatePassScreen);
        if (kDebugMode) {
          print(response);
        }
      }
    );

  }
  Future<void> resetPass(BuildContext context,{required String email,required String pass,required passConfirm}) async {
    emit(LoginLoading());
    var result = await registerRepo.resetPass(
      email: email,
      pass: pass,
      passConfirm: passConfirm
    );
    result.fold(
      (failure) { emit(ResetPassFailState(failure.errMessage));
        },
      (response) { emit(ResetPassSucState(response),
      );
        Navigator.pushNamedAndRemoveUntil(context, AppRoutesName.registerScreen, (route) => false,);
        if (kDebugMode) {
          print(response);
        }
      }
    );

  }

}
