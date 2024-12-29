import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_project_2024/core/services/responsiveUi/responsive_height.dart';
import 'package:final_project_2024/core/utils/constant/images.dart';
import 'package:final_project_2024/features/chatbot/data/repository/chat_bot_repo_imp.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../../core/utils/constant/appColors.dart';
import '../../../../../../core/utils/constant/appConstant.dart';
import '../../../../../../core/utils/constant/styles.dart';
import '../../../../../../core/utils/service locator/service_locator.dart';
import '../../../../../chatbot/presentation/manger/chatbot_cubit.dart';
import '../../../../../chatbot/presentation/ui/widgets/chat_textfield.dart';

class CountryMaps_Body extends StatefulWidget {
  CountryMaps_Body({super.key});

  @override
  State<CountryMaps_Body> createState() => _CountryMaps_BodyState();
}

class _CountryMaps_BodyState extends State<CountryMaps_Body> {
  final CameraPosition _initialPosition = CameraPosition(
    target: LatLng(30.0444, 31.2357),
    zoom: 10,
  );
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToBottom();
    });
  }
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return BlocProvider(create: (context) => ChatbotCubit(sl<ChatBotRepoImp>()),
    child: BlocBuilder<ChatbotCubit,ChatbotState>(builder: (context, state) {
      return Column(
        children: [
          SizedBox(
            height: 140,
            width: double.infinity,
            child: CarouselSlider.builder(

              itemCount: 5,
              itemBuilder: (context, index, realIndex) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                      height: 140,
                      width: 120,
                      child: Image.asset(
                        Images.resalaOne,
                        fit: BoxFit.fill,
                      )),
                );
              }, options: CarouselOptions(
                height: 160,
                viewportFraction: 0.27,
                enlargeCenterPage: true,
                autoPlayAnimationDuration: Duration(milliseconds: 100),
                autoPlayInterval: Duration(seconds: 9)),
            ),
          ),
          SizedBox(
            height: widgetHeight(context: context, height: 16),
          ),
          Expanded(
            child: GoogleMap(
              initialCameraPosition: _initialPosition,
              mapType: MapType.normal,
              indoorViewEnabled: true,
              buildingsEnabled: true,
              myLocationEnabled: true,
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,

              onMapCreated: (GoogleMapController controller) {
                print('Map is ready!');
              },
            ),
          ),
          Row(
            children: [
              Container(
                margin: REdgeInsetsDirectional.only(start: 8,bottom: 8),
                width: size.width/1.2,
                height: size.height * 0.07,
                decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.95),
                    borderRadius: BorderRadius.circular(16.r)
                ),
                padding: const EdgeInsets.only(left: 8,right: 8),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: ChatbotCubit.get(context).pickImage,
                      child: SvgPicture.asset(
                        Images.addGallery,
                        width: size.width * 0.07,
                        height: size.width * 0.07,
                      ),
                    ),
                    Expanded(
                      child: DefaultTextFormField(
                        textInputType: TextInputType.text,
                        controller: ChatbotCubit.get(context).controller,
                        isFilled: true,
                        fillColor: Colors.transparent,
                        hasBorder: false,
                        hintText: AppLocalizations.of(context)!.message,
                        style:Styles.poppins16500White(context) ,
                        hintStyle: Styles.poppins16500White(context),
                      ),
                    ),
                    SizedBox(width: AppConstants.width10(context),),
                  ],
                ),
              ),
              SizedBox(width: AppConstants.width10(context),),
              GestureDetector(
                onTap: () {
                  ChatbotCubit.get(context).chatBot();
                  ChatbotCubit.get(context).sendMessage((){
                    scrollToBottom();
                  });
                },
                child:  Icon(Icons.send,color: AppColors.primary,size: 30.sp,),
              ),
            ],
          ),

        ],
      );
    },),
    );
  }

  void scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } else {
      if (kDebugMode) {
        print('ScrollController has no clients');
      }
    }
  }
}

