import 'dart:async';

import 'package:final_project_2024/core/services/responsiveUi/responsive_height.dart';
import 'package:final_project_2024/core/utils/constant/images.dart';
import 'package:final_project_2024/core/utils/widgets/errorMessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../core/utils/constant/appColors.dart';
import '../../widgets/emailVerificationWidgets/verification_button.dart';
import '../../widgets/emailVerificationWidgets/verify_code.dart';
import '../../widgets/registerWidgets/register_textfeild.dart';

class ForgetPassScreen extends StatelessWidget {
   ForgetPassScreen({super.key});
  final StreamController<ErrorAnimationType> errorAnimationController=StreamController();
  final TextEditingController email=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 100.h,
          title:  Text(
            "Forget Password",
            style: TextStyle(fontSize: 21.sp, fontWeight: FontWeight.w500),
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
                 SizedBox(height: 40.h),
                 SvgPicture.asset(Images.forgetPassIcon),
                 SizedBox(height: widgetHeight(context: context, height: 35),),
                 Text(
                  "Mail Address Here",
                  style: TextStyle(fontSize: 20.sp, color: AppColors.primary, fontWeight: FontWeight.bold),
                ),
                 SizedBox(height: 25.h),
                 Text(
                  "Enter the email address associated with your account",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13.sp, color: Colors.black87),
                ),
                 SizedBox(height: widgetHeight(context: context, height: 40)), // Code Input Field widget
                RegisterTextField(textEditingController: email,fill: false,border: true,hintText: "Email",

                ),
                SizedBox(height: widgetHeight(context: context, height: 60),),
                 const VerifyButton(pinCode: "",), // Verify Button widget
                 SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}