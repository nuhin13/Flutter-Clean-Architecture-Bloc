import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/res/app_context_extension.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../routes/navigation_service.dart';
import '../../../../../../routes/route_paths.dart';
import '../bloc/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<SplashBloc>().add(const SplashNavigate());

    return BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashToDashboard) {
          NavigationService.navigateReplaced(RoutePaths.tradeScreen);
        } else if (state is SplashToLogin) {
          NavigationService.navigateReplaced(RoutePaths.loginScreen);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                height: double.infinity,
                color: context.resources.color.white,
                child: SvgPicture.asset(context.resources.drawable.splashImage),
              ),
              const Positioned(
                bottom: 60,
                left: 0,
                right: 0,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
