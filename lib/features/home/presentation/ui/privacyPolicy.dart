import 'package:final_project_2024/features/home/presentation/manger/provider/lang_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/constant/appColors.dart';
import '../../../../core/utils/constant/images.dart';

class PrivacyPolicyPage extends StatelessWidget {

  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    var provider = Provider.of<LangProvider>(context);
    return Scaffold(
      backgroundColor:
           Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsetsDirectional.only(top: 25, start: 10, end: 5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: provider.langKey=="en"?SvgPicture.asset(
                      Images.backArrowIos,
                      color: Colors.black87,
                    ):const Icon(Icons.arrow_back_ios),
                  ),
                  Text(
                    AppLocalizations.of(context)!.privacyPolicy,
                    style: GoogleFonts.notoKufiArabic(
                        color: AppColors.primary, fontSize: 22.sp),
                  ),
                  SizedBox(
                    width: 20.w,
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Column(
                children: [
                  Divider(
                    color: AppColors.lightGrey,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    AppLocalizations.of(context)!.privacyOne,
                    style: GoogleFonts.notoKufiArabic(
                        color: AppColors.heavyGrey, fontSize: 17.sp),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    AppLocalizations.of(context)!.privacyTwo,
                    style: GoogleFonts.notoKufiArabic(
                        color: AppColors.heavyGrey, fontSize: 17.sp),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    AppLocalizations.of(context)!.privacyThree,
                    style: GoogleFonts.notoKufiArabic(
                        color: AppColors.heavyGrey, fontSize: 17.sp),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    AppLocalizations.of(context)!.privacyFour,
                    style: GoogleFonts.notoKufiArabic(
                        color: AppColors.heavyGrey, fontSize: 17.sp),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    AppLocalizations.of(context)!.privacyFive,
                    style: GoogleFonts.notoKufiArabic(
                        color: AppColors.heavyGrey, fontSize: 17.sp),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    AppLocalizations.of(context)!.privacySix,
                    style: GoogleFonts.notoKufiArabic(
                        color: AppColors.heavyGrey, fontSize: 17.sp),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    AppLocalizations.of(context)!.privacySeven,
                    style: GoogleFonts.notoKufiArabic(
                        color: AppColors.heavyGrey, fontSize: 17.sp),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    AppLocalizations.of(context)!.privacyEight,
                    style: GoogleFonts.notoKufiArabic(
                        color:AppColors.heavyGrey, fontSize: 17.sp),
                  ),
                  SizedBox(
                    height: 30.h,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
