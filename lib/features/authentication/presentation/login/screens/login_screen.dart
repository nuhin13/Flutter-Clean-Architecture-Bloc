
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/res/app_context_extension.dart';
import 'package:flutter_svg/svg.dart';

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
              // Navigate to a new screen
            }
          },
          builder: (context, state) {
            if (state is LoginLoading) {
              return const CircularProgressIndicator();
            } else if (state is LoginError) {
              return Text(state.message);
            } else {
              return main(context);
            }
          },
        ),
      ),
    );
  }

  Widget main(BuildContext context){
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();


    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 200,
              width: 200,
              child: SvgPicture.asset(context.resources.drawable.loginDiziCash)),

          const Text(
            'Login to continue',
            style: TextStyle(
              color: Color(0xFF445164),
              fontSize: 24,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),

          const Text(
            ' We will send --------- code to login',
            style: TextStyle(
              color: Color(0xFF171930),
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
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
            padding: const EdgeInsets.only(top: 8.0),
            child: ElevatedButton(
              onPressed: () {

                final username = usernameController.text;
                final password = passwordController.text;

                BlocProvider.of<LoginBlocCubit>(context).login(username, password);

              },
              child: const Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}
