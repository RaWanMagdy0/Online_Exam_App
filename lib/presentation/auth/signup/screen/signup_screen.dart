import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam100/presentation/auth/login/screen/login_screen.dart';
import 'package:online_exam100/presentation/auth/signup/view_model/signup_cubit.dart';
import '../../../../core/di/di.dart';
import '../../../../core/utils/dialog_utils.dart';
import '../../../../core/utils/my_theme.dart';
import '../../../../core/utils/my_validator.dart';
import '../view_model/signup_states.dart';
import '../widget/text_form_field.dart';

class SignupScreen extends StatefulWidget {
  static const String routeName = "SignupScreen";

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var signupViewModel = getIt.get<SignupCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => signupViewModel,
        child: BlocListener<SignupCubit, SignupState>(
          listener: (context, state) {
            if (state is SignupLoadingStata) {
              DialogUtils.showLoading(
                  context, state.loadingMessage ?? "Waiting..");
            } else if (state is SignupErrorStata) {
              DialogUtils.hideLoading(context);
              DialogUtils.showMessage(context, state.errorMassage!,
                  title: 'Error', posActionName: 'OK');
            } else if (state is SignupSuccessStata) {
              DialogUtils.hideLoading(context);
              DialogUtils.showMessage(context,
                state.user?.username ?? "No name returned",
                title: 'Success',
                posActionName: 'OK',);
            }
          },
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                  child: Form(
                key: signupViewModel.formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back_ios),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormFieldItem(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "please enter your user name";
                          }
                          return null;
                        },
                        controller: signupViewModel.userNameController,
                        hintText: "Enter your user name",
                        labelText: "User Name",
                        keyBordType: TextInputType.text),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextFormFieldItem(
                            controller: signupViewModel.firstNameController,
                            hintText: 'Enter Your First Name',
                            labelText: 'First Name',
                            keyBordType: TextInputType.text,
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Expanded(
                          child: TextFormFieldItem(
                            controller: signupViewModel.lastNameController,
                            hintText: 'Enter Your Last Name',
                            labelText: 'Last Name',
                            keyBordType: TextInputType.text,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TextFormFieldItem(
                        controller: signupViewModel.emailController,
                        validator: (value) =>
                            MyValidators.emailValidator(value),
                        hintText: "Enter your Email",
                        labelText: "Email",
                        keyBordType: TextInputType.text),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextFormFieldItem(
                            hintText: 'Enter Password',
                            labelText: 'Password',
                            controller: signupViewModel.passwordController,
                            validator: (value) =>
                                MyValidators.signupPasswordValidation(value),
                            isObscureText: signupViewModel.isObsecure,
                            keyBordType: TextInputType.visiblePassword,
                            suffixIcon: InkWell(
                              child: signupViewModel.isObsecure
                                  ? Icon(
                                      Icons.visibility_off,
                                      color: Colors.grey,
                                    )
                                  : Icon(
                                      Icons.visibility,
                                      color: Colors.grey,
                                    ),
                              onTap: () {
                                if (signupViewModel.isObsecure) {
                                  signupViewModel.isObsecure = false;
                                } else {
                                  signupViewModel.isObsecure = true;
                                }
                                setState(() {});
                              },
                            ),
                            maxLine: 1,
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Expanded(
                          child: TextFormFieldItem(
                            controller:
                                signupViewModel.confirmPasswordController,
                            hintText: 'Confirm Password',
                            labelText: 'Confirm Password',
                            validator: (value) =>
                                MyValidators.confirmationPassValidator(
                              value,
                              signupViewModel.passwordController
                                  .text, // Pass the password value
                            ),
                            isObscureText: signupViewModel.isObsecure,
                            keyBordType: TextInputType.visiblePassword,
                            suffixIcon: InkWell(
                              child: signupViewModel.isObsecure
                                  ? Icon(
                                      Icons.visibility_off,
                                      color: Colors.grey,
                                    )
                                  : Icon(
                                      Icons.visibility,
                                      color: Colors.grey,
                                    ),
                              onTap: () {
                                if (signupViewModel.isObsecure) {
                                  signupViewModel.isObsecure = false;
                                } else {
                                  signupViewModel.isObsecure = true;
                                }
                                setState(() {});
                              },
                            ),
                            maxLine: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TextFormFieldItem(
                      controller: signupViewModel.phoneController,
                      hintText: "Enter Phone Number",
                      labelText: "Phone Number",
                      validator: (value) => MyValidators.phoneValidator(value),
                      keyBordType: TextInputType.phone,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: MyTheme.mainColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.r))),
                        onPressed: () {
                          //  if (signupViewModel.formKey.currentState!.validate()) {Navigator.pushNamedAndRemoveUntil(context, MainHome.routeName, (route) => false);
                          if (signupViewModel.formKey.currentState!
                              .validate()) {
                            signupViewModel.signup();
                          }
                        },
                        child: Text(
                          "Signup",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: MyTheme.whiteColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account? ",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 17.sp)),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, LoginScreen.routeName);
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: MyTheme.mainColor,
                                decoration: TextDecoration.underline,
                                decorationThickness: 2.w,
                                fontWeight: FontWeight.w500,
                                fontSize: 17.sp),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )),
            ),
          ),
        ));
  }
}
