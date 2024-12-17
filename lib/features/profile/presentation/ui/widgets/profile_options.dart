import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const ProfileOption({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  REdgeInsets.symmetric(vertical: 12, horizontal: 16.0),
      padding: REdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 8)
          )
        ],
        color: const Color(0xffF3F2F2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 24.sp),
           SizedBox(width: 13.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:  TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  value,
                  style:  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500,color: Colors.grey,),
                ),
              ],
            ),
          ),
           Icon(Icons.arrow_forward_ios, size: 16.sp),
        ],
      ),
    );
  }
}