import 'package:final_project_2024/core/utils/constant/styles.dart';
import 'package:final_project_2024/features/servicesFeature/boycott/data/repository/boycott_repo_imp.dart';
import 'package:final_project_2024/features/servicesFeature/boycott/presentation/manger/boycott_cubit.dart';
import 'package:final_project_2024/features/servicesFeature/boycott/presentation/ui/widgets/Boycottpage_Body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/service locator/service_locator.dart';

class Boycottpage extends StatelessWidget {
  const Boycottpage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => BoycottCubit(sl<BoycottRepoImp>())..getProducts(),
    child: BlocBuilder<BoycottCubit,BoycottState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "BoyCott",
            style: Styles.poppins14400Black(context)
                .copyWith(fontWeight: FontWeight.w700, fontSize: 33),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {},
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: IconButton(
                icon: Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black,
                ),onPressed: () {

              },
              ),
            )
          ],
        ),
        body: Boycottpage_Body(),
      );
    },),
    );
  }
}
