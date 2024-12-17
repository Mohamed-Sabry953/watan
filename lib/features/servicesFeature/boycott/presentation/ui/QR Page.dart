import 'package:final_project_2024/features/servicesFeature/boycott/data/repository/boycott_repo_imp.dart';
import 'package:final_project_2024/features/servicesFeature/boycott/presentation/manger/boycott_cubit.dart';
import 'package:final_project_2024/features/servicesFeature/boycott/presentation/ui/widgets/Qr_Body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/service locator/service_locator.dart';


class Qr_page extends StatelessWidget {
  const Qr_page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => BoycottCubit(sl<BoycottRepoImp>()),
    child: BlocBuilder<BoycottCubit,BoycottState>(builder: (context, state) {
      return const Scaffold(
        backgroundColor: Color(0XFF8ABE53),
        body: Qr_Body(),
      );
    },),
    );
  }
}
