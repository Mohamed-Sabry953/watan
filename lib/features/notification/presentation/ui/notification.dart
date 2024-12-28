import 'package:final_project_2024/core/utils/constant/appColors.dart';
import 'package:final_project_2024/core/utils/constant/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/services/responsiveUi/responsive_height.dart';
import '../../../../core/services/responsiveUi/responsive_width.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          AppLocalizations.of(context)!.notification,
          style: TextStyle(
              color: Colors.black,
              fontSize: 22.sp,
              fontFamily: "Cairo",
              fontWeight: FontWeight.w500),
        ),
        leading: Padding(
          padding: REdgeInsetsDirectional.only(start: 5),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(CupertinoIcons.back),
          ),
        ),
        centerTitle: true,
      ),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: widgetHeight(context: context, height: 200),
              child: Lottie.asset(Images.notificationJson,repeat: false)),
          Align(
              alignment: Alignment.center
              ,child: Text(AppLocalizations.of(context)!.notificationitem,style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.lightGrey
          ),)),
          SizedBox(height: widgetHeight(context: context, height: 100),)
        ],
      ),

    );
  }

  Widget notificationItem(
      {
        required BuildContext context,
        required String profileImage,
        required String name,
        required String message,
        required String time}) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: widgetHeight(context: context, height: 48),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Padding(
                    padding: REdgeInsetsDirectional.only(top: 2,start: 8.0),
                    child: Image.asset(profileImage,height: widgetHeight(context: context, height: 48),),
                  ),
                  Positioned(
                    right: -2,
                    child: Container(
                      width: widgetWidth(context: context, width: 14),
                      height: widgetHeight(context: context, height: 14),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary,
                          border: Border.all(color: Colors.white,width: 2)
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(width: widgetWidth(context: context, width: 8)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500,fontFamily: "Cairo"),
                  textAlign: TextAlign.right,
                ),
                Text(
                  message,
                  style: TextStyle(fontSize: 14.sp, color: const Color(0xff6B7A85),fontFamily: "Cairo",fontWeight: FontWeight.w500),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            const Spacer(),
            Text(
              time,
              style: TextStyle(fontSize: 14.sp, color: Colors.grey,fontFamily: "Cairo",fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Padding(
          padding:REdgeInsetsDirectional.only(top: 8.0,bottom: 8),
          child: const Divider(),
        ),
      ],
    );
  }
}