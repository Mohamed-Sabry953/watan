import 'package:final_project_2024/config/routes/app_routes.dart';
import 'package:final_project_2024/core/utils/constant/generic_variables.dart';
import 'package:final_project_2024/features/servicesFeature/boycott/data/models/AllAlternitiveModel.dart';
import 'package:final_project_2024/features/servicesFeature/boycott/data/models/AllBoycottModel.dart';
import 'package:final_project_2024/features/servicesFeature/boycott/data/models/BoycottModel.dart';
import 'package:final_project_2024/features/servicesFeature/boycott/data/repository/boycott_repo_imp.dart';
import 'package:final_project_2024/features/servicesFeature/boycott/presentation/ui/widgets/boycuttMessage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/TestAlternitive.dart';
import '../../data/models/TestCodeModel.dart';
part 'boycott_state.dart';

class BoycottCubit extends Cubit<BoycottState> {
  BoycottCubit(this.boycottRepoImp) : super(BoycottInitial());
  final BoycottRepoImp boycottRepoImp;
  String productName="";

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  static BoycottCubit get(context)=>BlocProvider.of(context);

  Future<void> getallAtrenitiveproducts() async {
    emit(BoycottLoadingState());
    var result = await boycottRepoImp.getAtrenitive(
    );
    result.fold(
            (failure) { emit(BoycottGetAllAtrenitiveFailState(failure.errMessage));
        },
            (productsModel) { emit(BoycottGetAllAtrenitiveSucState(productsModel),
        );
        if (kDebugMode) {
          print(productsModel);
        }
        }
    );

  }
  Future<void> getallBoycottproducts() async {
    emit(BoycottLoadingState());
    var result = await boycottRepoImp.getBoycott(
    );
    result.fold(
            (failure) { emit(BoycottGetProductFailState(failure.errMessage));
        },
            (productsModel) { emit(BoycottGetProductSucState(productsModel),
        );
        if (kDebugMode) {
          print(productsModel);
        }
        }
    );

  }




  Future<void> getboycuttProducts(BuildContext context,{required String boycottname}) async {

    var result = await boycottRepoImp.getboycott_product(boycottname: boycottname
    );
    result.fold(
            (failure) { emit(BoycottGetBoycott_ProductFailState(failure.errMessage));
              print(failure.errMessage);
        },
            (boycottModel) { emit(BoycottGetBoycott_ProductSucState(boycottModel),
        );
            if(boycottModel.data!=null){
              GenericVariables.data=boycottModel.data;
            }
            else{
              GenericVariables.alternativeMsg=boycottModel.dataMsg;
            }
              Navigator.pushNamed(context, AppRoutesName.resultScreen);

        if (kDebugMode) {
          print(boycottModel);
        }
        }
    );

  }
  Future<void> checkBoycott(BuildContext context,{required String code}) async {
    GenericVariables.data=null;
    GenericVariables.alternativeMsg=null;
    emit(BoycottLoadingState());
    var result = await boycottRepoImp.checkBoycott(
        code: code,
    );
    result.fold(
            (failure) { emit(BoycottCheckProductFailState(failure.errMessage));
        },
            (registerItem) async {
              emit(BoycottCheckProductSucState(registerItem),);
              if(registerItem.data?["data"]!="هذا المنتج ليس في المقاطعه"){
                 getboycuttProducts(context,boycottname:"oreo" );
              }
              else{
                GenericVariables.alternativeMsg=registerItem.data?["data"];
                showDialog(context: context, builder: (context) {
                  return boycuttMessage(text: registerItem.data?["data"]);
                },);
              }
        if (kDebugMode) {
          print("================================");
          print(registerItem.message);
          print("================================");
        }
        }
    );

  }
}
