import 'dart:ui';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:final_project_2024/features/home/presentation/manger/provider/lang_provider.dart';
import 'package:final_project_2024/features/register/presentation/manger/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../services/responsiveUi/responsive_height.dart';
import '../../services/responsiveUi/responsive_width.dart';

class LanguageDropDownButton extends StatelessWidget {
  LanguageDropDownButton({required this.mainAxisAlignment,required this.height,required this.buttonWidth,super.key});
  final double buttonWidth;
  final double height;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    var provider= Provider.of<LangProvider>(context);
    return DropdownButtonHideUnderline(
      child: SizedBox(
        width:buttonWidth,
        child: DropdownButton2<String>(
          isExpanded: true,
          hint:  Row(
            mainAxisAlignment: mainAxisAlignment,
            children: [
              Text(
                provider.langValue,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color:Colors.black,
                ),
              ),
            ],
          ),
          items: provider.items
              .map((String item) => DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style:  TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xff33312C),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ))
              .toList(),
          value: provider.langValue,
          onChanged: (String? value) {
            provider.changeLang(value);
          },
          buttonStyleData: ButtonStyleData(
            height: widgetHeight(context: context, height: height),
            width: widgetWidth(context: context, width: 160),
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                  color: Colors.grey.withOpacity(0.4)
              ),
              color:  Colors.white,
            ),
            elevation: 0,
          ),
          iconStyleData:  const IconStyleData(
            icon: Icon(
              Icons.keyboard_arrow_down_sharp,
            ),
            iconSize: 28,
            iconEnabledColor: Color(0xffA6A8B1),
            iconDisabledColor: Colors.grey,
          ),
          dropdownStyleData: DropdownStyleData(

            maxHeight: widgetHeight(context: context, height: 200),
            width: widgetWidth(context: context, width: 70),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.r),
              color: Colors.white,
            ),
            offset: const Offset(0, 0),
            scrollbarTheme: ScrollbarThemeData(
              radius:  Radius.circular(40.r),
              thickness: WidgetStateProperty.all<double>(6),
              thumbVisibility: WidgetStateProperty.all<bool>(true),
            ),
          ),
          menuItemStyleData:  MenuItemStyleData(
            height: widgetHeight(context: context, height: 40),
            padding: REdgeInsets.only(left: 14, right: 14),
          ),
        ),
      ),
    );
  }
}