import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/features/welcome/domain/usecase/welecome_usecase.dart';
import 'package:flutter_clean_architecture/res/app_context_extension.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../core/domain/service_locator.dart';
import '../../features/authentication/domain/usecase/auth_use_case.dart';
import '../../features/authentication/presentation/login/bloc/login_bloc_cubit.dart';
import '../../features/authentication/presentation/registration/bloc/registration_bloc.dart';
import '../../features/trades/domain/repo/trade_repository.dart';
import '../../features/trades/presentation/bloc/trades_bloc.dart';
import '../../features/welcome/presentation/splash/bloc/splash_bloc.dart';
import '../../features/welcome/presentation/splash/screen/splash_screen.dart';
import '../../res/app_localizations_delegate.dart';
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
      child: AppBlocProvider(),
    );
  }
}

class AppBlocProvider extends StatelessWidget {
  Locale? _locale;

  AppBlocProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _locale = const Locale("en");

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
        locale: _locale,
        supportedLocales: const [
          Locale("en"),
          Locale("bn"),
        ],
        localizationsDelegates: const [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultMaterialLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocal in supportedLocales) {
            if (supportedLocal.languageCode == locale?.languageCode &&
                supportedLocal.countryCode == locale?.countryCode) {
              return supportedLocal;
            }
          }
          return supportedLocales.first;
        },
        title: context.resources.strings?.appName ?? "Flutter Demo App",
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
