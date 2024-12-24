import 'package:final_project_2024/core/services/responsiveUi/responsive_height.dart';
import 'package:final_project_2024/core/services/responsiveUi/responsive_width.dart';
import 'package:final_project_2024/core/utils/constant/generic_variables.dart';
import 'package:final_project_2024/features/home/data/repository/home_repo_imp.dart';
import 'package:final_project_2024/features/home/presentation/manger/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/utils/constant/appColors.dart';
import '../../../../core/utils/constant/appConstant.dart';
import '../../../../core/utils/constant/images.dart';
import '../../../../core/utils/constant/styles.dart';
import '../../../../core/utils/service locator/service_locator.dart';
import '../../../chatbot/presentation/ui/widgets/chat_textfield.dart';
import '../../../register/presentation/manger/register_cubit.dart';

class CommentsPage extends StatelessWidget {
  const CommentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(create: (context) => HomeCubit(sl<HomeRepoImp>())..getComments(GenericVariables.commentId!),
    child: BlocBuilder<HomeCubit,HomeState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: widgetHeight(context: context, height: 25),
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
                    "Comments",
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
            Expanded(
              child: state is HomeLoadingState
                  ? ListView.separated(
                itemCount: 3, // Example shimmer item count
                separatorBuilder: (context, index) => SizedBox(
                  height: widgetHeight(context: context, height: 12),
                ),
                itemBuilder: (context, index) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Padding(
                      padding: REdgeInsetsDirectional.only(start: 18),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: size.width * 0.06,
                            backgroundColor: Colors.grey[300],
                          ),
                          SizedBox(
                            width: widgetWidth(context: context, width: 5),
                          ),
                          Container(
                            width: size.width / 1.5,
                            height: size.height * 0.12,
                            margin: REdgeInsetsDirectional.only(top: 24),
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(18.r),bottomRight: Radius.circular(18.r),
                              topRight: Radius.circular(18.r)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
                  : ListView.separated(
                itemBuilder: (context, index) {
                  final commentData = HomeCubit.get(context).homeRepoImp.commentsModel?.data?[index];
                  return Padding(
                    padding: REdgeInsetsDirectional.only(start: 18),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: size.width * 0.055,
                          backgroundImage: NetworkImage(
                            commentData?.user?.profilePhoto ??
                                "https://dev.mudirapp.com/examples/avatar.png",
                          ),
                        ),
                        SizedBox(
                          width: widgetWidth(context: context, width: 5),
                        ),
                        Container(
                          padding: REdgeInsetsDirectional.only(
                              start: 12, top: 8, bottom: 8, end: 8),
                          margin: REdgeInsetsDirectional.only(top: 24),
                          width: size.width / 1.5,
                          decoration: BoxDecoration(
                            color: const Color(0xffF2F2F2),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(18.r),
                              bottomRight: Radius.circular(18.r),
                              bottomLeft: Radius.circular(18.r),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                commentData?.user?.name ?? "",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                  fontFamily: "Playpen Sans",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                commentData?.comment ?? "No content here",
                                style: TextStyle(
                                  fontFamily: "Playpen Sans",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: widgetHeight(context: context, height: 12),
                ),
                itemCount:
                HomeCubit.get(context).homeRepoImp.commentsModel?.data?.length ?? 0,
              ),
            ),
            SizedBox(height: widgetHeight(context: context, height: 16)),
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
                          textInputType: TextInputType.text,
                          controller: HomeCubit.get(context).comment,
                          isFilled: true,
                          fillColor: Colors.transparent,
                          hasBorder: false,
                          hintText: "Write a comment",
                          style: Styles.poppins16400Black(context),
                          hintStyle: Styles.poppins16400Black(context),
                        ),
                      ),
                      SizedBox(
                        width: AppConstants.width10(context),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: AppConstants.width10(context),
                ),
                GestureDetector(
                  onTap: () {
                    HomeCubit.get(context).setComments(GenericVariables.commentId!);
                  },
                  child: Icon(
                    Icons.send,
                    color: AppColors.primary,
                    size: 30.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },),
    );
  }
}
