import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/core_export.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../res/res_export.dart';
import '../../../../../services/services_export.dart';
import '../bloc/login_bloc_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<LoginBlocCubit, LoginBlocState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              NavigationService.navigateReplaced(RoutePaths.tradeScreen);
            } else if (state is LoginError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  duration: const Duration(seconds: 2),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is LoginLoading) {
              return const CircularProgressIndicator();
            } else {
              return main(context);
            }
          },
        ),
      ),
    );
  }

  Widget main(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 120,
              width: 120,
              child: SvgPicture.asset(context.resources.drawable.splashImage)),
          const SizedBox(height: 16),
          Text(
            '${context.resources.strings?.loginUpperText}',
            style: const TextStyle(
              color: Color(0xFF445164),
              fontSize: 24,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${context.resources.strings?.loginDescription}',
            style: const TextStyle(
              color: Color(0xFF171930),
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
            child: TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
            ),
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: SizedBox(
              height: 40,
              width: 140,
              child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<LoginBlocCubit>(context)
                      .login(usernameController.text, passwordController.text);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
