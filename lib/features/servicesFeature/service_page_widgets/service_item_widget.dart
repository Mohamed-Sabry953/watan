import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/services/responsiveUi/responsive_height.dart';
import '../../../core/services/responsiveUi/responsive_width.dart';

class ServiceItemWidget extends StatelessWidget {
   ServiceItemWidget({required this.serviceImage,required this.iconImage,required this.describetion,super.key});
  String serviceImage;
  String iconImage;
  String describetion;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widgetHeight(context: context, height: 225),
      width: widgetWidth(context: context, width: 90),
      decoration:  BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18.r)),
          color: Colors.white
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.asset(serviceImage,width: widgetWidth(context: context, width: 90),
              height: 215*0.83,
              fit: BoxFit.fill,
            ),
          ),
          const Spacer(),
          Padding(
            padding: REdgeInsets.only(right: 16,left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(iconImage),
                Expanded(
                  child: SizedBox(
                    child: Text(describetion,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Open Sans",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                    ),),
                  ),
                )
              ],
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
