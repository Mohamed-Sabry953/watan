import 'package:final_project_2024/core/services/responsiveUi/responsive_height.dart';
import 'package:final_project_2024/core/services/responsiveUi/responsive_width.dart';
import 'package:final_project_2024/features/profile/data/repository/profile_repo_imp.dart';
import 'package:final_project_2024/features/profile/presentation/manger/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/utils/constant/appColors.dart';
import '../../../../core/utils/constant/images.dart';
import '../../../../core/utils/service locator/service_locator.dart';
import '../../../../core/utils/widgets/drawer.dart';
import '../../../register/presentation/manger/register_cubit.dart';

class UpdateProfilePage extends StatelessWidget {
  const UpdateProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: CustomDarwer(),
      backgroundColor: AppColors.primary,
      body: BlocProvider(create: (context) => ProfileCubit(sl<ProfileRepoImp>())..init(context),
      child: BlocBuilder<ProfileCubit,ProfileState>(builder: (context, state) {
        return CustomScrollView(
          slivers: [
            state is ProfileLoadingState?SliverToBoxAdapter(
            child: Stack(
            alignment: Alignment.center,
        children: [
        Column(
        children: [
        SizedBox(
        height: MediaQuery.of(context).size.height * 0.035,
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
        GestureDetector(
        onTap: () {
        Navigator.pop(context);
        },
        child: SvgPicture.asset(
        Images.backArrowIos,
        color: Colors.white,
        ),
        ),
        Text(
        "Update profile",
        style: TextStyle(
        fontSize: 24.sp,
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontFamily: "Petrona"),
        ),
        GestureDetector(
        onTap: () {
        Scaffold.of(context).openDrawer();
        },
        child: SvgPicture.asset(
        Images.drawerIcon,
        color: Colors.white,
        ),
        )
        ],
        ),
        ),
        SizedBox(height: widgetHeight(context: context, height: 185)),
        Container(
        padding: REdgeInsetsDirectional.only(bottom: 50),
        decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
        topRight: Radius.circular(30.r),
        topLeft: Radius.circular(30.r))),
        child: Column(
        children: [
        const SizedBox(height: 70),
        // Shimmer for text fields
        for (int i = 0; i < 4; i++)
        Padding(
        padding: REdgeInsets.all(8.0),
        child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
        height: 50,
        color: Colors.grey,
        ),
        ),
        ),
        SizedBox(
        height: widgetHeight(context: context, height: 30),
        ),
        Align(
        alignment: Alignment.center,
        child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          margin: REdgeInsetsDirectional.only(bottom: 50),
        height: 60,
        width: 170,
        decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(12.r)),
        ),
        ),
        ),
        ],
        ),
        )
        ],
        ),
        Padding(
        padding: REdgeInsets.only(bottom: 220),
        child: Align(
        alignment: Alignment.center,
        child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
        Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: CircleAvatar(
        radius: size.width * 0.13,
        backgroundColor: Colors.grey,
        ),
        ),
        InkWell(
        onTap: () {
        ProfileCubit.get(context).pickImageFromGallery();
        },
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
          width: widgetWidth(context: context, width: 20),
          height: widgetHeight(context: context, height: 37),
          decoration: const BoxDecoration(
          shape: BoxShape.circle, color: AppColors.primary),
          child: Icon(
          Icons.camera_alt,
          color: Colors.white,
          size: 26.sp,
          ),
          ),
        ),
        )
        ],
        ),
        ),
        ),
        ],
        ),
        ):SliverToBoxAdapter(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.035,
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
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: SvgPicture.asset(
                                Images.backArrowIos,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Update profile",
                              style: TextStyle(
                                  fontSize: 24.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Petrona"),
                            ),
                            GestureDetector(
                              onTap: () {
                                Scaffold.of(context).openDrawer();
                              },
                              child: SvgPicture.asset(
                                Images.drawerIcon,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: widgetHeight(context: context, height: 185),),
                      Container(
                        padding: REdgeInsetsDirectional.only(bottom: 50),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(30.r),topLeft: Radius.circular(30.r))
                        ),
                        child:Column(
                          children: [
                            const SizedBox(height: 70),
                            Padding(
                              padding: REdgeInsets.only(bottom: 12.0,right: 12,top: 12,left: 12),
                              child: TextFormField(
                                controller: ProfileCubit.get(context).updateName,
                                decoration: const InputDecoration(
                                  label: Text("User name"),

                                ),
                              ),
                            ),
                            Padding(
                              padding: REdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: ProfileCubit.get(context).updateEmail,
                                decoration: const InputDecoration(
                                  label: Text("Email"),

                                ),
                              ),
                            ),
                            Padding(
                              padding: REdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: ProfileCubit.get(context).updatePhone,
                                decoration: const InputDecoration(
                                  label: Text("Phone"),

                                ),
                              ),
                            ),
                            Padding(
                              padding: REdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: ProfileCubit.get(context).updateAddress,
                                decoration: const InputDecoration(
                                  label: Text("Address"),

                                ),
                              ),
                            ),
                            SizedBox(height: widgetHeight(context: context, height: 30),),
                            Align(
                              alignment: Alignment.center
                              ,child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(170,
                                      widgetHeight(
                                          context: context, height: 60)),
                                  backgroundColor: AppColors.primary,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          12.r)
                                  )
                              ),
                              onPressed: () async {
                                ProfileCubit.get(context).updateProfile(context);
                              }
                              , child:
                            Text("Confirm", style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18.sp,
                                color: Colors.white
                            ),),
                            ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: REdgeInsets.only(bottom: 220),
                    child: Align(
                      alignment: Alignment.center,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                              radius: size.width * 0.13,
                              backgroundImage: ProfileCubit.get(context).image==null?
                              NetworkImage(RegisterCubit.get(context).registerRepo.userModel?.user?.photo??"https://dev.mudirapp.com/examples/avatar.png",):
                              FileImage(ProfileCubit.get(context).image!)
                          ),
                          InkWell(
                            onTap: () {
                              ProfileCubit.get(context).pickImageFromGallery();
                            },
                            child: Container(
                              width: widgetWidth(context: context, width: 20),
                              height: widgetHeight(context: context, height: 37),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primary
                              ),
                              child: Icon(Icons.camera_alt,color: Colors.white,size: 26.sp,),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },),
      ),
    );
  }
}
