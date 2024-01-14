import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/presentation/resources/app_context_extension.dart';

class CommonBackground extends StatelessWidget {
  final Widget? widget;

  const CommonBackground({this.widget, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: context.resources.color.secondaryColor,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
              // blendMode: BlendMode.srcOver,
              child: Container(
                height: 375,
                width: 375,
                // alignment: Alignment.topRight,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Color.fromRGBO(56, 107, 169, 0.14),
                      Color(0xFF0A0B1C),
                    ],
                    center: Alignment(0, 0),
                  ),
                ),
              ),
            ),
            // ),
            Positioned(
              bottom: -75,
              left: -75,
              child: Center(
                child: Container(
                  height: 375,
                  width: 375,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(colors: [
                      Colors.white,
                      Colors.brown,
                    ]),
                  ),
                ),
              ),
            ),
            // widget!,
          ],
        ),
      ),
    );
  }
}
