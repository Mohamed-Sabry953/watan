import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:final_project_2024/core/utils/constant/images.dart';
import 'package:final_project_2024/features/chatbot/presentation/ui/chatPage.dart';
import 'package:final_project_2024/features/home/presentation/ui/homePage.dart';
import 'package:final_project_2024/features/register/presentation/manger/register_cubit.dart';
import 'package:final_project_2024/features/servicesFeature/servicePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/utils/constant/appColors.dart';

class HomeLayout extends StatefulWidget {
   HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  List<Widget>pages=[ServicesPage(),const HomeScreen(),const ChatScreen()];


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit,RegisterState>(builder: (context, state) {
      return Scaffold(

        bottomNavigationBar: RegisterCubit.get(context).currentIndex==2?null:CurvedNavigationBar(
          height: 75.h,
          index:1,
          items:  [
            CurvedNavigationBarItem(
                child: SvgPicture.asset(Images.servicesIcon,color: Colors.white,width: 20.w,),
                label:"Services",
                labelStyle: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.white
                )
            ),
            CurvedNavigationBarItem(
                child: Icon(
                  Icons.home_outlined,
                  size: 19.sp,
                  color: Colors.white,
                ),
                label: "Home",
                labelStyle: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.white
                )
            ),

            CurvedNavigationBarItem(
                child: SvgPicture.asset(Images.chatIcon,color: Colors.white,width: 20.w,),
                label: "Chat",
                labelStyle: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.white
                )
            ),
          ],
          // The Properties Of NavigationBar
          color: AppColors.primary,
          buttonBackgroundColor:AppColors.primary,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          onTap: (index) {
            RegisterCubit.get(context).changeBottomNavIndex(index);
          },
        ),
        body: pages[RegisterCubit.get(context).currentIndex],
      );
    },);
  }
}
