import 'package:final_project_2024/config/routes/app_routes.dart';
import 'package:final_project_2024/core/utils/constant/generic_variables.dart';
import 'package:final_project_2024/features/servicesFeature/boycott/data/models/AlternativeModel.dart';
import 'package:final_project_2024/features/servicesFeature/boycott/data/models/BoycottModel.dart';
import 'package:final_project_2024/features/servicesFeature/boycott/data/repository/boycott_repo_imp.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'boycott_state.dart';

class BoycottCubit extends Cubit<BoycottState> {
  BoycottCubit(this.boycottRepoImp) : super(BoycottInitial());
  final BoycottRepoImp boycottRepoImp;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  static BoycottCubit get(context)=>BlocProvider.of(context);

  Future<void> getProducts() async {
    emit(BoycottLoadingState());
    var result = await boycottRepoImp.getAlternative(
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
            (registerItem) { emit(BoycottCheckProductSucState(registerItem),
        );
              if(registerItem.data!=null){
                GenericVariables.data=registerItem.data;
              }
              else{
                GenericVariables.alternativeMsg=registerItem.dataMsg;
              }
              Navigator.pushNamed(context, AppRoutesName.resultScreen);
        if (kDebugMode) {
          print("================================");
          print(registerItem.dataMsg);
          print("================================");
        }
        }
    );

  }
}
