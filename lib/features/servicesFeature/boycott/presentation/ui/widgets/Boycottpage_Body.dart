import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:final_project_2024/config/routes/app_routes.dart';
import 'package:final_project_2024/core/services/responsiveUi/responsive_height.dart';
import 'package:flutter/material.dart';

import '../../manger/boycott_cubit.dart';
import 'Boycott_Card.dart';

class Boycottpage_Body extends StatelessWidget {
  const Boycottpage_Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      SizedBox(
        height: widgetHeight(context: context, height: 40),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Container(
          width: 305,
          height: 42,
          alignment: Alignment.center,
          child: TextField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.white)),
                  fillColor: Color(0XFFEBEBEB),
                  filled: true,
                  hintText: "search your product",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.camera_alt),
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutesName.qrPage);
                    },
                  ))),
        ),
      ),
      SizedBox(height: widgetHeight(context: context, height: 24)),
      Container(
        width: 305,
        height: 50,
        child: DefaultTabController(
          length: 2,
          child: SegmentedTabControl(
            textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            tabTextColor: Colors.black,
            barDecoration: BoxDecoration(
              color: Color(0XFFE0E0E0),
              borderRadius: BorderRadius.circular(30),
            ),
            indicatorDecoration: BoxDecoration(
              color: Color(0XFFEBEBEB),
              borderRadius: BorderRadius.circular(30),
            ),
            tabs: [
              SegmentTab(
                  label: "Boycott",

                  // textColor: Colors.black,
                  selectedTextColor: Colors.black),
              SegmentTab(
                  label: "Substitute",
                  // textColor: Colors.black,
                  selectedTextColor: Colors.black),
            ],
          ),
        ),
      ),
      SizedBox(
        height: widgetHeight(context: context, height: 32),
      ),
      Expanded(
        child: GridView.builder(
          itemCount: BoycottCubit.get(context).boycottRepoImp.alternativeModel?.data?.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 3,
            crossAxisSpacing: 3,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: BoycottCard(index: index,),
            );
          },
        ),
      )
    ]);
  }
}
