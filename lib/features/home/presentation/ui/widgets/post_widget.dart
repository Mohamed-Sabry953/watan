import 'package:final_project_2024/config/routes/app_routes.dart';
import 'package:final_project_2024/core/services/responsiveUi/responsive_height.dart';
import 'package:final_project_2024/core/utils/constant/generic_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/constant/appColors.dart';
import '../../../../../core/utils/constant/appConstant.dart';
import '../../../../../core/utils/constant/styles.dart';
import '../../../../chatbot/presentation/ui/widgets/chat_textfield.dart';
import '../../../../register/presentation/manger/register_cubit.dart';
import '../../manger/cubit/home_cubit.dart';

class PostWidget extends StatelessWidget {
  PostWidget({required this.index, required this.homeState,super.key});

  HomeState homeState;
  final int index;

  @override
  Widget build(BuildContext context) {
    final double width=MediaQuery.of(context).size.width;
    final double height=MediaQuery.of(context).size.height;
    return homeState is HomeLoadingState || HomeCubit.get(context).homeRepoImp.postsModel==null? Container(
            padding: REdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black.withOpacity(0.4)
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 6,
                  spreadRadius: 2,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: CircleAvatar(
                        radius: 20.r,
                        backgroundColor: Colors.grey[300],
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 12.h,
                            width: 80.w,
                            color: Colors.grey[300],
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 10.h,
                            width: 50.w,
                            color: Colors.grey[300],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 16.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                        color: Colors.grey[300],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 20.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                    color: Colors.grey[300],
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 20.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                    color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12.r)
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 16.h,
                          width: 16.w,
                          color: Colors.grey[300],
                        ),
                        SizedBox(width: 4.w),
                        Container(
                          height: 12.h,
                          width: 20.w,
                          color: Colors.grey[300],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 16.h,
                          width: 16.w,
                          color: Colors.grey[300],
                        ),
                        SizedBox(width: 4.w),
                        Container(
                          height: 12.h,
                          width: 20.w,
                          color: Colors.grey[300],
                        ),
                      ],
                    ),
                    Container(
                      height: 16.h,
                      width: 16.w,
                      color: Colors.grey[300],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 16.h,
                          width: 16.w,
                          color: Colors.grey[300],
                        ),
                        SizedBox(width: 4.w),
                        Container(
                          height: 12.h,
                          width: 20.w,
                          color: Colors.grey[300],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        : Container(
      margin: REdgeInsetsDirectional.only(bottom: 12,start: 8,end: 8),
            padding: REdgeInsets.only(top: 16.0,left: 16,right: 16,bottom: 8),
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black.withOpacity(0.2)
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 6,
                  spreadRadius: 2,
                  offset: const Offset(3, 9),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage:  NetworkImage(
                          HomeCubit.get(context).homeRepoImp.postsModel?.data?[index].user?.profilePhoto??'https://s3-alpha-sig.figma.com/img/9cc4/464c/2f27326011ba562898e108aa9522819c?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=gPdl5XufMRJjf2IAekqcc9Rvi~bU0-41-52t~4CN7WGR6qkIXfRro7bYS799Bx8xSKov~bPAwLZ0r4yWwrFcc5xaf2uSiAwXi2AWCMcpJwHyhpYJ~ETiazMqvyAmok3uXDHhT2329Xv5gLszPrw6j~rduW4E0C~mfcPDEPRC5eL6yttCvHb3SlvyUXnqkYHC1T53koofNGDGPMTeihs2S3VtBJ6XrqahDcJYm05QIjBuAH9X-MfRAoKVv5uZaCNJnz5UwGWd2sWIYYY246fjOrh6wbg-dq-w3YUxAiRbsGly8RT5ZwUL1L7Ar2Sb9J0ttMNwyneRTTC4oSwYH6WZRw__'),
                      // Replace with your image
                      radius: 20.r,
                    ),
                    SizedBox(width: 12.w),
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          HomeCubit.get(context).homeRepoImp.postsModel?.data?[index].user?.name??"Mohamed Sabry",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '1h',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.more_horiz),
                  ],
                ),
                SizedBox(height: widgetHeight(context: context, height: 12),),
                HomeCubit.get(context).homeRepoImp.postsModel!.data![index].media!.isEmpty?
                const SizedBox()
                    :
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.network(HomeCubit.get(context).homeRepoImp.postsModel!.data![index].media![0],
                  height: widgetHeight(context: context, height: 220),
                  width: 1000,fit: BoxFit.fill,),
                ),
                SizedBox(height: widgetHeight(context: context, height: 10)),
                Text(
                  HomeCubit.get(context).homeRepoImp.postsModel?.data?[index].content??"",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutesName.commentScreen);
                        GenericVariables.commentId=HomeCubit.get(context).homeRepoImp.postsModel?.data?[index].id.toString();
                      },
                      child: Container(
                        width: width/1.15,
                        height: height * 0.06,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black.withOpacity(0.3)),
                            borderRadius: BorderRadius.circular(16.r)
                        ),
                        padding: const EdgeInsets.only(left: 8,right: 8),
                        child: Row(
                          children: [
                            Text("Write a comment",style: Styles.poppins16400Black(context),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
