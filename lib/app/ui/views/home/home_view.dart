import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    viewModel.fetchPostOfficeList();
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Post Offices"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: viewModel.handelLogOutButtonTap,
              child: const Icon(
                Icons.logout,
                color: Colors.red,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: viewModel.busy(viewModel.fetchPostOfficeList)
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18).h,
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                    itemCount: viewModel.postOffices.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 15.h),
                        child: GestureDetector(
                          onTap: () => viewModel.handelDetailsTapButton(
                              viewModel.postOffices[index]),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.grey.shade300, width: 1),
                              borderRadius: BorderRadius.circular(14).r,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 10)
                                  .h,
                              child: Text(
                                viewModel.postOffices[index].name,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey.shade800,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )),
                ],
              ),
            ),
    );
  }
}
