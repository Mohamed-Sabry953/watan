import 'package:final_project_2024/core/services/responsiveUi/responsive_height.dart';
import 'package:final_project_2024/features/register/data/repo/register_%20repo_imp.dart';
import 'package:final_project_2024/features/register/presentation/manger/register_cubit.dart';
import 'package:final_project_2024/features/register/presentation/ui/loginPage.dart';
import 'package:final_project_2024/features/register/presentation/ui/signupPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/service locator/service_locator.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(sl<RegisterRepoImpl>()),
      child: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          return PopScope(
            canPop: false,
              onPopInvoked: (didPop) async {
              RegisterCubit.get(context).backFadeRegister();
              },
            child: SafeArea(
                child: Scaffold(
              backgroundColor: const Color(0xffFFFFFF),
              body: AnimatedCrossFade(
                  firstChild: LoginPage(),
                  secondChild: SignupPage(),
                  crossFadeState: RegisterCubit.get(context).registerCrossFadeState,
                  duration: Duration(milliseconds: 800)),
            )),
          );
        },
      ),
    );
  }
}
