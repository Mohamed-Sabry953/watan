import 'package:final_project_2024/config/routes/app_routes.dart';
import 'package:final_project_2024/core/utils/widgets/errorMessage.dart';
import 'package:final_project_2024/features/register/presentation/widgets/registerWidgets/register_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/services/responsiveUi/responsive_height.dart';
import '../../../../../core/services/responsiveUi/responsive_width.dart';
import '../../manger/register_cubit.dart';

class SignupPage extends StatelessWidget {
   SignupPage({super.key});
  final TextEditingController name=TextEditingController();
  final TextEditingController email=TextEditingController();
  final TextEditingController password=TextEditingController();
  final TextEditingController confirmPassword=TextEditingController();
   var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit,RegisterState>(
      builder: (context, state) {
        return  SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Container(
              margin: REdgeInsetsDirectional.only(top: 30),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("assets/projectImages/register/signupImage.png"),
                    width: widgetWidth(
                      context: context,
                      width: 250,
                    ),
                    height: widgetHeight(context: context, height: 114),
                  ),
                  SizedBox(
                    height: widgetHeight(context: context, height: 32),
                  ),
                  Padding(
                    padding: REdgeInsets.only(right: 27, left: 27),
                    child: Column(
                      children: [
                        Text(
                          "Sign Up page",
                          style: TextStyle(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Open Sans"),
                        ),
                        SizedBox(
                          height: widgetHeight(context: context, height: 32),
                        ),
                        RegisterTextField(textEditingController: name,
                          hintText: "Enter full name",
                        ),
                        SizedBox(
                          height: widgetHeight(context: context, height: 32),
                        ),
                        RegisterTextField(textEditingController: email,
                          hintText: "Enter Email",
                        ),
                        SizedBox(
                          height: widgetHeight(context: context, height: 32),
                        ),
                        RegisterTextField(
                          textEditingController: password,hintText: "******",
                        ),
                        SizedBox(
                          height: widgetHeight(context: context, height: 32),
                        ),                    RegisterTextField(
                          textEditingController: confirmPassword,hintText: "******",
                        ),
                        SizedBox(
                          height: widgetHeight(context: context, height: 32),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: widgetHeight(context: context, height: 30),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff628D3D),
                          fixedSize: Size(widgetWidth(context: context, width: 140),
                              widgetHeight(context: context, height: 58))
                      ),
                      onPressed: (){
                        RegisterCubit.get(context).postSignup(name:name.text,email:email.text,password: password.text,confirmPassword: confirmPassword.text);
                      }, child: Center(
                      child: Text("Sign up",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: "Open Sans",
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                        ),
                      ))),
                ],
              ),
            ),
          ),
        );
      },
    listener: (context, state) {
      if(state is SignupLoading){
        showDialog(context: context, builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },);
      }
      else if(state is SignupFailure){
        Navigator.pop(context);
        showDialog(context: context, builder: (context) {
          return const ErrorMessage(text: "This email is already used");
        },);
      }
         else if(state is SignupSuccess){
          Navigator.pop(context);
          Navigator.pushNamedAndRemoveUntil(context, AppRoutesName.emailVerification, (route) => false,);
         }
    },
    );
  }
}
