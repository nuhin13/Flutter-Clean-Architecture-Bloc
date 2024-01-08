import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/domain/service_locator.dart';
import 'package:flutter_clean_architecture/features/authentication/presentation/login/screens/login_screen.dart';
import 'package:flutter_clean_architecture/features/welcome/presentation/splash/presentation/screen/splash_screen.dart';

import '../../features/authentication/domain/repository/auth_repository.dart';
import '../../features/authentication/presentation/login/bloc/login_bloc_cubit.dart';
import '../../features/authentication/presentation/registration/bloc/registration_bloc.dart';
import '../../features/trades/domain/repo/trade_repository.dart';
import '../../features/trades/presentation/bloc/trades_bloc.dart';
import '../../features/trades/presentation/screens/trades_screen.dart';
import '../../features/welcome/domain/repository/welcome_repository.dart';
import '../../features/welcome/presentation/splash/presentation/bloc/splash_bloc.dart';
import '../../routes/app_router.dart';
import '../../routes/navigation_service.dart';

class AppRepositoryProvider extends StatelessWidget {
  const AppRepositoryProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (context) => serviceLocator<AuthRepository>()),
        RepositoryProvider(
            create: (context) => serviceLocator.get<WelcomeRepository>()),
        RepositoryProvider(
            create: (context) => serviceLocator.get<TradeRepository>()),

        // RepositoryProvider<TradeRepository>(
        //   create: (context) => TradeCacheImpl(
        //     serviceLocator.get<BaseCache>(),
        //     TradeHttpImp(serviceLocator.get<ApiClient>()),
        //   ),
        // ),
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
            RepositoryProvider.of<WelcomeRepository>(context),
          ),
        ),
        BlocProvider(
          create: (_) => LoginBlocCubit(
            RepositoryProvider.of<AuthRepository>(context),
          ),
        ),
        BlocProvider(
          create: (_) => TradesBloc(
            RepositoryProvider.of<TradeRepository>(context),
          ),
        ),
        BlocProvider(
          create: (context) => RegistrationBloc(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: NavigationService.navigatorKey,
        onGenerateRoute: AppRouter.generateRoute,
        title: "context.resources.strings!.appName",
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
