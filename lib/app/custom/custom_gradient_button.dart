import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_office_task/app/utils/colors.dart';

class CustomGradientButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final double? width;
  final double? height;
  final double? opacity;
  final Color? textColor;
  final Color? backgroundColor;
  final Gradient? gradient;
  final bool isGradient;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? borderColor;

  const CustomGradientButton({
    super.key,
    this.onPressed,
    required this.text,
    this.width,
    this.height,
    this.opacity,
    this.textColor,
    this.backgroundColor,
    this.gradient,
    this.isGradient = false,
    this.padding,
    this.margin,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    // final themeProvider = MediaQuery.of(context).platformBrightness;
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        gradient: gradient ??
            (backgroundColor != null || !isGradient
                ? null
                : Colorz.gradientButton),
        color: backgroundColor,
      ),
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
          ),
        ),
        padding: padding ??
            EdgeInsets.symmetric(
              vertical: 5.0.h,
              horizontal: 20.0.w,
            ),
        height: height ?? 45.0.h,
        minWidth: width ?? double.infinity,
        onPressed: onPressed,
        child: Text(
          text,
          style: Get.textTheme.titleMedium!.copyWith(
            color: textColor ?? Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
