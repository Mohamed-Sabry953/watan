import 'package:final_project_2024/core/services/responsiveUi/responsive_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/constant/images.dart';
import '../../../../register/presentation/manger/register_cubit.dart';

class AppHeader extends StatelessWidget {
   AppHeader(this.scaffoldKey,{super.key});
  GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(Images.watanIcon,width: widgetWidth(context: context, width: 40),),
        Row(
          children: [
            Stack(
              children: [
                SvgPicture.asset(Images.notification),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
             SizedBox(width: 14.w),
             GestureDetector(
                 onTap: () {
                   scaffoldKey.currentState!.openDrawer();
                 },
                 child: Icon(Icons.menu,size: 24.sp,)),
          ],
        ),
      ],
    );
  }
}