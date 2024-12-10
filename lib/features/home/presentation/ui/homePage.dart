// main.dart
import 'package:final_project_2024/core/utils/constant/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


// screens/home_screen.dart
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              backgroundColor: Colors.white,
              floating: true,
              title: AppHeader(),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ShareNewsCard(),
                    const SizedBox(height: 24),
                    const Text(
                      'Latest News',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const NewsList(),
                    const SizedBox(height: 24),
                    PostWidget()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// widgets/app_header.dart
class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(Images.watanIcon,width: 85,),
        Row(
          children: [
            Stack(
              children: [
                const Icon(Icons.notifications_outlined),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            const Icon(Icons.menu),
          ],
        ),
      ],
    );
  }
}

// widgets/share_news_card.dart
class ShareNewsCard extends StatelessWidget {
  const ShareNewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Text(
              'Share Your News',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            const Icon(Icons.image_outlined),
          ],
        ),
      ),
    );
  }
}

// widgets/news_list.dart
class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280, // Fixed height for the list container
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            width: 300, // Fixed width for each card
            margin: const EdgeInsets.only(right: 16),
            child: const NewsCard(),
          );
        },
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: REdgeInsets.all(2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: SizedBox(
                height: 160, // Fixed height for image
                width: double.infinity,
                child: Image.network(
                  "https://s3-alpha-sig.figma.com/img/368f/2f47/7547bc4434de5b251d919712957a7e65?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=j3MMYvdHV7Mi8cUOvfpqLnnGu543KfW0Bap8pz7XY~bUm12eulviznfywgrRU0Li~N84noboXhOJJH5J8Ht7efy2012HFalTp8gum9G2U5amqtCsUQMxkNDy5vcJZLhbRQQv96DJ6tl-DTHzNEYrG2c1L3qWvVuy8-5D9okd8GXnLzpZBDi-Zj3sNwvMr2EeIT~IGq6HKDAzxLl5k1Yf88sy9YfwPyDJ6rSasOA-xuL5drQaMyWm1CNLt3CLk6hGdXccmeOGWLgkCcNkb8z17~Y4e9wmtufMebM9Lc6ZpUOHY2fbTyHeQVFhAWliaoXTVcsa68FW1WhiGdh3q-s2Xg__",
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
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const UserInfoRow(),
                  const SizedBox(height: 8),
                  Text(
                    'Israelis, Palestinians in Gaza and global leaders are still attempting to work...',
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
// widgets/user_info_row.dart
class UserInfoRow extends StatelessWidget {
  const UserInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 16,
          backgroundImage: NetworkImage('https://s3-alpha-sig.figma.com/img/9cc4/464c/2f27326011ba562898e108aa9522819c?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=kV-SAQRhUAPWfCP4Xmk3LQsCyFyQWrIVNOGmjtrJsMThNGvyjYfq~LzKwuYTPOz5sbkiOe9SAON0rV6wZ1OaTDeqrSzFXO9JiHbJDT1mY5WstQ8jurm039xRd2XGQ3unKPxlKoUtdM6ewxOIcxJKU~NydGE3yvYnzaeZyjG2HrJZPYrapjpPUq6t0CSMDJTF1SUZdknH68jR-wGKJ28Cr~bTP1apTnTkIisy6aFBE1Bq9t04a4bo5anEcSzhgJA3Sb70nOdKLGC13kKL7aCAqB1PMXCRJCO3TvIG-WkDLK-7I5kiUCzsh1guZACIy1QM~UE3OchPi~whIz0vozB~ww__'),
        ),
        const SizedBox(width: 8),
        Text(
          'Johan smith',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        const Icon(Icons.bookmark_border),
      ],
    );
  }
}


class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage('https://s3-alpha-sig.figma.com/img/9cc4/464c/2f27326011ba562898e108aa9522819c?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=kV-SAQRhUAPWfCP4Xmk3LQsCyFyQWrIVNOGmjtrJsMThNGvyjYfq~LzKwuYTPOz5sbkiOe9SAON0rV6wZ1OaTDeqrSzFXO9JiHbJDT1mY5WstQ8jurm039xRd2XGQ3unKPxlKoUtdM6ewxOIcxJKU~NydGE3yvYnzaeZyjG2HrJZPYrapjpPUq6t0CSMDJTF1SUZdknH68jR-wGKJ28Cr~bTP1apTnTkIisy6aFBE1Bq9t04a4bo5anEcSzhgJA3Sb70nOdKLGC13kKL7aCAqB1PMXCRJCO3TvIG-WkDLK-7I5kiUCzsh1guZACIy1QM~UE3OchPi~whIz0vozB~ww__'), // Replace with your image
                radius: 20,
              ),
              SizedBox(width: 12),
              Column(
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
              Icon(Icons.more_horiz),
            ],
          ),
          SizedBox(height: 12),
          Text(
            'Fighting won\'t stop ‘until Palestine is liberated’',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 16),
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