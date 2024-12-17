import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../manger/home_cubit.dart';

class PostWidget extends StatelessWidget {
  PostWidget({required this.index, required this.homeState,super.key});

  HomeState homeState;
  final int index;

  @override
  Widget build(BuildContext context) {
    return homeState is HomeLoadingState ? Container(
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
            padding: REdgeInsets.all(16.0),
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
                  offset: const Offset(0, 7),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: const NetworkImage(
                          'https://s3-alpha-sig.figma.com/img/9cc4/464c/2f27326011ba562898e108aa9522819c?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=gPdl5XufMRJjf2IAekqcc9Rvi~bU0-41-52t~4CN7WGR6qkIXfRro7bYS799Bx8xSKov~bPAwLZ0r4yWwrFcc5xaf2uSiAwXi2AWCMcpJwHyhpYJ~ETiazMqvyAmok3uXDHhT2329Xv5gLszPrw6j~rduW4E0C~mfcPDEPRC5eL6yttCvHb3SlvyUXnqkYHC1T53koofNGDGPMTeihs2S3VtBJ6XrqahDcJYm05QIjBuAH9X-MfRAoKVv5uZaCNJnz5UwGWd2sWIYYY246fjOrh6wbg-dq-w3YUxAiRbsGly8RT5ZwUL1L7Ar2Sb9J0ttMNwyneRTTC4oSwYH6WZRw__'),
                      // Replace with your image
                      radius: 20.r,
                    ),
                    SizedBox(width: 12.w),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Johan Smith',
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
                    Spacer(),
                    const Icon(Icons.more_horiz),
                  ],
                ),
                SizedBox(height: 12),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.chat_bubble_outline),
                        SizedBox(width: 4),
                        Text('14'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.repeat),
                        SizedBox(width: 4),
                        Text('5'),
                      ],
                    ),
                    Icon(Icons.download),
                    Row(
                      children: [
                        Icon(Icons.favorite, color: Colors.red),
                        SizedBox(width: 4),
                        Text('113'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
