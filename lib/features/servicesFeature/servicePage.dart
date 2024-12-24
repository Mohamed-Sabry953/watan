
import 'package:final_project_2024/config/routes/app_routes.dart';
import 'package:final_project_2024/core/utils/constant/appColors.dart';
import 'package:final_project_2024/core/utils/constant/images.dart';
import 'package:final_project_2024/features/servicesFeature/service_page_widgets/service_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServicesPage extends StatelessWidget {
   ServicesPage({super.key});
  final List<String>describtion=[
    "Start with yourself",
    "make difference in\nthe lives of other",
    "Know more about your country",
  ];
  final List<String>serviceImages=[
    Images.boycott,
    Images.donate,
    Images.mapService,
  ];
  final List<String>iconImages=[
    Images.person,
    Images.donateIcon,
    Images.earthIcon,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Padding(
            padding: REdgeInsets.only(
                top: 10.0,
                bottom: MediaQuery.of(context).size.height * 0.03,
                left: 10,
                right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  Images.backArrowIos,
                  color: Colors.white,
                ),
                Text(
                  "Services",
                  style: TextStyle(
                      fontSize: 24.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Petrona"),
                ),
                SvgPicture.asset(
                  Images.drawerIcon,
                  color: Colors.white,
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.7641,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffF6F6F6),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(120.r),
              ),
            ),
            child: Padding(
              padding: REdgeInsets.only(bottom: 8.0,top: 20,left: 8,right: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: GridView.builder(
                      itemCount: 3,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 225,
                          mainAxisSpacing: 20,
                            crossAxisSpacing: 10,
                            crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              if(index==0){
                              Navigator.pushNamed(context, AppRoutesName.boycottpage);
                              }
                              else if(index==1){
                                Navigator.pushNamed(context, AppRoutesName.donateScreen);
                              }
                            },
                            child: ServiceItemWidget(
                              describetion: describtion[index],
                              iconImage: iconImages[index],
                              serviceImage: serviceImages[index],
                            ),
                          );
                        },),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
