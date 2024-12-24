import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/services/responsiveUi/responsive_height.dart';

class RegisterTextField extends StatefulWidget {
  RegisterTextField(
      {this.hintText = "",
      required this.textEditingController,
      this.obscure = false,
        this.fill=true,
        this.border=false,
        this.validator,
         this.formState,
        required this.suffixIcon,
        this.onChanged,
      super.key});

  TextEditingController textEditingController;
  String hintText;
  bool obscure;
  bool fill;
  bool border;
  String? Function(String?)? validator;
  final bool? formState;
  bool suffixIcon=false;
  void Function(String)? onChanged;

  @override
  State<RegisterTextField> createState() => _RegisterTextFieldState();
}

class _RegisterTextFieldState extends State<RegisterTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color:  !widget.formState!||widget.fill==false?Colors.transparent:Color(0xff000000).withOpacity(0.08),
            blurRadius: 8,
            offset: Offset(4, 9)
          )
        ]
      ),
      child: TextFormField(
        onChanged: widget.onChanged,
        controller: widget.textEditingController,
        obscureText: widget.obscure,
        validator: widget.validator,
        decoration: InputDecoration(
          suffixIcon: widget.suffixIcon?GestureDetector(
              onTap: () {
                setState(() {
                  widget.obscure=! widget.obscure;
                });
              },
              child: Icon(widget.obscure?CupertinoIcons.eye_slash:CupertinoIcons.eye)):null,
            hintStyle: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black54),
            hintText: widget.hintText,
            border: OutlineInputBorder(
                borderSide: widget.border==false?BorderSide.none:const BorderSide(
                  color: Colors.black,
                  width: 1
                ),
                borderRadius: BorderRadius.circular(12.r)),
            fillColor: Color(0xff000000).withOpacity(0.09),
            filled: widget.fill),
      ),
    );
  }
}
