import 'package:final_project_2024/core/utils/constant/images.dart';
import 'package:final_project_2024/features/chatbot/presentation/ui/widgets/chat_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../../core/utils/constant/appColors.dart';
import '../../../../core/utils/constant/appConstant.dart';
import '../../../../core/utils/constant/styles.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.insert(0, {
          'text': _controller.text,
          'isMe': false,
          'isImage': false,
        });
        _controller.clear();
      });
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _messages.insert(0, {
          'text': pickedFile.path,
          'isMe': true,
          'isImage': true,
        });
      });
      _scrollToBottom();
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
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
                        SvgPicture.asset(Images.backArrow),
                        SizedBox(width: 12.w,),
                        CircleAvatar(
                          radius: 26.r,
                          backgroundColor: AppColors.activeGreen,
                          backgroundImage: const NetworkImage("https://s3-alpha-sig.figma.com/img/903f/d4a2/a3f0b5c7f1b1ffaed7f023684e73d14b?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=p3kdXT-82xrLs9D6wAvp1BKl1v4TU5a2HXPCO1M0KRRVcAaPfOyy8p6d-dnH49wCEA40KQwE-xjxKSIbr~IMGOpHjtUtzfQBXCt4Hasgu26OCX-XfK1KRUJvbc~Wid7AwpiPEH21o-ndmnlwQAJoDS9v2VZEFmA4Wue1QUspGOp08jYQTC-lGmpIVddMf70QB6jRltay6ea3UtMQSq5jC9bk~hbzN5qNgbY3sMCwJToBh9fEexDv65fDYRphxHLszN7j4rZ3aPmtC12-hXx6wAVRZwQoTaU4ESzgounK7KtYtsR~qpq-fnalcE9~RBRP~8vommqCZInkgOwtnCjmGA__"),
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
                        controller: _scrollController,
                        padding: EdgeInsets.all(width * 0.02),
                        reverse: true,
                        itemCount: _messages.length,
                        itemBuilder: (context, index) {
                          final message = _messages[index];
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
                            onTap: _pickImage,
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
                              controller: _controller,
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
                            onTap: _sendMessage,
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
    );
  }
}
