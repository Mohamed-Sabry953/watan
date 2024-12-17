import 'package:final_project_2024/features/servicesFeature/boycott/presentation/manger/boycott_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Boycott_Card extends StatelessWidget {
  const Boycott_Card({required this.index,super.key});
  final int index;
  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 5,
      color: const Color(0XFFFDFDFD),
      child: Column(
        children: [
          Image.asset("assets/projectImages/appImages/Ellipse 606 (1).png"),
          Text(BoycottCubit.get(context).boycottRepoImp.alternativeModel?.data?[index].name??"",style: TextStyle(
            fontSize: 18,
            color: Color(0XFF000000),
            fontWeight: FontWeight.w700
          ),),
          Text(BoycottCubit.get(context).boycottRepoImp.alternativeModel?.data?[index].productType??"",style: TextStyle(
            color: Color(0XFF000000),
              fontSize: 10,
              fontWeight: FontWeight.w600
          ),),


        ],
        
      ),
    );
  }
}
