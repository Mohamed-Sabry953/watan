import 'package:flutter/material.dart';

class OrganizationDetailsScreen extends StatelessWidget {
  const OrganizationDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back navigation
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              // Handle options menu
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Organization Image and Info
              OrganizationInfoSection(
                imageUrl: 'https://via.placeholder.com/150',
                name: 'Resala Charity Organization',
                address: 'demo address 21 chini street',
                phone: '0345681236567',
                website: 'https://jkhkfgfypl;nhhjn.com',
              ),
              const SizedBox(height: 16),

              // Photos Section
              SectionHeader(
                title: "Photos",
                onSeeAllPressed: () {
                  // Handle See All action
                },
              ),
              const SizedBox(height: 8),
              PhotosSection(
                photoUrls: [
                  'https://via.placeholder.com/80',
                  'https://via.placeholder.com/80',
                  'https://via.placeholder.com/80',
                  'https://via.placeholder.com/80',
                ],
              ),
              const SizedBox(height: 16),

              // More Details Section
              SectionHeader(title: "More Details"),
              const SizedBox(height: 8),
              const Text(
                "Together, we can change the world. Your call to give brings hope...\n\nLet your support express your belief in humanity and give a hand to those in need.",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Organization Info Widget
class OrganizationInfoSection extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String address;
  final String phone;
  final String website;

  const OrganizationInfoSection({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.address,
    required this.phone,
    required this.website,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            imageUrl,
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.location_on, size: 16, color: Colors.grey),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      address,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.phone, size: 16, color: Colors.grey),
                  const SizedBox(width: 8),
                  Text(
                    phone,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.link, size: 16, color: Colors.grey),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      website,
                      style: const TextStyle(fontSize: 14, color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Section Header Widget
class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAllPressed;

  const SectionHeader({
    Key? key,
    required this.title,
    this.onSeeAllPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (onSeeAllPressed != null)
          GestureDetector(
            onTap: onSeeAllPressed,
            child: const Text(
              "See All",
              style: TextStyle(fontSize: 14, color: Colors.green),
            ),
          ),
      ],
    );
  }
}

// Photos Section Widget
class PhotosSection extends StatelessWidget {
  final List<String> photoUrls;

  const PhotosSection({Key? key, required this.photoUrls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: photoUrls.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                photoUrls[index],
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}