
import 'package:final_project_2024/config/routes/app_routes.dart';
import 'package:final_project_2024/core/services/responsiveUi/responsive_height.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constant/appColors.dart';
import '../../../../register/presentation/manger/register_cubit.dart';

class ProfileHeader extends StatelessWidget {
  final Size size;

  const ProfileHeader({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         SizedBox(height: widgetHeight(context: context, height: 70)),
        Text(
          RegisterCubit.get(context).registerRepo.userModel?.user?.name??"Mohamed Sabry",
          style: TextStyle(
            fontSize: 21.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, AppRoutesName.updateProfileScreen);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Text("Edit Profile",style: TextStyle(
              color: Colors.white
          ),),
        ),
      ],
    );
  }
}