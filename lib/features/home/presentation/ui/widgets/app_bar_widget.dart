import 'package:final_project_2024/config/routes/app_routes.dart';
import 'package:final_project_2024/core/services/responsiveUi/responsive_width.dart';
import 'package:final_project_2024/core/utils/constant/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/constant/images.dart';
import '../../manger/provider/lang_provider.dart';

class AppHeader extends StatelessWidget {
   AppHeader(this.scaffoldKey,{super.key});
  GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    var provider= Provider.of<LangProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        provider.langKey=="en"?SvgPicture.asset(Images.watanIcon,width: widgetWidth(context: context, width: 40)):
        Text("وطن",style: TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.w700,
          fontSize: 24.sp,
        ),),
        Row(
          children: [
            Stack(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutesName.notificationScreen);
                    },
                    child: SvgPicture.asset(Images.notification)),
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