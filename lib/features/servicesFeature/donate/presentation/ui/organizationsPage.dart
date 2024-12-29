import 'package:final_project_2024/core/services/responsiveUi/responsive_height.dart';
import 'package:final_project_2024/core/utils/constant/generic_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class OrganizationDetailsScreen extends StatelessWidget {
  const OrganizationDetailsScreen( {super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.asset(
                  GenericVariables.donateDataModel!.image,
                  height: widgetHeight(context: context, height: 300),
                  width: widgetHeight(context: context, height: 360),
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: widgetHeight(context: context, height: 16),),
               OrganizationInfoSection(
                imageUrl: 'https://via.placeholder.com/150',
                name: GenericVariables.donateDataModel!.title,
                address: GenericVariables.donateDataModel!.address,
                phone: GenericVariables.donateDataModel!.phoneNumber,
                website: GenericVariables.donateDataModel!.link,
              ),
               SizedBox(height: 16.h),

              // Photos Section
              SectionHeader(
                title: "Photos",
                onSeeAllPressed: () {
                  // Handle See All action
                },
              ),
               SizedBox(height: 8.h),
               PhotosSection(
                photoUrls: GenericVariables.donateDataModel?.images??[],
              ),
              const SizedBox(height: 16),

              // More Details Section
              const SectionHeader(title: "More Details"),
              const SizedBox(height: 8),
               Text(
                GenericVariables.donateDataModel!.details,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Organization Info Widget
class OrganizationInfoSection extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String address;
  final String phone;
  final String website;

  const OrganizationInfoSection({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.address,
    required this.phone,
    required this.website,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.location_on, size: 16, color: Color(0xff2E2C2C)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      address,
                      style: const TextStyle(fontSize: 14, color: Color(0xff2E2C2C)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.phone, size: 16, color: Color(0xff2E2C2C)),
                  const SizedBox(width: 8),
                  Text(
                    phone,
                    style: const TextStyle(fontSize: 14, color: Color(0xff2E2C2C)),
                  ),
                ],
              ),
               SizedBox(height: 8.w),
              GestureDetector(
                onTap: () {
                  shareOnPlatform();
                },
                child: Row(
                  children: [
                    const Icon(Icons.link, size: 16, color: Color(0xff2E2C2C)),
                     SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        website,
                        style: const TextStyle(fontSize: 14, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Section Header Widget
class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAllPressed;

  const SectionHeader({
    super.key,
    required this.title,
    this.onSeeAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (onSeeAllPressed != null)
          GestureDetector(
            onTap: onSeeAllPressed,
            child: const Text(
              "See All",
              style: TextStyle(fontSize: 14, color: Colors.green),
            ),
          ),
      ],
    );
  }
}

// Photos Section Widget
class PhotosSection extends StatelessWidget {
  final List<String> photoUrls;

  const PhotosSection({Key? key, required this.photoUrls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 10.w,),
        scrollDirection: Axis.horizontal,
        itemCount: photoUrls.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                photoUrls[index],
                height: 120,
                width: 110,
                fit: BoxFit.fill,
              ),
            ),
          );
        },
      ),
    );
  }
}
  Future<void> shareOnPlatform() async {
    late Uri url;

      url = Uri.parse(GenericVariables.donateDataModel!.link);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
