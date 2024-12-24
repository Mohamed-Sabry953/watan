import 'dart:async';
import 'package:final_project_2024/core/services/responsiveUi/responsive_height.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../core/utils/constant/appColors.dart';
import '../../manger/register_cubit.dart';
import '../../widgets/emailVerificationWidgets/verification_button.dart';
import '../../widgets/emailVerificationWidgets/verify_code.dart';

class VerifyOtpScreen extends StatelessWidget {
  VerifyOtpScreen({super.key});
  final StreamController<ErrorAnimationType> errorAnimationController=StreamController();
  final TextEditingController pinCode=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 100.h,
          title:  Text(
            "Email Verification",
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
                SizedBox(height: 55.h),
                Text(
                  "Get Your Code",
                  style: TextStyle(fontSize: 20.sp, color: AppColors.primary, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 25.h),
                Text(
                  "Please enter the 6 digit code that was sent to your email address",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13.sp, color: Colors.black87),
                ),
                SizedBox(height: widgetHeight(context: context, height: 50)),
                PinCodeItem(
                  validator: (value)
                  {
                    if (value == null || value.isEmpty) {
                      return '';
                    }

                    // Check if the input is 6 digits
                    if (!RegExp(r'^\d{6}$').hasMatch(value)) {
                      return '';
                    }

                    return null; // Valid PIN code
                  },
                  pinCode: pinCode,
                  length: 6,
                  onChanged: (p0) {
                  },
                  errorAnimationController: errorAnimationController,
                ), // Code Input Field widget
                SizedBox(height: widgetHeight(context: context, height: 60),),
                VerifyButton(pinCode: pinCode.text,function: (){
                  RegisterCubit.get(context).checkOtp(context, email: RegisterCubit.get(context).verifictionEmail, otp: pinCode.text);

                },), // Verify Button widget
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "If you don't receive the code! ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Resend code logic
                      },
                      child: const Text(
                        "Resend",
                        style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}