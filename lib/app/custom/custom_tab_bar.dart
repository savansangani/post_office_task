// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomTabBar extends StatelessWidget {
  final List<TabItem> tabs;
  final int tabLength;
  final double? indicatorRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? labelPadding;
  final TextStyle? unselectedLabelStyle;
  final TextStyle? labelStyle;
  final ValueChanged<int>? onTabChanged;
  final bool? isScrollable;
  final TabBarIndicatorSize? indicatorSize;

  const CustomTabBar({
    super.key,
    required this.tabs,
    required this.tabLength,
    this.indicatorRadius,
    this.padding,
    this.labelPadding,
    this.unselectedLabelStyle,
    this.labelStyle,
    this.onTabChanged,
    this.isScrollable,
    this.indicatorSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: padding ?? EdgeInsets.zero,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.06,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFF2F4F6),
              borderRadius: BorderRadius.circular(18),
            ),
            child: TabBar(
              isScrollable: isScrollable ?? false,
              dividerColor: Colors.transparent,
              labelPadding: labelPadding ?? const EdgeInsets.all(0),
              indicatorSize: indicatorSize ?? TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                gradient: BaseGradient.mainGradient,
                borderRadius: BorderRadius.circular(indicatorRadius ?? 18.r),
              ),
              unselectedLabelStyle: unselectedLabelStyle ??
                  Get.textTheme.titleMedium?.copyWith(
                    color: BaseColors.textBlack,
                    fontWeight: FontWeight.w700,
                  ),
              labelStyle: labelStyle ??
                  Get.textTheme.titleMedium?.copyWith(
                    color: BaseColors.textWhite,
                    fontWeight: FontWeight.w700,
                  ),
              onTap: onTabChanged,
              tabs: tabs
                  .map(
                    (e) => Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          e.icon != null
                              ? Icon(
                                  e.icon,
                                  color: Colors.red,
                                )
                              : const SizedBox.shrink(),
                          const SizedBox(width: 5),
                          Text(e.title),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class TabItem {
  final String title;
  final IconData? icon;
  final Widget widget;
  const TabItem({
    required this.title,
    this.icon,
    required this.widget,
  });
}
