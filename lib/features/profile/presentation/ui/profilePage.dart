import 'package:final_project_2024/core/services/responsiveUi/responsive_height.dart';
import 'package:final_project_2024/core/utils/constant/appColors.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: widgetHeight(context: context, height: 50),),
            ProfileHeader(size: size),
            const SizedBox(height: 16),
            ProfileOptionList(),
          ],
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final Size size;

  const ProfileHeader({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: size.width * 0.18,
          backgroundImage: NetworkImage('https://s3-alpha-sig.figma.com/img/903f/d4a2/a3f0b5c7f1b1ffaed7f023684e73d14b?Expires=1734307200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=VclCv1RfGX7roRp2rItGlcXjPLJVnJGJYb26WbxBGo4yB8he~OFRPfdQmD~GS1SX3RsivkfHJC8LTT7RdW28jaSJk36w7pf3WNZ5RC4KfUMCsy01h~iGdjq3DrwadIL8zd~4ghsyLn8MGOFD23Jyf6J1usLGsBzaJNglPSpgdfJwb0j-3LKA923zpriEvaFObplTdjWmecSk99HFsL1AsUzFjqLLVPFbrqeVPjN8ZoikvEm~ZYxoZGYrl1WxLfJAmh0hMwg~UqF9P5HrOX9YHctix1vh4gEhJigq6~7N8FWDhVGSfMLAbhKqesqR~hQbKkIRK3w78Em5IiPGQGU4VA__'),
        ),
        const SizedBox(height: 16),
        const Text(
          "Ahmed ffgh",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            // Handle Edit Profile Action
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Text("Edit Profile",style: TextStyle(
            color: Colors.white
          ),),
        ),
      ],
    );
  }
}

class ProfileOptionList extends StatelessWidget {
  const ProfileOptionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ProfileOption(
          icon: Icons.person,
          title: "Name",
          value: "Ahmed ghh",
        ),
        ProfileOption(
          icon: Icons.email,
          title: "Email",
          value: "ahmed.gmail.com",
        ),
        ProfileOption(
          icon: Icons.phone,
          title: "Phone",
          value: "12344555678",
        ),
        ProfileOption(
          icon: Icons.location_on,
          title: "Address",
          value: "Ahmed ghs",
        ),
      ],
    );
  }
}

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const ProfileOption({
    Key? key,
    required this.icon,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }
}