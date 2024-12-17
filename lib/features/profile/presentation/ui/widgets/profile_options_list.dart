import 'package:final_project_2024/features/profile/presentation/ui/widgets/profile_options.dart';
import 'package:flutter/material.dart';

class ProfileOptionList extends StatelessWidget {
  const ProfileOptionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ProfileOption(
          icon: Icons.person_2_outlined,
          title: "Name",
          value: "Ahmed ghh",
        ),
        ProfileOption(
          icon: Icons.email_outlined,
          title: "Email",
          value: "ahmed@gmail.com",
        ),
        ProfileOption(
          icon: Icons.local_phone_outlined,
          title: "Phone",
          value: "12344555678",
        ),
        ProfileOption(
          icon: Icons.location_on_outlined,
          title: "Address",
          value: "Ahmed ghs",
        ),
      ],
    );
  }
}