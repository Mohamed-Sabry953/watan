import 'package:final_project_2024/features/servicesFeature/mapsServices/presentation/ui/widgets/CountryView_Body.dart';
import 'package:flutter/material.dart';

class CountryPage extends StatelessWidget {
  const CountryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Sharqia",
          style: TextStyle(
              color: Colors.black, fontSize: 33, fontWeight: FontWeight.w700),
        ),
        leading: Icon(Icons.arrow_back_ios_new,size: 30,),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Icon(Icons.menu,size: 30,),
          ),
        ],
      ),
      body: CountryView_Body(),
    );
  }
}
