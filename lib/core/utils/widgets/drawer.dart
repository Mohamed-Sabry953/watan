import 'package:final_project_2024/config/routes/app_routes.dart';
import 'package:final_project_2024/core/utils/constant/appColors.dart';
import 'package:final_project_2024/core/utils/widgets/languageMessage.dart';
import 'package:final_project_2024/features/register/presentation/manger/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../services/responsiveUi/responsive_height.dart';
import '../../services/responsiveUi/responsive_width.dart';
import '../constant/images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomDarwer extends StatelessWidget {
  CustomDarwer({super.key});

  TextStyle drawerTextStyle = TextStyle(
      fontSize: 18.sp,
      fontFamily: "Cairo",
      fontWeight: FontWeight.bold,
      color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit,RegisterState>(builder: (context, state) {
      return Container(
        margin: REdgeInsetsDirectional.only(end: 100),
        width: widgetWidth(context: context, width: 300),
        height: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(18.r),
              bottomEnd: Radius.circular(18.r),
            )),
        child:
        Padding(
          padding: REdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: REdgeInsetsDirectional.only(start: 25),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutesName.profileScreen);
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: NetworkImage(
                                RegisterCubit.get(context).registerRepo.userModel?.user?.photo??
                              "https://dev.mudirapp.com/examples/avatar.png"),fit: BoxFit.fill)
                        ),),
                      SizedBox(
                        width: widgetWidth(context: context, width: 3),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${RegisterCubit.get(context).registerRepo.userModel?.user?.name}",
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.bold),
                          ),
                          Text(RegisterCubit.get(context).registerRepo.userModel!.user!.email!.length<20?
                          '${RegisterCubit.get(context).registerRepo.userModel?.user?.email}'
                          :'${RegisterCubit.get(context).registerRepo.userModel?.user?.email?.substring(0,20)}...'
                            ,style: TextStyle(
                              fontFamily: "Cairo",
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: const Color(0xff8E8E93)
                          ),)
                        ],
                      ),
                    ], // Your image path here
                  ),
                ),
              ),
              SizedBox(
                height: widgetHeight(context: context, height: 15),
              ),
              Divider(
                indent: 25.w,
                endIndent: 25.w,
              ),
              SizedBox(
                height: widgetHeight(context: context, height: 20),
              ),
              GestureDetector(
                  onTap: () {
                    RegisterCubit.get(context).changeDrawerItemIndex(0);
                    RegisterCubit.get(context).changeBottomNavIndex(1);
                    Navigator.pushNamedAndRemoveUntil(context, AppRoutesName.homeLayout,(route) => false,);
                  },
                  child: DrawerItem(
                      color: RegisterCubit.get(context).drawerIndex==0?AppColors.primary.withOpacity(0.15):Colors.transparent,
                      textStyle: drawerTextStyle.copyWith(
                        color: RegisterCubit.get(context).drawerIndex==0?AppColors.primary:Colors.grey,
                      ),
                      title: AppLocalizations.of(context)!.home,
                      icon: Icon(Icons.home_outlined,color: RegisterCubit.get(context).drawerIndex==0?AppColors.primary:Colors.grey,))),
              SizedBox(height: widgetHeight(context: context, height: 20),),
              GestureDetector(
                onTap: () {
                  RegisterCubit.get(context).changeDrawerItemIndex(1);
                  RegisterCubit.get(context).changeBottomNavIndex(0);
                  Navigator.pushNamed(context, AppRoutesName.homeLayout);
                },
                child: DrawerItem(
                  color: RegisterCubit.get(context).drawerIndex==1?AppColors.primary.withOpacity(0.15):Colors.transparent,
                  textStyle: drawerTextStyle.copyWith(
                    color: RegisterCubit.get(context).drawerIndex==1?AppColors.primary:Colors.grey,
                  ),
                  icon: SvgPicture.asset(Images.servicesIcon,color: RegisterCubit.get(context).drawerIndex==1?AppColors.primary:Colors.grey,),
                  title: AppLocalizations.of(context)!.services,
                ),
              ),
              SizedBox(height: widgetHeight(context: context, height: 20),),
              GestureDetector(
                onTap: () {
                  RegisterCubit.get(context).changeDrawerItemIndex(2);
                },
                child: DrawerItem(
                  color: RegisterCubit.get(context).drawerIndex==2?AppColors.primary.withOpacity(0.15):Colors.transparent,
                  textStyle: drawerTextStyle.copyWith(
                    color: RegisterCubit.get(context).drawerIndex==2?AppColors.primary:Colors.grey,
                  ),
                  icon: Icon(Icons.privacy_tip_outlined,color: RegisterCubit.get(context).drawerIndex==2?AppColors.primary:Colors.grey,),
                  title: AppLocalizations.of(context)!.privacy,
                ),
              ),
              SizedBox(height: widgetHeight(context: context, height: 20),),
              GestureDetector(
                onTap: () {
                  RegisterCubit.get(context).changeDrawerItemIndex(3);
                  RegisterCubit.get(context).changeBottomNavIndex(2);
                  Navigator.pushNamed(context, AppRoutesName.homeLayout);
                },
                child: DrawerItem(
                  color: RegisterCubit.get(context).drawerIndex==3?AppColors.primary.withOpacity(0.15):Colors.transparent,
                  textStyle: drawerTextStyle.copyWith(
                    color: RegisterCubit.get(context).drawerIndex==3?AppColors.primary:Colors.grey,
                  ),
                  icon: SvgPicture.asset(Images.chatIcon,color: RegisterCubit.get(context).drawerIndex==3?AppColors.primary:Colors.grey,),
                  title: AppLocalizations.of(context)!.chat,
                ),
              ),
              SizedBox(height: widgetHeight(context: context, height: 20),),
              GestureDetector(
                onTap: () {
                  RegisterCubit.get(context).changeDrawerItemIndex(4);
                  showLangMessage(context);
                },
                child: DrawerItem(
                  color: RegisterCubit.get(context).drawerIndex==4?AppColors.primary.withOpacity(0.15):Colors.transparent,
                  textStyle: drawerTextStyle.copyWith(
                    color: RegisterCubit.get(context).drawerIndex==4?AppColors.primary:Colors.grey,
                  ),
                  icon: Icon(Icons.language_outlined,color: RegisterCubit.get(context).drawerIndex==4?AppColors.primary:Colors.grey,),
                  title: AppLocalizations.of(context)!.language,
                ),
              ),
              SizedBox(height: widgetHeight(context: context, height: 10),),
              // GestureDetector(
              //   onTap: () {AppColors
              //     HomeCubit.get(context).changeDrawerItemIndex(5);
              //     Navigator.pushNamed(context, AppRoutesName.decoratePage);
              //   },
              //   child: DrawerItem(
              //     color: HomeCubit.get(context).drawerIndex==5?const Color(0xff3498F5).withOpacity(0.15):Colors.transparent,
              //     textStyle: drawerTextStyle.copyWith(
              //       color: HomeCubit.get(context).drawerIndex==5?const Color(0xff3498F5):Colors.grey,
              //     ),
              //     icon: SvgPicture.asset(Images.decore,color: HomeCubit.get(context).drawerIndex==5?AppColors.primary:Colors.grey,),
              //     title: 'الديكور',
              //   ),
              // ),
              const Spacer(flex: 2,),
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
                  RegisterCubit.get(context).logout(context);
                }
                , child:
              Text(AppLocalizations.of(context)!.logout, style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  color: Colors.white
              ),),
              ),
              ),
              const Spacer(),
              Padding(
                padding:  REdgeInsetsDirectional.only(end: 30,bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'App version 1.0.1',
                      style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },);
  }
  showLangMessage(BuildContext context){
    showDialog(context: context, builder: (context) {
      return LanguageMessage(text: "اختر اللغه");
    },);
  }
}

class DrawerItem extends StatelessWidget {
  final TextStyle textStyle;
  final String title;
  final Widget icon;
  final Color color;

  const DrawerItem(
      {super.key, required this.textStyle, required this.title, required this.icon,required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.r)
      ),
      height: widgetHeight(context: context, height: 50),
      margin: REdgeInsetsDirectional.only(start: 25, end: 25, ),
      padding: REdgeInsetsDirectional.only(start: 20),
      child: Row(
        children: [
          icon,
          SizedBox(
            width: widgetWidth(context: context, width: 5),
          ),
          Text(
            title,
            style: textStyle,
          )
        ],
      ),
    );
  }
}
