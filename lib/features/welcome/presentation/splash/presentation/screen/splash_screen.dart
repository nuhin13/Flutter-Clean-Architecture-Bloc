import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/res/app_context_extension.dart';
import 'package:flutter_svg/svg.dart';

import '../bloc/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        return;
        // if (didPop) {
        //   return;
        // }
        // final navigator = Navigator.of(context);
        // bool value = await someFunction();
        // if (value) {
        //   navigator.pop();
        // }
      },
      //   WillPopScope(
      // onWillPop: () async {
      //   int currentTime = DateTime.now().millisecondsSinceEpoch;
      //
      //   if (currentTime - _lastBackPressedTime < 2000) {
      //     return true;
      //   } else {
      //     _lastBackPressedTime = currentTime;
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       const SnackBar(
      //         content: Text("Press back again to exit"),
      //         duration: Duration(seconds: 2),
      //       ),
      //     );
      //     return false;
      //   }
      // },
      child: BlocConsumer<SplashBloc, SplashState>(
        listener: (context, state) {
          // bool? isInfoUpdated =
          //     state.googleAuthResponse?.data?.influencer?.infoUpdated;
          // bool? isCompleted =
          //     state.googleAuthResponse?.data?.influencer?.profileCompleted;
          // bool? isInstagramConnected =
          //     state.googleAuthResponse?.data?.influencer?.instagramConnected;
          // bool? isTiktokConnected =
          //     state.googleAuthResponse?.data?.influencer?.tiktokConnected;
          //
          // if (state.status.isSuccess) {
          //   if ((isCompleted == true &&
          //       (isInstagramConnected == true || isTiktokConnected == true))) {
          //     NavigationService.navigateReplaced(RoutePaths.homepage);
          //   } else if (isInfoUpdated == false) {
          //     context.read<ProfileBloc>().add(ClearState());
          //     context.read<ProfileBloc>().add(ProfileGetGenreEvent());
          //     NavigationService.navigateReplaced(RoutePaths.profile);
          //   } else if (isInfoUpdated == true &&
          //       (isInstagramConnected == false && isTiktokConnected == false)) {
          //     NavigationService.navigateReplaced(RoutePaths.snsScreen);
          //   } else {
          //     NavigationService.navigateReplaced(RoutePaths.welcome);
          //   }
          // } else {
          //   NavigationService.navigateReplaced(RoutePaths.welcome);
          // }
        },
        builder: (context, state) {
          return Scaffold(
              body: Center(
            child: SvgPicture.asset(context.resources.drawable.splashImage),
          ));
        },
      ),
    );
  }
}
