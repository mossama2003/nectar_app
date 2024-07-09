import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar_app_test/controller/auth/auth_states.dart';

import '../../controller/auth/auth_cubit.dart';
import '../../core/app_helper/app_navigator.dart';
import '../../core/app_helper/app_validators.dart';
import '../../core/custom_widgets/custom_text_button.dart';
import '../../core/custom_widgets/custom_text_form_field.dart';
import '../../core/style/app_colors.dart';
import '../../params/auth_params.dart';
import '../widgets/blurred_colored_widget.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _passwordConfirm = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _email.dispose();
    _email.dispose();
    _password.dispose();
    _passwordConfirm.dispose();
  }

  void onSignupTap() {
    if (_key.currentState!.validate()) {
      AuthCubit.get(context).signup(
        params: AuthParams(
          name: _name.text,
          email: _email.text,
          password: _password.text,
          passwordConfirmation: _passwordConfirm.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthStates>(listener: (context, state) {
          if (state is AuthSuccessState) {
            AppNavigator.pushRemove(context, const LoginScreen());
          }
        }, builder: (context, state) {
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
              children: [
                const BlurredColoredWidget(),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 25,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Enter your credentials to continue',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.mediumGrey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 40),
                      CustomTextFormField(
                        hint: '',
                        label: 'Username',
                        controller: _name,
                        validator: (val) => AppValidators.required(value: val),
                      ),
                      const SizedBox(height: 30),
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
                      const SizedBox(height: 30),
                      CustomTextFormField(
                        hint: '',
                        label: 'Confirm Password',
                        controller: _passwordConfirm,
                        validator: (val) => AppValidators.identical(
                          val,
                          _password.text,
                          'Confirm Password not equal the original password',
                        ),
                      ),
                      const SizedBox(height: 25),
                      CustomTextButton(
                        text: 'Sign Up',
                        onTap: () => onSignupTap(),
                      ),
                      const SizedBox(height: 25),
                      GestureDetector(
                        onTap: () => AppNavigator.pushRemove(
                          context,
                          const LoginScreen(),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account? ',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Login',
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
              ],
            ),
          );
        }),
      ),
    );
  }
}
