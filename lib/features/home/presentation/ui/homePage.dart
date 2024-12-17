// main.dart
import 'package:final_project_2024/core/utils/constant/images.dart';
import 'package:final_project_2024/features/home/data/repository/home_repo_imp.dart';
import 'package:final_project_2024/features/home/presentation/manger/home_cubit.dart';
import 'package:final_project_2024/features/home/presentation/ui/widgets/app_bar_widget.dart';
import 'package:final_project_2024/features/home/presentation/ui/widgets/news_card_widget.dart';
import 'package:final_project_2024/features/home/presentation/ui/widgets/post_widget.dart';
import 'package:final_project_2024/features/home/presentation/ui/widgets/share_posts_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/service locator/service_locator.dart';


// screens/home_screen.dart
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => HomeCubit(sl<HomeRepoImp>())..getPosts()..getLatestPosts(),
    child: BlocBuilder<HomeCubit,HomeState>(builder: (context, state) {
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
                      SizedBox(
                        height: 280, // Fixed height for the list container
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 300, // Fixed width for each card
                              margin: const EdgeInsets.only(right: 16),
                              child:  NewsCard(homeState: state ,index: index,),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 24),
                      PostWidget(index: 0, homeState: state,)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },),
    );
  }
}

// widgets/app_header.dart