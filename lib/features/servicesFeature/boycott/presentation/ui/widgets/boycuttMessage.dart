import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../core/services/responsiveUi/responsive_height.dart';
import '../../../../../../core/services/responsiveUi/responsive_width.dart';

class boycuttMessage extends StatefulWidget {
  const boycuttMessage({required this.text,super.key});

  final String text;

  @override
  State<boycuttMessage> createState() => _MessageState();
}

class _MessageState extends State<boycuttMessage> with SingleTickerProviderStateMixin {
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                builder: (context, child) {
                  return Transform.translate(
                    offset: animation.value, // Multiplied to amplify movement
                    child: Container(
                      height: widgetHeight(context: context, height: 240),
                      width: widgetWidth(context: context, width: 145),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.r),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(),
                          SizedBox(height: widgetHeight(context: context, height: 20),),
                          Padding(
                            padding: REdgeInsetsDirectional.only(start: 25.0,end: 25),
                            child: Text(widget.text,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Cairo",
                                color: Colors.green
                              ),),
                          ),
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
                                      backgroundColor: const Color(0xffF3F5F5),
                                      fixedSize: Size(widgetWidth(context: context, width:125 ), widgetHeight(context: context, height: 50))
                                  ), child: Center(child: Text("حسناً",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Cairo",
                                      color: Colors.black,
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
        ),
      ),
    );
  }
}