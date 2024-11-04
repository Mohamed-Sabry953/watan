import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/services/responsiveUi/responsive_height.dart';

class RegisterTextField extends StatelessWidget {
  RegisterTextField(
      {this.hintText = "",
      required this.textEditingController,
      this.obscure = false,
      super.key});

  TextEditingController textEditingController;
  String hintText;
  bool obscure;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widgetHeight(context: context, height: 60),
      child: TextFormField(
        controller: textEditingController,
        maxLines: null,
        minLines: null,
        expands: true,
        obscureText: obscure,
        decoration: InputDecoration(
            hintStyle: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black54),
            hintText: hintText,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12.r)),
            fillColor: Color(0xff000000).withOpacity(0.15),
            filled: true),
      ),
    );
  }
}
