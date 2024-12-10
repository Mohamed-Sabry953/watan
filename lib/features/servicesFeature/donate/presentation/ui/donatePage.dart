import 'package:final_project_2024/core/services/responsiveUi/responsive_height.dart';
import 'package:flutter/material.dart';

class DonateScreen extends StatelessWidget {
  const DonateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    // Handle back button
                  },
                ),
                const Text(
                  "Donate",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black),
                  onPressed: () {
                    // Handle menu button
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 4, // Replace with dynamic data length
              itemBuilder: (context, index) {
                return DonationCard(
                  imageUrl: "https://s3-alpha-sig.figma.com/img/7686/7dfe/28da0cea8c38be96e196e1896201637f?Expires=1734307200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=L5VSQJHscRukDIn-eU4H9sDa5YL9VHm00rhEKQHgDAbUbTOI0ZoC1TaGkq3dAMDNs1aat8Rc8CBud7JYWH5I1GtqtvXolo9NkHK~Rso80xDwyN4Yb6Wiw2ToEMkIAJvKRmpXRMXnqERNPx6YGa3MAx5bo73YU2RWznyXR57Ci8dxYXsgGoVGzn4M7X6rsjyTLLRq65eqiZO73Y-qxNi2XvGX-uSUowbXV75w~SUs3H289-383oEQ4mtpPaOiyUvW~idkGO2v8XwqPB8ujMM2~EcLnolpHz5Tu6Zk982fRHeaMLIourJNYyFTLM1BHE-NXk6ao-FdXuvaM~I~2hUdlw__", // Replace with actual image URL
                  title: index % 2 == 0
                      ? "Resala Charity Organization"
                      : "Orman Association",
                  description:
                  "Together, we can change the world. Your call to give brings hope...",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DonationCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const DonationCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widgetHeight(context: context, height: 140),
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}