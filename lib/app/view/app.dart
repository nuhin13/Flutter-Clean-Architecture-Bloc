import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/features/welcome/domain/usecase/welecome_usecase.dart';
import '../../core/domain/service_locator.dart';
import '../../features/authentication/domain/usecase/auth_use_case.dart';
import '../../features/authentication/presentation/login/bloc/login_bloc_cubit.dart';
import '../../features/authentication/presentation/registration/bloc/registration_bloc.dart';
import '../../features/trades/domain/repo/trade_repository.dart';
import '../../features/trades/presentation/bloc/trades_bloc.dart';
import '../../features/welcome/presentation/splash/bloc/splash_bloc.dart';
import '../../features/welcome/presentation/splash/screen/splash_screen.dart';
import '../../routes/app_router.dart';
import '../../routes/navigation_service.dart';

class AppRepositoryProvider extends StatelessWidget {
  const AppRepositoryProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => serviceLocator<AuthUseCase>()),
        RepositoryProvider(
            create: (context) => serviceLocator.get<WelcomeUseCase>()),
        RepositoryProvider(
            create: (context) => serviceLocator.get<TradeRepository>()),
      ],
      child: const AppBlocProvider(),
    );
  }
}

class AppBlocProvider extends StatelessWidget {
  const AppBlocProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SplashBloc(
            RepositoryProvider.of<WelcomeUseCase>(context),
          ),
        ),
        BlocProvider(
          create: (_) => LoginBlocCubit(
            RepositoryProvider.of<AuthUseCase>(context),
          ),
        ),
        BlocProvider(
          create: (_) => TradesBloc(
            RepositoryProvider.of<TradeRepository>(context),
          ),
        ),
        BlocProvider(
          create: (context) => RegistrationBloc(
            RepositoryProvider.of<AuthUseCase>(context),
          ),
        ),
      ],
      child: MaterialApp(
        navigatorKey: NavigationService.navigatorKey,
        onGenerateRoute: AppRouter.generateRoute,
        title: "context.resources.strings!.appName",
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
