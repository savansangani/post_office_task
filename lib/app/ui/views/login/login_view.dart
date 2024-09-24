import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_office_task/app/custom/custom_gradient_button.dart';
import 'package:post_office_task/app/custom/custom_text_form_field.dart';
import 'package:post_office_task/app/utils/validators/validators.dart';
import 'package:stacked/stacked.dart';
import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({super.key});

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18).h,
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  viewModel.isLogin
                      ? "Hello there! Login to Continue"
                      : "Hello there! Create your Account",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                ),
                SizedBox(height: 50.h),
                CustomTextFormField(
                  hintText: "Entre your email",
                  controller: viewModel.emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: FormValidators.emailValidator,
                  prefixIcon: const Icon(
                    Icons.email,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20.h),
                CustomTextFormField(
                  hintText: "Entre your password",
                  controller: viewModel.passwordController,
                  obscureText: !viewModel.isPasswordVisible,
                  prefixIcon: const Icon(
                    Icons.lock,
                    size: 20,
                    color: Colors.black,
                  ),
                  suffixIcon: InkWell(
                    onTap: viewModel.handlePasswordVisibilityChange,
                    child: viewModel.isPasswordVisible
                        ? const Icon(
                            Icons.visibility_outlined,
                            size: 20,
                            color: Colors.black,
                          )
                        : const Icon(
                            Icons.visibility_off_outlined,
                            size: 20,
                            color: Colors.black,
                          ),
                  ),
                  validator: FormValidators.requiredValidator,
                ),
                if (!viewModel.isLogin) SizedBox(height: 20.h),
                if (!viewModel.isLogin)
                  CustomTextFormField(
                    hintText: "Entre your confirm password",
                    controller: viewModel.confirmPasswordController,
                    obscureText: !viewModel.isConfirmPasswordVisible,
                    prefixIcon: const Icon(
                      Icons.lock,
                      size: 20,
                      color: Colors.black,
                    ),
                    suffixIcon: InkWell(
                      onTap: viewModel.handleConfirmPasswordVisibilityChange,
                      child: viewModel.isConfirmPasswordVisible
                          ? const Icon(
                              Icons.visibility_outlined,
                              size: 20,
                              color: Colors.black,
                            )
                          : const Icon(
                              Icons.visibility_off_outlined,
                              size: 20,
                              color: Colors.black,
                            ),
                    ),
                    validator: FormValidators.requiredValidator,
                  ),
                SizedBox(height: 30.h),
                CustomGradientButton(
                  text: viewModel.isLogin ? 'Log In' : 'Sign Up',
                  isGradient: true,
                  onPressed: viewModel.isLogin
                      ? () async {
                          try {
                            if (formKey.currentState!.validate()) {
                              viewModel.handleLoginButtonTap();
                            }
                          } catch (error) {
                            print(error);
                          }
                        }
                      : () async {
                          try {
                            if (formKey.currentState!.validate()) {
                              viewModel.handleSignUpButtonTap();
                            }
                          } catch (error) {
                            print(error);
                          }
                        },
                ),
                SizedBox(
                  height: 30.h,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: viewModel.isLogin
                            ? 'Don\'t have an account? '
                            : 'Already have an Account? ',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.grey.shade800,
                                ),
                      ),
                      TextSpan(
                          text: viewModel.isLogin ? 'Sign Up' : 'Log in',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600,
                                  ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              viewModel.handleAuthTypeChange(viewModel.isLogin
                                  ? AuthType.signup
                                  : AuthType.login);
                            })
                    ],
                  ),
                  textAlign: TextAlign.center,
                  textScaler:
                      TextScaler.linear(MediaQuery.of(context).textScaleFactor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
