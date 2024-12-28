import 'package:final_project_2024/config/routes/app_routes.dart';
import 'package:final_project_2024/core/services/responsiveUi/responsive_height.dart';
import 'package:final_project_2024/core/services/responsiveUi/responsive_width.dart';
import 'package:final_project_2024/core/utils/constant/appColors.dart';
import 'package:final_project_2024/core/utils/constant/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingOne extends StatelessWidget {
  const OnboardingOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(Images.onbordingBackground),fit: BoxFit.fill)
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 4,),
              Image.asset(Images.countries, height: 250,width: 400,fit: BoxFit.fill,), // استبدل 'assets/phone.png' بمسار الصورة
              const SizedBox(height: 20),
        
        
              const Text(
                "Find Your Destination\nAnd What Happen\nAround You",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              const Spacer(flex: 2,),
              // الزر
              InkWell(
                onTap: (){
                  Navigator.pushNamedAndRemoveUntil(context, AppRoutesName.onboardingTwo, (route) => false,);
                },
                child: Container(
                  height: widgetHeight(context: context, height: 65),
                  width: widgetWidth(context: context, width: 45),
                  decoration:    BoxDecoration(
                    color: AppColors.primary,
                      shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.4),
                        offset: const Offset(4, 4),
                        blurRadius: 6,
                      ),
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.4),
                        offset: const Offset(-4, -4),
                        blurRadius: 6,
                      )
                    ]
                  ),
                  child: const Center(child: Icon(Icons.arrow_back_ios_new,textDirection: TextDirection.rtl, color: Colors.white)),
                ),
              ),
              SizedBox(
                height: widgetHeight(context: context, height: 40),
              )
            ],
          ),
        ),
      ),
    );
  }
}

