import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/services/responsiveUi/responsive_height.dart';
import '../../../../../../core/services/responsiveUi/responsive_width.dart';
import '../../../../../../core/utils/constant/images.dart';

class Countrycontent_Body extends StatelessWidget {
  const Countrycontent_Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ColorFiltered(
            colorFilter: ColorFilter.mode( Colors.white.withOpacity(.5), // اللون الأبيض مع الشفافية
              BlendMode.modulate,),
            child: Image.asset(
              'assets/projectImages/appImages/Egypt.jpg', // ضع الصورة هنا
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            // قم بزيادة/تقليل sigma للتحكم في العزل
            child: Container(
              color: Colors.black.withOpacity(0.2), // لون خلفية شفاف
            ),
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                  ),
                  Text(
                    "Egypt",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 33,
                    shadows: [
                      Shadow( color: Colors.white.withOpacity(0.8),
                        blurRadius: 20,
                        offset: Offset(0, 0),)
                    ]),
                  ),
                  SvgPicture.asset(
                    Images.drawerIcon,
                    color: Colors.black,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                height: 40,
                child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      height: widgetHeight(context: context, height: 40),
                      width: widgetWidth(context: context, width: 90),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0XFF8ABE53)),
                      child: Center(
                        child: Text(
                          "Alexlexandria",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            SizedBox(
              height: 26,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "History of ",
                      style:
                          TextStyle(fontSize: 34, fontWeight: FontWeight.w700,
                              shadows: [
                            Shadow(
                              color: Colors.white.withOpacity(0.8),
                              blurRadius: 20,
                              offset: Offset(0, 0),
                            )
                          ]),
                    ),
                    Text("Egypt",
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w700,
                          shadows: [
                            Shadow( color: Colors.white.withOpacity(0.8),
                              blurRadius: 20,
                              offset: Offset(0, 0),)

                          ]
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                "text ever since the 1500s, when an unknown printer took a galley of type and",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500,
                shadows: [
                  Shadow( color: Colors.white.withOpacity(0.8),
                    blurRadius: 20,
                    offset: Offset(0, 0),)
                ]),
              ),
            )
          ],
        )
      ],
    );
  }
}
