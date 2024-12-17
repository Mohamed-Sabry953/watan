import 'package:final_project_2024/core/utils/constant/images.dart';
import 'package:final_project_2024/features/chatbot/data/repository/chat_bot_repo_imp.dart';
import 'package:final_project_2024/features/chatbot/presentation/manger/chatbot_cubit.dart';
import 'package:final_project_2024/features/chatbot/presentation/ui/widgets/chat_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../../core/utils/constant/appColors.dart';
import '../../../../core/utils/constant/appConstant.dart';
import '../../../../core/utils/constant/styles.dart';
import '../../../../core/utils/service locator/service_locator.dart';
import '../../../register/presentation/manger/register_cubit.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return BlocProvider(create: (context) => ChatbotCubit(sl<ChatBotRepoImp>())..initState(),
    child: BlocBuilder<ChatbotCubit,ChatbotState>(builder: (context, state) {
      return PopScope(
        onPopInvoked: (didPop) {
          return RegisterCubit.get(context).changeBottomNavIndex(1);
        },
        canPop: false,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: Column(
              children: [
                Container(
                  padding: REdgeInsetsDirectional.only(start: 10,end: 15),
                  width: width,
                  height: height * 0.1,
                  color: Colors.white,
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  RegisterCubit.get(context).changeBottomNavIndex(1);
                                },
                                child: SvgPicture.asset(Images.backArrow)),
                            SizedBox(width: 12.w,),
                            CircleAvatar(
                              radius: 26.r,
                              backgroundColor: AppColors.activeGreen,
                              backgroundImage: const NetworkImage("https://s3-alpha-sig.figma.com/img/903f/d4a2/a3f0b5c7f1b1ffaed7f023684e73d14b?Expires=1735516800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=XvIuxqrYGVAomNQoOEeATgvJ0zmWOIhSunnMxABqI5dVh8Fs5p4fwCs6dY7l54JE1sIc~9TVg46CU6gdcoBk1kfoBHeuSRWa8xTrFRK-qoELgezwul0x7Jj4DV9WKBPmXmO4l8HLbbqCW35gmELzsxQcTw0h6I4xP9ac4-EALQ8BU52F38VeEIH8jcabWLqfxaLHXXxI4YBGsHE7Mrcf51d-uJHlXo-OJXrlnjH8VymWBd6jH0YikyS1KxvLt-H1RmjpneHn6V2X-5QJHB5~~GFdtKOUh4mMo~JNhGh0Tz24MFYTmnp6Cv28P3qxjo4geDM8zeJpU4uBQnFKU64CjQ__"),
                            ),
                            SizedBox(width: 12.w,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Mohamed Sabry",
                                  style: Styles.poppins16500White(context).copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 4.r,
                                      backgroundColor: Colors.green,
                                    ),
                                    SizedBox(width: 3.w,),
                                    Text(
                                      "online",
                                      style: Styles.poppins16400Black(context).copyWith(
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(),
                        SvgPicture.asset(Images.setting)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: AppConstants.height10(context),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            controller: ChatbotCubit.get(context).scrollController,
                            padding: EdgeInsets.all(width * 0.02),
                            reverse: true,
                            itemCount: ChatbotCubit.get(context).messages.length,
                            itemBuilder: (context, index) {
                              final message = ChatbotCubit.get(context).messages[index];
                              final isMe = message['isMe'];
                              final isImage = message['isImage'];
                              return Align(
                                alignment: isMe
                                    ? Alignment.centerLeft
                                    : Alignment.centerRight,
                                child: Container(
                                  margin: EdgeInsets.only(
                                    bottom: AppConstants.height10(context),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    vertical: AppConstants.height10(context),
                                    horizontal: AppConstants.width15(context),
                                  ),
                                  decoration: BoxDecoration(
                                    color: isMe
                                        ? AppColors.primary
                                        : AppColors.greyInput,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                        AppConstants.width5(context),
                                      ),
                                      topRight: Radius.circular(
                                        AppConstants.width5(context),
                                      ),
                                      bottomLeft: isMe
                                          ? const Radius.circular(0)
                                          : Radius.circular(
                                        AppConstants.width5(context),
                                      ),
                                      bottomRight: isMe
                                          ? Radius.circular(
                                        AppConstants.width5(context),
                                      )
                                          : const Radius.circular(0),
                                    ),
                                  ),
                                  child: isImage
                                      ? Image.file(
                                    File(message['text']),
                                    width: width * 0.5,
                                    height: height * 0.3,
                                    fit: BoxFit.cover,
                                  )
                                      : Text(
                                    message['text'],
                                    style: isMe
                                        ? Styles.poppins14400White(context)
                                        : Styles.poppins14400Black(context),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          width: width,
                          height: height * 0.08,
                          color: AppColors.primary,
                          padding: const EdgeInsets.only(left: 8,right: 8),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: ChatbotCubit.get(context).pickImage,
                                child: SvgPicture.asset(
                                  Images.addGallery,
                                  width: width * 0.07,
                                  height: width * 0.07,
                                ),
                              ),
                              SizedBox(
                                width: AppConstants.width5(context),
                              ),
                              Expanded(
                                child: DefaultTextFormField(
                                  textInputType: TextInputType.text,
                                  controller: ChatbotCubit.get(context).controller,
                                  isFilled: true,
                                  fillColor: AppColors.primary,
                                  hasBorder: false,
                                  hintText: "Write a message",
                                  style:Styles.poppins16500White(context) ,
                                  hintStyle: Styles.poppins16500White(context),
                                ),
                              ),
                              SizedBox(width: AppConstants.width10(context),),
                              GestureDetector(
                                onTap: () {
                                  ChatbotCubit.get(context).chatBot();
                                  ChatbotCubit.get(context).sendMessage();
                                },
                                child: const Icon(Icons.send,color: Colors.white,),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },),
    );
  }
}
