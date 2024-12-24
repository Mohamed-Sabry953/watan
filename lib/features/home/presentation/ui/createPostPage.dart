import 'package:final_project_2024/config/routes/app_routes.dart';
import 'package:final_project_2024/features/home/data/repository/home_repo_imp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/services/responsiveUi/responsive_height.dart';
import '../../../../core/utils/constant/appConstant.dart';
import '../../../../core/utils/constant/images.dart';
import '../../../../core/utils/constant/styles.dart';
import '../../../../core/utils/service locator/service_locator.dart';
import '../../../chatbot/presentation/ui/widgets/chat_textfield.dart';
import '../manger/cubit/home_cubit.dart';

class CreatePostPage extends StatelessWidget {
  const CreatePostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return BlocProvider(create: (context) => HomeCubit(sl<HomeRepoImp>()),
    child: BlocConsumer<HomeCubit,HomeState>(builder: (context, state) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: widgetHeight(context: context, height: 50),
            ),
            Padding(
              padding: REdgeInsets.only(
                top: 10.0,
                bottom: MediaQuery.of(context).size.height * 0.01,
                left: 10,
                right: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      Images.backArrowIos,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    "New post",
                    style: TextStyle(
                      fontSize: 24.sp,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Petrona",
                    ),
                  ),
                  const SizedBox(),
                ],
              ),
            ),
            SizedBox(
              height: widgetHeight(context: context, height: 20),
            ),
            Padding(
              padding: REdgeInsets.only(
                top: 10.0,
                bottom: MediaQuery.of(context).size.height * 0.01,
                left: 10,
                right: 10,
              ),
              child: Text(
                HomeCubit.get(context).post.text.isEmpty?"What are you thinking?":HomeCubit.get(context).post.text,
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.black87,
                  fontWeight: FontWeight.w300,
                  fontFamily: "Petrona",
                ),
              ),
            ),
            SizedBox(height: widgetHeight(context: context, height: 12),),
            HomeCubit.get(context).image==null? const Spacer():Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r)
                    ),
                      width: size.width/1.1,
                      height: size.height/1.8,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: Image.file(HomeCubit.get(context).image!,fit: BoxFit.fill,))),
                ),

              ],
            ),
            const Spacer(),
            Row(
              children: [
                Container(
                  margin: REdgeInsetsDirectional.only(start: 8, bottom: 8),
                  width: size.width / 1.2,
                  height: size.height * 0.07,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: DefaultTextFormField(
                          onChange: (p0) {
                            HomeCubit.get(context).onChangeTextField(p0);
                          },
                          textInputType: TextInputType.text,
                          controller: HomeCubit.get(context).post,
                          isFilled: true,
                          fillColor: Colors.transparent,
                          hasBorder: false,
                          hintText: "Write your thoughts",
                          style: Styles.poppins16400Black(context),
                          hintStyle: Styles.poppins16400Black(context),
                        ),
                      ),
                      SizedBox(
                        width: AppConstants.width10(context),
                      ),
                      InkWell(
                          onTap: () {
                            HomeCubit.get(context).pickImageFromGallery();
                          },
                          child: SvgPicture.asset(Images.pickImage,height: widgetHeight(context: context, height: 32),))
                    ],
                  ),
                ),
                SizedBox(
                  width: AppConstants.width10(context),
                ),
                GestureDetector(
                  onTap: () {
                    HomeCubit.get(context).setNewPost(context);
                  },
                  child: Icon(
                    Icons.send_outlined,
                    size: 30.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
    listener: (context, state) {
      if(state is HomeLoadingState){
        showDialog(context: context, builder: (context) {
          return Center(child: CircularProgressIndicator());
        },);
      }
      else if(state is SetCommentsFailState){
        Navigator.pop(context);
      }
      else if(state is SetCommentsSucState){
        Navigator.pushReplacementNamed(context, AppRoutesName.homeLayout);
      }
    },
    ),
    );
  }
}
