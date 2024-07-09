import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar_app_test/controller/auth/auth_states.dart';
import 'package:nectar_app_test/params/auth_params.dart';
import 'package:nectar_app_test/view/screens/home_screen.dart';

import '../../controller/auth/auth_cubit.dart';
import '../../core/app_helper/app_navigator.dart';
import '../../core/app_helper/app_validators.dart';
import '../../core/custom_widgets/custom_text_button.dart';
import '../../core/custom_widgets/custom_text_form_field.dart';
import '../../core/style/app_colors.dart';
import '../widgets/blurred_colored_widget.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  void onLoginTap() {
    if (_key.currentState!.validate()) {
      AuthCubit.get(context).login(
        params: AuthParams(
          email: _email.text,
          password: _password.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthStates>(
          listener: (context, state) {
            if (state is AuthSuccessState) {
              AppNavigator.pushRemove(context, const HomeScreen());
            }
          },
          builder: (context, state) {
            if (state is AuthLoadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              );
            }
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BlurredColoredWidget(),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: Form(
                      key: _key,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            'Enter your emails and password',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.mediumGrey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 40),
                          CustomTextFormField(
                            hint: '',
                            label: 'Email',
                            controller: _email,
                            textInputType: TextInputType.emailAddress,
                            validator: (val) => AppValidators.email(value: val),
                          ),
                          const SizedBox(height: 30),
                          CustomTextFormField(
                            hint: '',
                            label: 'Password',
                            controller: _password,
                            validator: (val) => AppValidators.minLength(val, 8),
                          ),
                          const SizedBox(height: 25),
                          CustomTextButton(
                            text: 'Log In',
                            onTap: () => onLoginTap(),
                          ),
                          const SizedBox(height: 25),
                          GestureDetector(
                            onTap: () => AppNavigator.pushRemove(
                                context, const SignUpScreen()),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don’t have an account? ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Signup',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primaryColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
