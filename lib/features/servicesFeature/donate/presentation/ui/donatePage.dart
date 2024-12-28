import 'package:final_project_2024/core/services/responsiveUi/responsive_height.dart';
import 'package:final_project_2024/core/services/responsiveUi/responsive_width.dart';
import 'package:final_project_2024/core/utils/constant/images.dart';
import 'package:final_project_2024/features/servicesFeature/donate/data/donate_list_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DonateScreen extends StatelessWidget {
  const DonateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(Images.donateBackground),fit: BoxFit.cover)
        ),
        child: Column(
          children: [
              SizedBox(height: widgetHeight(context: context, height: 30)),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                SvgPicture.asset(Images.backArrowIos,width: widgetWidth(context: context, width: 13),),
                Text("donate",style: TextStyle(
                  fontSize: 23.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600
                ),),
                Icon(Icons.menu,size: 24.sp,)
              ],),
            ),
             SizedBox(height: widgetHeight(context: context, height: 60)),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 6, // Replace with dynamic data length
                itemBuilder: (context, index) {
                  return DonationCard(
                    imageUrl: DonateListItems.items[index].image,
                    title: DonateListItems.items[index].title,
                    description:DonateListItems.items[index].mainContent
                    ,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DonationCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const DonationCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widgetHeight(context: context, height: 160),
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black87.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imageUrl,
              height: 120,
              width: 110,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 SizedBox(height: widgetHeight(context: context, height: 16)),
                Text(
                  description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}