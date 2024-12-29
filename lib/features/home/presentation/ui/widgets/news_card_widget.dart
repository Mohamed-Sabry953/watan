import 'package:final_project_2024/core/utils/constant/images.dart';
import 'package:final_project_2024/features/home/presentation/manger/cubit/home_cubit.dart';
import 'package:final_project_2024/features/home/presentation/ui/widgets/user_info_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class NewsCard extends StatelessWidget {
  final HomeState homeState;
  final int index;

  const NewsCard({
    super.key,
    required this.homeState,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    if (homeState is HomeLoadingState || HomeCubit.get(context).homeRepoImp.latestPosts==null) {
      return Container(
        margin: REdgeInsetsDirectional.only(bottom: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(5, 5),
              blurRadius: 4,
            )
          ],
        ),
        child: Padding(
          padding: REdgeInsets.all(2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 160.h,
                  width: double.infinity,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: REdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: CircleAvatar(
                            radius: 16.r,
                            backgroundColor: Colors.grey,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 16.h,
                            width: 100.w,
                            color: Colors.grey,
                          ),
                        ),
                        const Spacer(),
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 24.h,
                            width: 24.w,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 16.h,
                        width: double.infinity,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 16.h,
                        width: double.infinity,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        margin: REdgeInsetsDirectional.only(bottom: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(5, 5),
              blurRadius: 4,
            )
          ],
        ),
        child: Padding(
          padding: REdgeInsets.all(2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: HomeCubit.get(context).homeRepoImp.latestPosts!.data![index].media!.isEmpty?
                    Image.asset(Images.watanApp,
                      height: 160.h,
                      width: double.infinity,
                    ):SizedBox(
                  height: 160.h,
                  width: double.infinity,
                  child: Image.network(HomeCubit.get(context).homeRepoImp.latestPosts?.data?[index].media?[0]??"",
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Center(
                          child: Icon(Icons.error),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: REdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                     UserInfoRow(index: index,),
                    SizedBox(height: 8.h),
                    Text(
                      HomeCubit.get(context).homeRepoImp.latestPosts?.data?[index].content??"",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
