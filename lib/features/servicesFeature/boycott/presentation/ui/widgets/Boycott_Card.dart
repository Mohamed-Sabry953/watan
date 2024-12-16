import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Boycott_Card extends StatelessWidget {
  const Boycott_Card({super.key});

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 5,
      color: Color(0XFFFDFDFD),
      child: Column(
        children: [
          Image.asset("assets/projectImages/appImages/Ellipse 606 (1).png"),
          Text("Lizza restaurant",style: TextStyle(
            fontSize: 18,
            color: Color(0XFF000000),
            fontWeight: FontWeight.w700
          ),),
          Text("pepsi is a carbonated softdrink ",style: TextStyle(
            color: Color(0XFF000000),
              fontSize: 10,
              fontWeight: FontWeight.w600
          ),),


        ],
        
      ),
    );
  }
}
