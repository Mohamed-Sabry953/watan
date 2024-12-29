import 'package:final_project_2024/features/servicesFeature/mapsServices/presentation/ui/widgets/CountryMaps_Body.dart';
import 'package:flutter/material.dart';

class CountryMaps extends StatelessWidget {
  const CountryMaps({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Country",
          style: TextStyle(fontSize: 33, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios_new),
      ),
      body: CountryMaps_Body(),
    );
  }
}
