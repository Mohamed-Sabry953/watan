import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:final_project_2024/config/routes/app_routes.dart';
import 'package:final_project_2024/features/profile/data/repository/profile_repo_imp.dart';
import 'package:final_project_2024/features/register/presentation/manger/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../../core/cache/cachData.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepoImp) : super(ProfileInitial());
  final TextEditingController updateName=TextEditingController( );
  final TextEditingController updateEmail=TextEditingController();
  final TextEditingController updatePhone=TextEditingController();
  final TextEditingController updateAddress=TextEditingController();
  final ProfileRepoImp profileRepoImp;
  final ImagePicker picker = ImagePicker();
  File? image;

  static ProfileCubit get(context)=>BlocProvider.of(context);




  Future<void> init(BuildContext context) async {
    updateName.text=RegisterCubit.get(context).registerRepo.userModel!.user!.name!;
    updateEmail.text=RegisterCubit.get(context).registerRepo.userModel!.user!.email!;
    updatePhone.text=await CacheData.getUserPhone(key: "user_phone")??"12344555678";
    updateAddress.text=await CacheData.getUserAddress(key: "user_address")??"10Th of Ramadan";
    emit(SetInitialDataState());
  }

  Future<void> pickImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      emit(PickImageFromGalleryState());
    }
  }

  Future<void> updateProfile(BuildContext context) async {
    emit(ProfileLoadingState());
    var result = await profileRepoImp.updateProfile(
        name: updateName.text,
        image: image
    );
    result.fold(
            (failure) { emit(UpdateProfileFailState(failure.errMessage));
        },
            (updateProfile) async {
              CacheData.setUserPhone(key: "user_phone", phone: updatePhone.text);
              CacheData.setUserAddress(key: "user_address", address: updateAddress.text);
          await RegisterCubit.get(context).getProfile(context);
          Navigator.pushReplacementNamed(context,AppRoutesName.profileScreen);
          emit(UpdateProfileSucState(updateProfile),);

        }
    );

  }
}
