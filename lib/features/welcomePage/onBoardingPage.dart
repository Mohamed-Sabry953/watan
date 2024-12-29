import 'package:final_project_2024/config/routes/app_routes.dart';
import 'package:final_project_2024/core/services/responsiveUi/responsive_height.dart';
import 'package:final_project_2024/core/utils/constant/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/cache/cachData.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _bounceScaleAnimation;
  late Animation<double> _curvedScaleAnimation;

  @override
  void initState() {
    super.initState();

    // Basic Scale Animation
    _controller = AnimationController(
      upperBound: 2,
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    // Linear Scale Animation
    _scaleAnimation = Tween<double>(begin: 1.0, end: 3).animate(_controller);

  Future.delayed(const Duration(seconds: 1,milliseconds: 500),() {
    _controller.forward();
    navigate();
  },);
  }
  void navigate(){
    Future.delayed(Duration(seconds: 5),() {
      CacheData.getUserToken(key: "user_token")==null?Navigator.pushNamedAndRemoveUntil(context, AppRoutesName.loginScreen, (route) => false,):
      Navigator.pushNamedAndRemoveUntil(context, AppRoutesName.homeLayout, (route) => false,);
    },);
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedBuilder(
                animation: _scaleAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: SvgPicture.asset(Images.onBoarding,),
                  );
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(Images.onBoardingTwo),
                  SizedBox(height: widgetHeight(context: context, height: 40),),
                  SvgPicture.asset(Images.welcome).animate()
                      .fadeIn(
                    delay: const Duration(seconds: 4),
                    duration: const Duration(seconds: 2),
                  ).effect()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

