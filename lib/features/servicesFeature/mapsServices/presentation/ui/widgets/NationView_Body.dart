import 'package:final_project_2024/core/services/responsiveUi/responsive_height.dart';
import 'package:final_project_2024/core/services/responsiveUi/responsive_width.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/utils/constant/images.dart';

class NationView_Body extends StatelessWidget {
  const NationView_Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              "assets/projectImages/appImages/nation.png",
              fit: BoxFit.fill,
            )),
        Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [
            SizedBox(
              height: widgetHeight(context: context, height: 28),
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
                        fontSize: 33),
                  ),
                  SvgPicture.asset(
                    Images.drawerIcon,
                    color: Colors.black,
                  )
                ],
              ),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(55),
                      topRight: Radius.circular(55))),
              height: 450,
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: widgetHeight(context: context, height: 25),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Container(
                      height: 40,
                      child: ListView.builder(
                        itemBuilder: (context, index) =>
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5),
                              child: Container(
                                height: widgetHeight(
                                    context: context, height: 40),
                                width: widgetWidth(context: context, width: 90),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Color(0XFF8ABE53)),
                                child: Center(
                                  child: Text(
                                    "Alexlexandria",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ),
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: widgetHeight(context: context, height: 25),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "History of Egypt",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: widgetHeight(context: context, height: 15),
                        ),

                        Text(
                          "text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only ",
                          style:TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.black),)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(
        0, size.height - 50); // ابدأ من الزاوية اليسرى السفلية مع إزاحة للأعلى
    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
    Offset(size.width - (size.width / 3.25), size.height - 65);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0); // ارجع إلى الزاوية اليمنى العلوية
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; // إعادة الرسم فقط عند الحاجة
  }
}
