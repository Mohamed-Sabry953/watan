import 'package:final_project_2024/core/utils/constant/appColors.dart';
import 'package:final_project_2024/core/utils/widgets/Lnguage_drop_down.dart';
import 'package:final_project_2024/features/register/presentation/manger/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../services/responsiveUi/responsive_height.dart';
import '../../services/responsiveUi/responsive_width.dart';

class LanguageMessage extends StatefulWidget {
  const LanguageMessage({required this.text,super.key});

  final String text;

  @override
  State<LanguageMessage> createState() => _MessageState();
}

class _MessageState extends State<LanguageMessage> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 650),
      vsync: this,
    );
    animation = Tween<Offset>(
      begin: const Offset(500, 0), // Starting position
      end: const Offset(0, 0),   // Ending position (move by x = 1, y = 1)
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    ));
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.reverse();
        Future.delayed(const Duration(milliseconds: 700),() {
          Navigator.pop(context);
        },);

      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocBuilder<RegisterCubit,RegisterState>(builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  builder: (context, child) {
                    return Transform.translate(
                      offset: animation.value, // Multiplied to amplify movement
                      child: Container(
                        height: widgetHeight(context: context, height: 220),
                        width: widgetWidth(context: context, width: 145),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: REdgeInsetsDirectional.only(start: 16,top: 16),
                              child: Align(
                                alignment: AlignmentDirectional.topStart,
                                child: Text(AppLocalizations.of(context)!.chooseLang,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Cairo",
                                    color: Colors.black,
                                  ),),
                              ),
                            ),
                            const Spacer(),
                            LanguageDropDownButton(mainAxisAlignment: MainAxisAlignment.start,
                                height: widgetHeight(context: context, height: 40)
                                , buttonWidth: widgetWidth(context: context, width: 70)),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 23),
                                  child: ElevatedButton(onPressed: (){
                                    controller.reverse();
                                    Future.delayed(const Duration(milliseconds: 700),() {
                                      Navigator.pop(context);
                                    },);
                                  },
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        shape: ContinuousRectangleBorder(
                                            borderRadius: BorderRadius.circular(16.r)
                                        ),
                                        backgroundColor: AppColors.primary,
                                        fixedSize: Size(widgetWidth(context: context, width:125 ), widgetHeight(context: context, height: 50))
                                    ), child: Center(
                                        child: Text(AppLocalizations.of(context)!.confirm,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Cairo",
                                        color: Colors.white,
                                      ),)),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  animation: animation,
                ),
              ],
            ),
          );
        },),
      ),
    );
  }
}