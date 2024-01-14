import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/presentation/resources/app_context_extension.dart';

class LoadingText extends StatelessWidget {
  final bool isLoading;
  final Text child;
  final Color? color;

  const LoadingText({
    super.key,
    required this.isLoading,
    required this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              color: color ?? context.resources.color.primaryColor,
              strokeWidth: 3,
            ),
          )
        : child;
  }
}
