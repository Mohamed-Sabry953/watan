import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/services/responsiveUi/responsive_height.dart';

class RegisterTextField extends StatelessWidget {
  RegisterTextField(
      {this.hintText = "",
      required this.textEditingController,
      this.obscure = false,
        this.fill=true,
        this.border=false,
      super.key});

  TextEditingController textEditingController;
  String hintText;
  bool obscure;
  bool fill;
  bool border;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widgetHeight(context: context, height: 60),
      child: TextFormField(
        controller: textEditingController,
        obscureText: obscure,
        decoration: InputDecoration(
            hintStyle: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black54),
            hintText: hintText,
            border: OutlineInputBorder(
                borderSide: border==false?BorderSide.none:const BorderSide(
                  color: Colors.black,
                  width: 1
                ),
                borderRadius: BorderRadius.circular(12.r)),
            fillColor: Color(0xff000000).withOpacity(0.15),
            filled: fill),
      ),
    );
  }
}
