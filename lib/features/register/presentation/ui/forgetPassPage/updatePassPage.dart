import 'dart:async';

import 'package:final_project_2024/core/services/responsiveUi/responsive_height.dart';
import 'package:final_project_2024/core/utils/constant/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../core/utils/constant/appColors.dart';
import '../../widgets/emailVerificationWidgets/verification_button.dart';
import '../../widgets/registerWidgets/register_textfeild.dart';

class UpdatePassPage extends StatelessWidget {
  UpdatePassPage({super.key});
  final StreamController<ErrorAnimationType> errorAnimationController=StreamController();
  final TextEditingController email=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 70.h,
          title:  Text(
            "Reset Password",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 18.h),
                SvgPicture.asset(Images.updatePassIcon,height: widgetHeight(context: context, height: 230),),
                SizedBox(height: widgetHeight(context: context, height: 24),),
                Text(
                  "Enter New Password",
                  style: TextStyle(fontSize: 20.sp, color: AppColors.primary, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 18.h),
                Text(
                  "Your new password must be different from previously used password",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13.sp, color: Colors.black87),
                ),
                SizedBox(height: widgetHeight(context: context, height: 24)), // Code Input Field widget
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(
                        color: Colors.black,
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(
                        color: AppColors.primary
                      )
                    ),
                    label: Text("Password",style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.7)
                    ),)
                  ),
                ),
                SizedBox(height: widgetHeight(context: context, height: 24),),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      borderSide: const BorderSide(
                        color: AppColors.primary
                      )
                    ),
                    label: Text("Confirm password",style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.7)
                    ),)
                  ),
                ),
                SizedBox(height: widgetHeight(context: context, height: 66),),
                ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(1000, widgetHeight(context: context, height: 60)),
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ), // Verify Button widget
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}