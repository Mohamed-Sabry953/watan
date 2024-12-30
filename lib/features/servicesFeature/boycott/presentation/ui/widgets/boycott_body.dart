import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:final_project_2024/core/services/responsiveUi/responsive_height.dart';
import 'package:final_project_2024/features/servicesFeature/boycott/presentation/ui/widgets/alternativeCard.dart';
import 'package:flutter/material.dart';

import 'Boycott_Card.dart';

class Boycottpage_Body extends StatefulWidget {
  const Boycottpage_Body({super.key});

  @override
  State<Boycottpage_Body> createState() => _Boycottpage_BodyState();
}

class _Boycottpage_BodyState extends State<Boycottpage_Body> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
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
                    onPressed: () {},
                  ))),
        ),
      ),
      SizedBox(height: widgetHeight(context: context, height: 24)),
      Container(
        width: 305,
        height: 50,
        child: DefaultTabController(
          length: 2,
          initialIndex: 1,
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
            controller: tabController,
            tabs: [
              SegmentTab(

                  label: "Boycott",
                  // textColor: Colors.black,
                  selectedTextColor: Colors.blue),
              SegmentTab(
                  label: "Substitute",
                  // textColor: Colors.black,
                  selectedTextColor: Colors.green),
            ],
          ),
        ),
      ),
      SizedBox(
        height: widgetHeight(context: context, height: 32),
      ),
      Expanded(
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 3,
            crossAxisSpacing: 3,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: tabController.index==0?BoycottCard(index: index,):AlternativeCard(index: index),
            );
          },
        ),
      )
    ]);
  }
}