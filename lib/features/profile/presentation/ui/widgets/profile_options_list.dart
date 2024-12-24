import 'package:final_project_2024/core/cache/cachData.dart';
import 'package:final_project_2024/features/profile/presentation/ui/widgets/profile_options.dart';
import 'package:flutter/material.dart';

import '../../../../register/presentation/manger/register_cubit.dart';

class ProfileOptionList extends StatelessWidget {
  const ProfileOptionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String address=CacheData.getUserAddress(key: "user_address")??"";
    String phone=CacheData.getUserAddress(key: "user_phone")??"";
    return Column(
      children:  [
        ProfileOption(
          icon: Icons.person,
          title: "Name",
          value: RegisterCubit.get(context).registerRepo.userModel?.user?.name??"Mohamed Sabry",
        ),
        ProfileOption(
          icon: Icons.email,
          title: "Email",
          value: RegisterCubit.get(context).registerRepo.userModel!.user!.email!.length<25?
          '${RegisterCubit.get(context).registerRepo.userModel?.user?.email}'
              :'${RegisterCubit.get(context).registerRepo.userModel?.user?.email?.substring(0,25)}...',
        ),
         ProfileOption(
          icon: Icons.phone,
          title: "Phone",
          value: phone==""?"12344555678":phone,
        ),
         ProfileOption(
          icon: Icons.location_on,
          title: "Address",
          value: address==""?"10Th of Ramadan":address,
        ),
      ],
    );
  }
}