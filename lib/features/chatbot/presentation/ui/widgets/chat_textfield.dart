import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constant/appColors.dart';
import '../../../../../core/utils/constant/styles.dart';


class DefaultTextFormField extends StatefulWidget {
   int? maxLength;
   int? maxLines;
   bool isEnabled;
   bool required;
   bool isPassword;
  bool isFilled;
  bool hasBorder;
  bool autoFocus;
  bool readOnly;
  bool underLine;
  double contentPaddingVertical;
  double contentPaddingHorizontal;
  double borderRadius;
  double borderSideWidth;
  Color enabledBorderRadiusColor;
  Color? borderSideColor;
  Color? borderSideEnabledColor;
  Color? labelColorActive;
  String? passwordIcon;
  String? passwordActiveIcon;
  TextInputType textInputType;
  Widget? prefixIcon;
  Widget? suffixIcon;
  Function? onPressSuffixIcon;
  Function(String)? onFilledSubmit;
  Function(String)? onChange;
  String? Function(String?)? validation; // Validation function
  Function? onTap;
  String? labelText;
  String? hintText;
  TextEditingController controller;
  Color? fillColor;
  TextStyle? style;
  TextStyle? hintStyle;

  DefaultTextFormField({
    Key? key,
    this.isPassword = false,
    this.autoFocus = false,
    this.readOnly = false,
    this.isFilled = false,
    this.underLine = false,
    this.hasBorder = true,
    this.labelColorActive,
    this.required = true,
    this.isEnabled = true,
    this.passwordIcon,
    this.passwordActiveIcon,
    this.borderSideWidth = 1.0,
    this.contentPaddingHorizontal = 10.0,
    this.borderSideColor,
    this.contentPaddingVertical = 15.0,
    this.borderRadius = 10,
    this.enabledBorderRadiusColor = Colors.grey,
    this.maxLength,
    this.maxLines,
    this.labelText,
    this.hintText,
    this.hintStyle,
    required this.textInputType,
    required this.controller,
    this.onFilledSubmit,
    this.onChange,
    this.borderSideEnabledColor,
    this.onTap,
    this.onPressSuffixIcon,
    this.validation, // Pass validation function here
    this.suffixIcon,
    this.prefixIcon,
    this.style,
    this.fillColor,
  }) : super(key: key);

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  late FocusNode myFocusNode;
  bool hidePassword = true;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    myFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      style: widget.style ?? Styles.poppins14400Black(context),
      readOnly: widget.readOnly,
      textAlignVertical: TextAlignVertical.top,
      obscureText: widget.isPassword && hidePassword,
      focusNode: myFocusNode,
      autofocus: widget.autoFocus,
      enabled: widget.isEnabled,
      obscuringCharacter: '●',
      controller: widget.controller,
      keyboardType: widget.textInputType,
      validator: widget.validation, // Use validation function
      onFieldSubmitted: (value) {
        if (widget.onFilledSubmit != null) {
          widget.onFilledSubmit!(value);
        }
      },
      onChanged: (value) {
        if (widget.onChange != null) {
          widget.onChange!(value);
        }
      },
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(
          vertical: widget.contentPaddingVertical.h,
          horizontal: widget.contentPaddingHorizontal.w,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(widget.borderRadius.r),
          ),
          borderSide: (!widget.hasBorder)
              ? BorderSide.none
              : BorderSide(
            color: widget.borderSideColor ?? AppColors.primaryColor,
            width: widget.borderSideWidth.w,
          ),
        ),
        focusedBorder: widget.underLine
            ? const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffE2E8F0)),
        )
            : OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(widget.borderRadius.r),
          ),
          borderSide: (!widget.hasBorder)
              ? BorderSide.none
              : BorderSide(
            color: widget.borderSideColor ?? AppColors.primaryColor,
            width: widget.borderSideWidth.w,
          ),
        ),
        enabledBorder: widget.underLine
            ? const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffE2E8F0)),
        )
            : OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(widget.borderRadius.r),
          ),
          borderSide: (!widget.hasBorder)
              ? BorderSide.none
              : BorderSide(
            color: widget.borderSideEnabledColor ?? Colors.grey.shade300,
            width: widget.borderSideWidth.w,
          ),
        ),
        filled: true,
        fillColor: widget.fillColor ?? Colors.white,
        prefixIcon: widget.prefixIcon,
        labelText: widget.labelText,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ?? Styles.poppins14400HeavyGray(context),
        errorMaxLines: 2,
        labelStyle: TextStyle(
          color: myFocusNode.hasFocus
              ? widget.labelColorActive ?? AppColors.primaryColor
              : widget.labelColorActive ?? Colors.grey,
          fontSize: MediaQuery.of(context).size.height * 0.02,
        ),
        suffixIcon: widget.suffixIcon ?? (widget.isPassword
            ? IconButton(
          onPressed: () {
            setState(() {
              hidePassword = !hidePassword;
            });
          },
          icon: SvgPicture.asset(
            hidePassword
                ? widget.passwordIcon!
                : widget.passwordActiveIcon!,
            color: myFocusNode.hasFocus
                ? AppColors.primaryColor
                : const Color(0xffB4C0CC),
          ),
        )
            : null),
      ),
    );
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }
}