import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/core_export.dart';

import '../loading_view/loading_text.dart';


class CommonButton extends StatelessWidget {
  final String title;
  final Color? bgColor;
  final Color? borderColor;
  final Color? titleColor;
  final VoidCallback onTap;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final bool? isLoading;
  final Color? loaderColor;

  const CommonButton({
    super.key,
    required this.title,
    this.bgColor,
    this.borderColor,
    this.titleColor,
    required this.onTap,
    this.height,
    this.width,
    this.textStyle,
    this.isLoading,
    this.loaderColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width ?? MediaQuery.of(context).size.width - 48,
        height: height ?? 36.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(48),
          border: Border.all(
            color:
                borderColor ?? bgColor ?? context.resources.color.primaryColor,
          ),
          color: bgColor ?? Colors.transparent,
        ),
        child: LoadingText(
          isLoading: isLoading == true,
          color: loaderColor,
          child: Text(
            title,
            style: textStyle ??
                context.resources.style.w500s14(context.resources.color.white),
          ),
        ),
      ),
    );
  }
}
