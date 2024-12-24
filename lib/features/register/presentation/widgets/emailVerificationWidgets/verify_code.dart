import 'dart:async';

import 'package:final_project_2024/core/utils/constant/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../core/services/responsiveUi/responsive_height.dart';
import '../../../../../core/services/responsiveUi/responsive_width.dart';

class PinCodeItem extends StatelessWidget {
  const PinCodeItem({
    super.key,
    this.validator,
    required this.length,
    required this.onChanged,
    required this.errorAnimationController,
    required this.pinCode,
  });

  final int length;
  final void Function(String) onChanged;
  final StreamController<ErrorAnimationType> errorAnimationController;
  final TextEditingController pinCode;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(right: 5,left: 5),
      child: PinCodeTextField(
        validator: validator,
        controller: pinCode,
        hintCharacter: "-",
        hintStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 30.sp
        ),
        length: length,
        obscureText: false,
        keyboardType: TextInputType.number,
        animationType: AnimationType.slide,
        textStyle:  TextStyle(
          color: AppColors.primary,
          fontSize: 20.sp,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w600,
        ),
        cursorColor: Colors.blue,
        onChanged: onChanged,
        pinTheme: PinTheme(
          selectedFillColor: Colors.white,
          inactiveFillColor:Colors.grey.withOpacity(0.2),
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(12),
          fieldHeight: widgetHeight(context: context, height: 60),
          fieldWidth: widgetWidth(context: context, width: 22),
          activeColor: const Color(0x192E637F),
          inactiveColor: const Color(0x192E637F),
          activeFillColor: Colors.white,
          selectedColor: AppColors.primary,
          borderWidth: 1,
        ),
        animationDuration: const Duration(milliseconds: 200),
        enableActiveFill: true,
        errorAnimationController: errorAnimationController,
        appContext: context,
      ),
    );
  }}