import 'package:final_project_2024/core/utils/constant/appColors.dart';
import 'package:final_project_2024/core/utils/widgets/drawer.dart';
import 'package:final_project_2024/features/profile/presentation/ui/widgets/profile_header.dart';
import 'package:final_project_2024/features/profile/presentation/ui/widgets/profile_options_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/constant/images.dart';
import '../../../register/presentation/manger/register_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: CustomDarwer(),
      backgroundColor: AppColors.primary,
      body: BlocBuilder<RegisterCubit,RegisterState>(builder: (context, state) {
        return Stack(
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
                        "Profile",
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
                const Spacer(),
                Container(
                  padding: REdgeInsetsDirectional.only(bottom: 50),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30.r),topLeft: Radius.circular(30.r))
                  ),
                  child:Column(
                    children: [
                      ProfileHeader(size: size),
                      const SizedBox(height: 16),
                      const ProfileOptionList(),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding:REdgeInsetsDirectional.only(bottom: 330),
              child: Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: size.width * 0.14,
                  backgroundImage: NetworkImage(RegisterCubit.get(context).registerRepo.userModel?.user?.photo??"https://dev.mudirapp.com/examples/avatar.png"),
                ),
              ),
            ),
          ],
        );
      },),
    );
  }
}