import 'package:final_project_2024/core/services/responsiveUi/responsive_height.dart';
import 'package:final_project_2024/core/utils/constant/generic_variables.dart';
import 'package:final_project_2024/core/utils/constant/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            SearchBar(),
            SizedBox(height: 20),
            ImageSection(),
            SizedBox(height: 20),
            DescriptionSection(),
            SizedBox(height: widgetHeight(context: context, height: 30),),
            GenericVariables.alternativeMsg==null?Text(
              'Alternatives',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color:Colors.green,
                fontSize: 24,
              ),
            ):SizedBox(),
            GenericVariables.alternativeMsg==null? SizedBox(height: 8):SizedBox(),
            GenericVariables.alternativeMsg==null?Expanded(
              child: GridView.builder(
                itemCount: GenericVariables.data?.alternatives?.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 3,
                  crossAxisSpacing: 3,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Card(
                      elevation: 5,
                      color: const Color(0XFFFDFDFD),
                      child: Column(
                        children: [
                          Image.network(GenericVariables.data?.alternatives?[index].productImage??"",
                          height: widgetHeight(context: context, height: 80),
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: widgetHeight(context: context, height: 120),
                              color: Colors.grey[300],
                              child: const Center(
                                child: Icon(Icons.error),
                              ),
                            );
                          },
                          ),
                          Text(GenericVariables.data?.alternatives?[index].productName??"",style: TextStyle(
                              fontSize: 18,
                              color: Color(0XFF000000),
                              fontWeight: FontWeight.w700
                          ),),
                          Text(GenericVariables.data?.alternatives?[index].productPrice??"",style: TextStyle(
                              color: Color(0XFF000000),
                              fontSize: 10,
                              fontWeight: FontWeight.w600
                          ),),


                        ],

                      ),
                    ),
                  );
                },
              ),
            ):SizedBox()
          ],
        ),
      ),
    );
  }
}

// 1. Search Bar Widget
class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16),
      child: Row(
        children: [
           SvgPicture.asset(Images.backArrowIos),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search your product',
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}

// 2. Image Section
class ImageSection extends StatelessWidget {
  const ImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          'https://images.unsplash.com/photo-1551782450-a2132b4ba21d', // Replace with your own URL
          height: 200,
          width: MediaQuery.of(context).size.width * 0.9,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// 3. Description Section
class DescriptionSection extends StatelessWidget {
  const DescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Wajdaa Restaurant is',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
           Text(
            GenericVariables.alternativeMsg==null?"Boycott":'Alternatives',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: GenericVariables.alternativeMsg==null?Colors.redAccent:Colors.green,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Macdonalds is an american fast food company that has spread all over world',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}