import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/features/trades/data/http/trade_http_impl.dart';

import '../../features/authentication/data/repo_impl/auth_repository_impl.dart';
import '../../features/authentication/domain/repository/auth_repository.dart';
import '../../features/authentication/presentation/login/bloc/login_bloc_cubit.dart';
import '../../features/authentication/presentation/registration/bloc/registration_bloc.dart';
import '../../features/trades/domain/repo/trade_repository.dart';
import '../../features/trades/presentation/bloc/trades_bloc.dart';
import '../../features/trades/presentation/screens/trades_screen.dart';
import '../../features/welcome/data/repo_impl/welcome_repository_impl.dart';
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
        RepositoryProvider<AuthRepository>(
            create: (context) => AuthRepositoryImpl()),
        RepositoryProvider<WelcomeRepository>(
            create: (context) => WelcomeRepositoryImpl()),
        RepositoryProvider<TradeRepository>(
            create: (context) => TradeHttpImp()),
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
          create: (context) => SplashBloc(),
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
        home: TradesScreen(),
      ),
    );
  }
}
