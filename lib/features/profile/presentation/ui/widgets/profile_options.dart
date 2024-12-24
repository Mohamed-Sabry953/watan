import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const ProfileOption({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16.0),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow:[
          BoxShadow(color: Colors.black.withOpacity(0.12),
            offset: Offset(3, 3),
            blurRadius: 3,
          ),
          BoxShadow(color: Colors.black.withOpacity(0.08),
            offset: Offset(-3, -3),
            blurRadius: 3,
          ),
        ],
        border: Border.all(color: Colors.black.withOpacity(0.05)),
        borderRadius: BorderRadius.circular(16.r),
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
                    fontFamily: "Playpen Sans",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                      fontFamily: "Playpen Sans",
                      fontSize: 16, fontWeight: FontWeight.w500),
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