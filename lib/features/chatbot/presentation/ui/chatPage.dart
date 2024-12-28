import 'package:final_project_2024/core/services/responsiveUi/responsive_height.dart';
import 'package:final_project_2024/core/services/responsiveUi/responsive_width.dart';
import 'package:final_project_2024/core/utils/constant/images.dart';
import 'package:final_project_2024/features/chatbot/data/repository/chat_bot_repo_imp.dart';
import 'package:final_project_2024/features/chatbot/presentation/manger/chatbot_cubit.dart';
import 'package:final_project_2024/features/chatbot/presentation/ui/widgets/chat_textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../../../../core/utils/constant/appColors.dart';
import '../../../../core/utils/constant/appConstant.dart';
import '../../../../core/utils/constant/styles.dart';
import '../../../../core/utils/service locator/service_locator.dart';
import '../../../home/presentation/manger/provider/lang_provider.dart';
import '../../../register/presentation/manger/register_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollToBottom();
      });
  }
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    var provider= Provider.of<LangProvider>(context);
    bool isMe=true;
    return BlocProvider(create: (context) => ChatbotCubit(sl<ChatBotRepoImp>()),
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
                                child: provider.langKey=="en"?SvgPicture.asset(Images.backArrow):const Icon(Icons.arrow_back)),
                            SizedBox(width: 12.w,),
                            Container(
                              decoration: const ShapeDecoration(shape: CircleBorder(
                                side: BorderSide(
                                  width: 2,color: AppColors.activeGreen
                                )

                              )),
                              child: CircleAvatar(
                                radius: 28.r,
                                backgroundColor: Colors.grey.withOpacity(0.1),
                                backgroundImage:  const NetworkImage("https://s3-alpha-sig.figma.com/img/0db4/c34b/982783dcded3431d64b1e6c7d65229a3?Expires=1735516800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=bryKISA1OrM-olgF8KlWtt0NMxVaDg1ELRr1DUZziQQhZ7niHb91Gv6CC4op-2vkhiDMWXFsX-yWwaSS5Xt4nJfgkYDbAh2dRCiTxrdGZTdDIQmh85rFJHbS-ryDmqntlhSLPACa1Ks08wd4AIN3Pgsk~BNHJ~Q8OuXPWXSmCKw~gHA4GEV8~SiTFJavknWkGMsiRNOD6cUFPMHw9XQ8QJDtIhTLoTHEezB1weAeLDJ5gjpAyHHip8P6gtGcx-QwjbiFkJF6PSY6ogoRMGlx-UpR88FSqFnDC8FK~poTxfIgE-c8J57gU90k4txtETiMukVHdJSq989lRAqAotpDWw__")
                              ),
                            ),
                            SizedBox(width: 8.w,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.watan,
                                  style: Styles.poppins16500White(context).copyWith(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500
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
                                      AppLocalizations.of(context)!.online,
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
                        ChatbotCubit.get(context).messages.isEmpty?
                        Expanded(
                          child: Center(
                            child: SizedBox(
                                height: widgetHeight(context: context, height: 200),
                                width: widgetWidth(context: context, width: 200),
                                child: Image.asset(Images.chatBackground,)),
                          ),
                        ):Expanded(
                          child:
                          ListView.builder(
                            controller: scrollController,
                            padding: EdgeInsets.all(width * 0.02),
                            reverse: true,
                            itemCount: ChatbotCubit.get(context).messages.length,
                            itemBuilder: (context, index) {
                              final message = ChatbotCubit.get(context).messages[index];
                              isMe = message['isMe'];
                              final isImage = message['isImage'];
                              return isMe?Align(
                                alignment: isMe && provider.langKey=="en"
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
                              ):Align(
                                alignment: isMe && provider.langKey=="ar"
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

                        state is ChatbotLoadingState ||state is ChatbotSendState ?
                        Align(
                          alignment: isMe==false && provider.langKey=="ar"
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
                              color: isMe==false
                                  ? AppColors.primary
                                  : AppColors.greyInput,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                  AppConstants.width5(context),
                                ),
                                topRight: Radius.circular(
                                  AppConstants.width5(context),
                                ),
                                bottomLeft: isMe==false
                                    ? const Radius.circular(0)
                                    : Radius.circular(
                                  AppConstants.width5(context),
                                ),
                                bottomRight: isMe==false
                                    ? Radius.circular(
                                  AppConstants.width5(context),
                                )
                                    : const Radius.circular(0),
                              ),
                            ),
                            child: isMe?Lottie.asset(Images.chat,fit: BoxFit.fill):null,
                          ),
                        ):const SizedBox(width: 0,),
                        Row(
                          children: [
                            Container(
                              margin: REdgeInsetsDirectional.only(start: 8,bottom: 8),
                              width: width/1.2,
                              height: height * 0.07,
                              decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.95),
                                borderRadius: BorderRadius.circular(16.r)
                              ),
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
                                  Expanded(
                                    child: DefaultTextFormField(
                                      textInputType: TextInputType.text,
                                      controller: ChatbotCubit.get(context).controller,
                                      isFilled: true,
                                      fillColor: Colors.transparent,
                                      hasBorder: false,
                                      hintText: AppLocalizations.of(context)!.message,
                                      style:Styles.poppins16500White(context) ,
                                      hintStyle: Styles.poppins16500White(context),
                                    ),
                                  ),
                                  SizedBox(width: AppConstants.width10(context),),
                                ],
                              ),
                            ),
                            SizedBox(width: AppConstants.width10(context),),
                            GestureDetector(
                              onTap: () {
                                ChatbotCubit.get(context).chatBot();
                                ChatbotCubit.get(context).sendMessage((){
                                  scrollToBottom();
                                });
                              },
                              child:  Icon(Icons.send,color: AppColors.primary,size: 30.sp,),
                            ),
                          ],
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
  void scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } else {
      if (kDebugMode) {
        print('ScrollController has no clients');
      }
    }
  }
}

