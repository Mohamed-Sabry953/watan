import 'package:dio/dio.dart';
import 'package:final_project_2024/config/routes/app_routes.dart';
import 'package:final_project_2024/core/cache/cachData.dart';
import 'package:final_project_2024/features/register/data/model/UserModel.dart';
import 'package:final_project_2024/features/register/data/repo/register_%20repo_imp.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepo) : super(RegisterInitial());
  RegisterRepoImpl registerRepo;

  static RegisterCubit get(context) => BlocProvider.of(context);
  bool checkBox = false;
  String verifictionEmail="";
  int currentIndex=1;
  String passConfirm="";
  int drawerIndex=0;


// dynamic screens methods
  void checkBoxOperate() {
    checkBox = !checkBox;
    emit(ChangeCheckBoxState());
  }
  void changeBottomNavIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavIndexState());
  }

  // drawer items
  void changeDrawerItemIndex(int index){
    drawerIndex=index;
    emit(ChangeDrawerItemIndex());
  }

// register methods
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
      CacheData.setUserToken(key: "user_token", token: registerItem.data["data"]["access_token"]);
      CacheData.setUserPhone(key: "user_phone", phone: "01062832632");
      CacheData.setUserAddress(key: "user_address", address: "10 Th of Ramadan");
        sendVerifyCode(email: email);
        if (kDebugMode) {
          print(CacheData.getUserToken(key: "user_token"));
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
        CacheData.setUserToken(key: "user_token", token: registerItem.data["data"]["access_token"]);
        if (kDebugMode) {
          print(CacheData.getUserToken(key: "user_token"));
          print(registerItem);
        }
      }
    );

  }
  Future<void> sendVerifyCode({required String email}) async {
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
      (failure) {
        emit(SentVerifyCodeFailState(failure.errMessage));
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text('Enter vaild verify code!')),
        );
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
      context,
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
      context,
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
        Navigator.pushNamedAndRemoveUntil(context, AppRoutesName.loginScreen, (route) => false,);
        if (kDebugMode) {
          print(response);
        }
      }
    );

  }

  // validation methods
  String? validateNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجى ادخال البيانات';
    }
    return null;
  }
  // Validate name
   String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }
    if (value.trim().length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null; // Valid
  }
  // Validate email
   String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null; // Valid
  }
   String? validateStrongPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!RegExp(r'\d').hasMatch(value)) {
      return 'Password must contain at least one number';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    return null;
  }
  // Validate password confirmation
   String? validatePasswordConfirmation(String? password) {
    if (password == "" || password!.trim().isEmpty) {
      return 'Confirm your password';
    }
    if (password != passConfirm) {
      return 'Passwords do not match';
    }
    return null; // Valid
  }

  //get profile data in register because it is general cubit
  Future<void> getProfile(BuildContext context) async {
    emit(GetProfileLoadingState());
    var result = await registerRepo.getProfile(
      context
    );
    result.fold(
            (failure) { emit(GetProfileFailState(failure.errMessage));

        },
            (profile) { emit(GetProfileSucState(profile),
        );
        if (kDebugMode) {
          print(profile);
        }
        }
    );

  }

  //logout
Future<void> logout(BuildContext context) async {
    await CacheData.deleteUserToken(key: "user_token");
    Navigator.pushNamedAndRemoveUntil(context, AppRoutesName.loginScreen, (route) => false,);
}
}

