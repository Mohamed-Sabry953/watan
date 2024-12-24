import 'package:final_project_2024/core/services/responsiveUi/responsive_height.dart';
import 'package:final_project_2024/core/services/responsiveUi/responsive_width.dart';
import 'package:final_project_2024/features/register/presentation/manger/register_cubit.dart';
import 'package:final_project_2024/features/register/presentation/widgets/registerWidgets/register_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pressable_flutter/pressable_flutter.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/utils/widgets/errorMessage.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Form(
                key: formKey,
                child: Container(
                  margin: REdgeInsetsDirectional.only(top: 30),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(
                            "assets/projectImages/register/loginImage.png"),
                        width: widgetWidth(
                          context: context,
                          width: 299,
                        ),
                        height: widgetHeight(context: context, height: 220),
                      ),
                      SizedBox(
                        height: widgetHeight(context: context, height: 32),
                      ),
                      Padding(
                        padding: REdgeInsets.only(right: 27, left: 27),
                        child: Column(
                          children: [
                            Text(
                              "Login page",
                              style: TextStyle(
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Open Sans"),
                            ),
                            SizedBox(
                              height:
                                  widgetHeight(context: context, height: 32),
                            ),
                            RegisterTextField(
                              textEditingController: email,
                              validator:
                                  RegisterCubit.get(context).validateNotEmpty,
                              formState:
                                  formKey.currentState?.validate() ?? true,
                              suffixIcon: false,
                              hintText: "Enter Email",
                            ),
                            SizedBox(
                              height:
                                  widgetHeight(context: context, height: 32),
                            ),
                            RegisterTextField(
                                textEditingController: password,
                                hintText: "******",
                                obscure: true,
                                suffixIcon: true,
                                validator:
                                    RegisterCubit.get(context).validateNotEmpty,
                                formState:
                                    formKey.currentState?.validate() ?? true),
                            SizedBox(
                              height:
                                  widgetHeight(context: context, height: 32),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            REdgeInsetsDirectional.only(start: 12, end: 24),
                        child: Row(
                          children: [
                            Checkbox(
                              value: RegisterCubit.get(context).checkBox,
                              onChanged: (value) {
                                RegisterCubit.get(context).checkBoxOperate();
                              },
                              activeColor: const Color(0xff96B23C),
                            ),
                            Text(
                              "Remember Me",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: "Open Sans",
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff535050).withOpacity(0.8)),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AppRoutesName.forgetPass);
                              },
                              child: Text(
                                "Forget Password",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: "Open Sans",
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xff96B23C)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: widgetHeight(context: context, height: 40),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      const Color(0xff628D3D).withOpacity(0.25),
                                  blurRadius: 12.r,
                                  offset: Offset(4, 10))
                            ]),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff628D3D),
                                fixedSize: Size(
                                    widgetWidth(context: context, width: 140),
                                    widgetHeight(
                                        context: context, height: 58))),
                            onPressed: () {
                              if (formKey.currentState?.validate() ?? false) {
                                RegisterCubit.get(context).login(
                                    email: email.text, password: password.text);
                              }
                            },
                            child: Center(
                                child: Text(
                              "Log in",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontFamily: "Open Sans",
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ))),
                      ),
                      SizedBox(
                        height: widgetHeight(context: context, height: 16),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Dont have an account ? ",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                                color: Colors.black,
                                fontFamily: "Open Sans"),
                          ),
                          Pressable(
                            onPress: () {
                              Navigator.pushNamed(
                                  context, AppRoutesName.signupScreen);
                            },
                            effect: ScaleEffect.withRipple(
                                scaleFactor: 1,
                                rippleEffect:
                                    RippleEffect(color: Colors.white38)),
                            child: Text(
                              "Sign up now",
                              style: TextStyle(
                                  fontFamily: "Open Sans",
                                  fontSize: 16.sp,
                                  color: const Color(0xff96B23C)),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          ),
        );
      },
      listener: (context, state) {
        if (state is LoginLoading) {
          showDialog(
            context: context,
            builder: (context) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          );
        } else if (state is LoginFailure) {
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (context) {
              return const ErrorMessage(text: "Email or password is wrong");
            },
          );
        } else if (state is LoginSuccess) {
          Navigator.pop(context);
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutesName.homeLayout,
            (route) => false,
          );
        }
      },
    );
  }
}
