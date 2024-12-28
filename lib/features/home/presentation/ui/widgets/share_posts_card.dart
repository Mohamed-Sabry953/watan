import 'package:final_project_2024/config/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShareNewsCard extends StatelessWidget {
  const ShareNewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutesName.newPostScreen);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
        color: Colors.white,
          border: Border.all(
            color: Colors.black.withOpacity(0.2),

          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(7, 7),
              blurRadius: 4
            )
          ]
        ),
        child: Padding(
          padding: REdgeInsets.all(16.0),
          child: Row(
            children: [
              Text(
                AppLocalizations.of(context)!.share,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Spacer(),
               Icon(Icons.image_outlined,size: 28.sp,),
            ],
          ),
        ),
      ),
    );
  }
}