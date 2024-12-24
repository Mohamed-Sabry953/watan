import 'package:final_project_2024/features/home/presentation/manger/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInfoRow extends StatelessWidget {
  const UserInfoRow({required this.index,super.key});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         CircleAvatar(
          radius: 16.r,
          backgroundImage:  NetworkImage(
              HomeCubit.get(context).homeRepoImp.latestPosts?.data?[index].user?.profilePhoto??
              'https://s3-alpha-sig.figma.com/img/9cc4/464c/2f27326011ba562898e108aa9522819c?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=gPdl5XufMRJjf2IAekqcc9Rvi~bU0-41-52t~4CN7WGR6qkIXfRro7bYS799Bx8xSKov~bPAwLZ0r4yWwrFcc5xaf2uSiAwXi2AWCMcpJwHyhpYJ~ETiazMqvyAmok3uXDHhT2329Xv5gLszPrw6j~rduW4E0C~mfcPDEPRC5eL6yttCvHb3SlvyUXnqkYHC1T53koofNGDGPMTeihs2S3VtBJ6XrqahDcJYm05QIjBuAH9X-MfRAoKVv5uZaCNJnz5UwGWd2sWIYYY246fjOrh6wbg-dq-w3YUxAiRbsGly8RT5ZwUL1L7Ar2Sb9J0ttMNwyneRTTC4oSwYH6WZRw__',
          ),
        ),
         SizedBox(width: 8.w),
        Text(
          HomeCubit.get(context).homeRepoImp.latestPosts?.data?[index].user!.name??'Johan smith',
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        const Icon(Icons.bookmark_border),
      ],
    );
  }
}