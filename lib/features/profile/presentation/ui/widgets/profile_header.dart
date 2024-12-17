
import 'package:final_project_2024/core/services/responsiveUi/responsive_height.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constant/appColors.dart';

class ProfileHeader extends StatelessWidget {
  final Size size;

  const ProfileHeader({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: widgetHeight(context: context, height: 25),),
        CircleAvatar(
          radius: size.width * 0.15,
          backgroundImage: const NetworkImage("https://s3-alpha-sig.figma.com/img/903f/d4a2/a3f0b5c7f1b1ffaed7f023684e73d14b?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Di-Ga0MbPO-zALEoR9eUoUz25bK5f2yCndkOWs1wSzx~3A-A9LRB5gwjheVm683a3TcydWgW8XT8~QvBKS~IBVDnMS4cC0N65PhFsEiEUSsOS4VGBVcFHfEbr3CEQic8NV7t1sR4-fkX-Asrv0ZeZ9IdyohsMVt8fiLnEyA~4xb1Jr9ZKkL042QMCh-gpZ6q2UMNef6TOU4Cu9ROS5Z73BgeJabMIpgY-lSNU6nDSJjKJ6JRQ~QRDhWQkbelpZvbvponmBY-m5Ska2Zu2bHJTlUkMF2sbfZ5V8h~uVZB3rIDsgpToRHEj7y6wMKzJcFM-QRTObtIK4nHNutzrsxe~A__",),),
         SizedBox(height: 10.h),
         Text(
          "Ahmed ffgh",
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
         SizedBox(height: 10.h),
        ElevatedButton(
          onPressed: () {
            // Handle Edit Profile Action
          },
          style: ElevatedButton.styleFrom(
            fixedSize: Size(120.w, 42.h),
            backgroundColor:AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Text("Edit Profile",style: TextStyle(
              color: Colors.white
          ),),
        ),
      ],
    );
  }
}