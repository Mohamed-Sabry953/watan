import 'package:final_project_2024/core/services/responsiveUi/responsive_height.dart';
import 'package:final_project_2024/features/servicesFeature/boycott/presentation/manger/boycott_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shimmer/shimmer.dart';

class BoycottCard extends StatelessWidget {
  const BoycottCard({required this.index,  super.key});
  final int index;

  @override
  Widget build(BuildContext context) {

      // Display shimmer loading
      return BlocBuilder<BoycottCubit,BoycottState>(builder: (context, state) {
        return state is BoycottLoadingState?Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 6,
                  offset: const Offset(7, 7),
                ),
              ],
            ),
            child: Card(
              elevation: 5,
              color: const Color(0XFFFDFDFD),
              child: Column(
                children: [
                  SizedBox(height: widgetHeight(context: context, height: 15)),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      color: Colors.grey[300],
                      height: widgetHeight(context: context, height: 100),
                      width: widgetHeight(context: context, height: 100),
                    ),
                  ),
                  SizedBox(height: widgetHeight(context: context, height: 25)),
                  Container(
                    height: 20,
                    width: 100,
                    color: Colors.grey[300],
                  ),
                  SizedBox(height: widgetHeight(context: context, height: 5)),
                  Container(
                    height: 15,
                    width: 80,
                    color: Colors.grey[300],
                  ),
                ],
              ),
            ),
          ),
        ):Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 6,
                offset: const Offset(7, 7),
              ),
            ],
          ),
          child: Card(
            elevation: 5,
            color: const Color(0XFFFDFDFD),
            child: Column(
              children: [
                SizedBox(height: widgetHeight(context: context, height: 15)),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    BoycottCubit.get(context).boycottRepoImp.alternativeModel?.data?[index].categoryPhoto ?? "",
                    height: widgetHeight(context: context, height: 100),
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.broken_image,
                      size: widgetHeight(context: context, height: 100),
                    ),
                  ),
                ),
                SizedBox(height: widgetHeight(context: context, height: 25)),
                Text(
                  BoycottCubit.get(context).productName,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0XFF000000),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  BoycottCubit.get(context).boycottRepoImp.alternativeModel?.data?[index].categoryType ?? "",
                  style: const TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
      },);
      // Display actual data
    }
  }
