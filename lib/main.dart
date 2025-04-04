import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:userapp/pages/dashboard/dashboard_page.dart';
import 'package:userapp/pages/location/location_page.dart';
import 'package:userapp/pages/login/login_page.dart';
import 'package:userapp/pages/register/register_page.dart';
import 'package:userapp/pages/splash/splash_page.dart';

import 'constants/app_colors.dart';
import 'constants/app_style.dart';
import 'language/app_localizations.dart';
import 'navigation/navigation_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return SplashPage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'login',
            builder: (BuildContext context, GoRouterState state) {
              return const LoginPage();
            },
          ),
          GoRoute(
            path: 'register',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const RegisterPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0); // Slide from right
                const end = Offset.zero;
                const curve = Curves.easeInOut;
                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);
                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            ),
          ),
          GoRoute(
            path: 'location',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const LocationPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0); // Slide from right
                const end = Offset.zero;
                const curve = Curves.easeInOut;
                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);
                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            ),
          ),
          GoRoute(
            path: 'dashboard-page',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const DashboardPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0); // Slide from right
                const end = Offset.zero;
                const curve = Curves.easeInOut;
                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);
                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            ),
          ),

          // GoRoute(
          //   path: 'cart',
          //   builder: (BuildContext context, GoRouterState state) {
          //     final Map<String, dynamic> arguments = state.extra as Map<String, dynamic>;
          //     final isBack = arguments['isBack'] as bool;
          //     return CartPage(isBack);
          //   },
          // ),

        ],
      ),
    ],
  );


  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      overlayColor: Colors.grey.withOpacity(0.5),
      useDefaultLoading: false,
      overlayWidgetBuilder: (_) { //ignored progress for the moment
        return Center(
          child: SpinKitThreeBounce(
            color: AppColors.themeColor,
            size: 50.0,
          ),
        );
      },
      child: MaterialApp.router(
        key: NavigationService.navigatorKey,
        routerConfig: _router,
        title: 'Oiaway',
        debugShowCheckedModeBanner: false,
        locale: Locale('en'), // Default locale
        supportedLocales: [
          Locale('en', ''),
          Locale('tn', ''),
        ],
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale!.languageCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        darkTheme: ThemeData(brightness: Brightness.light),
        themeMode: ThemeMode.light,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.themeColor),
          useMaterial3: true,
          fontFamily: AppStyle.sarabunMedium,
        ),
      ),
    );
  }
}


