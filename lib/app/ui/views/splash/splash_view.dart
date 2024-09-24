import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'splash_viewmodel.dart';

class SplashView extends StackedView<SplashViewModel> {
  const SplashView({super.key});

  @override
  SplashViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SplashViewModel();

  @override
  void onViewModelReady(SplashViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.spalash();
  }

  @override
  Widget builder(
    BuildContext context,
    SplashViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset("assets/images/postoffice.jpg")],
      ),
    );
  }
}
