import 'package:final_project_2024/core/services/responsiveUi/responsive_width.dart';
import 'package:final_project_2024/features/servicesFeature/boycott/presentation/manger/boycott_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../../../../../../core/services/responsiveUi/responsive_height.dart';
import '../../../../../../core/utils/constant/images.dart';

class Qr_Body extends StatefulWidget {
  const Qr_Body({super.key});

  @override
  State<Qr_Body> createState() => _Qr_BodyState();
}

class _Qr_BodyState extends State<Qr_Body> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widgetHeight(context: context, height: 40),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              ),
              Text(
                "Boycott",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 33),
              ),
              SvgPicture.asset(
                Images.drawerIcon,
                color: Colors.black,
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffF6F6F6),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(120.r),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: widgetHeight(context: context, height: 40),
                ),
                Text(
                  "Scan QR Code",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: widgetHeight(context: context, height: 72),
                ),
                Center(
                  child: Image.asset(
                      "assets/projectImages/appImages/Group 99.png"),
                ),
                SizedBox(
                  height: widgetHeight(context: context, height: 65),
                ),
                InkWell(
                  onTap: () async {
                    String? res = await SimpleBarcodeScanner.scanBarcode(context,
                      barcodeAppBar: const BarcodeAppBar(
                        appBarTitle: 'Test',
                        centerTitle: false,
                        enableBackButton: true,
                        backButtonIcon: Icon(Icons.arrow_back_ios),
                      ),
                      isShowFlashIcon: true,
                      delayMillis: 2000,
                      cameraFace: CameraFace.back,
                      scanFormat: ScanFormat.ONLY_BARCODE,
                    );
                    setState(() {
                      result = res as String;
                      BoycottCubit.get(context).checkBoycott(context,code: "pepsi nocode");
                    });
                  },
                  child: Center(
                    child: Container(
                      alignment: Alignment.center,
                      width: widgetWidth(context: context, width: 100),
                      height: widgetHeight(context: context, height: 50),
                      decoration: BoxDecoration(
                        color: Color(0XFF628D3D),
                        borderRadius: BorderRadius.circular(25)

                      ),
                      child: Text(
                        "Scan QR Code",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
