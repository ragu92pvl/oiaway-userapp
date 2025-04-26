import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:userapp/model/response/home/home_data_response.dart';
import 'package:userapp/model/response/product/product_response.dart';
import 'package:userapp/model/response/product/sub_category_response.dart';
import 'package:userapp/pages/address/add_address_page.dart';
import 'package:userapp/pages/address/address_page.dart';
import 'package:userapp/pages/category/sub_category_page.dart';
import 'package:userapp/pages/dashboard/dashboard_page.dart';
import 'package:userapp/pages/dashboard/orders/order_details_page.dart';
import 'package:userapp/pages/dashboard/service/my_service_details_page.dart';
import 'package:userapp/pages/grocery/grocery_product_page.dart';
import 'package:userapp/pages/location/location_page.dart';
import 'package:userapp/pages/login/login_page.dart';
import 'package:userapp/pages/notifications/notification_page.dart';
import 'package:userapp/pages/offers/product_offers_page.dart';
import 'package:userapp/pages/packages/packages_list_page.dart';
import 'package:userapp/pages/product/product_check_out_page.dart';
import 'package:userapp/pages/product/product_details_page.dart';
import 'package:userapp/pages/product/product_page.dart';
import 'package:userapp/pages/records/add_records_page.dart';
import 'package:userapp/pages/records/my_records_page.dart';
import 'package:userapp/pages/register/register_page.dart';
import 'package:userapp/pages/service/service_check_out_page.dart';
import 'package:userapp/pages/service/service_list_packages_page.dart';
import 'package:userapp/pages/service/service_package_details_page.dart';
import 'package:userapp/pages/splash/splash_page.dart';
import 'package:userapp/pages/success/package_payment_success_page.dart';
import 'package:userapp/pages/success/product_success_page.dart';
import 'package:userapp/pages/success/service_success_page.dart';

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
          GoRoute(
            path: 'subcategory-page',
            name: 'subcategory-page',
            builder: (BuildContext context, GoRouterState state) {
              final Map<String, dynamic> arguments = state.extra as Map<String, dynamic>;
              var categoryData = arguments['categoryData'] as CategoryData?;
              return SubCategoryPage(categoryData!);
            },
          ),
          GoRoute(
            path: 'product-list',
            name: 'product-list',
            builder: (BuildContext context, GoRouterState state) {
              final Map<String, dynamic> arguments = state.extra as Map<String, dynamic>;
              var categoryData = arguments['categoryData'] as CategoryData?;
              var subCategoryData = arguments['subCategoryData'] as SubCategoryData?;
              return ProductPage(categoryData!,subCategoryData!);
            },
          ),
          GoRoute(
            path: 'product-details-page',
            name: 'product-details-page',
            builder: (BuildContext context, GoRouterState state) {
              final Map<String, dynamic> arguments = state.extra as Map<String, dynamic>;
              var categoryData = arguments['categoryData'] as CategoryData?;
              var subCategoryData = arguments['subCategoryData'] as SubCategoryData?;
              var productData = arguments['productData'] as ProductData?;
              return ProductDetailsPage(categoryData!,subCategoryData!,productData);
            },
          ),
          GoRoute(
            path: 'my-records-page',
            name: 'my-records-page',
            builder: (BuildContext context, GoRouterState state) {
              return MyRecordsPage();
            },
          ),
          GoRoute(
            path: 'add-records-page',
            name: 'add-records-page',
            builder: (BuildContext context, GoRouterState state) {
              return AddRecordsPage();
            },
          ),
          GoRoute(
            path: 'service-list-packages-page',
            name: 'service-list-packages-page',
            builder: (BuildContext context, GoRouterState state) {
              final Map<String, dynamic> arguments = state.extra as Map<String, dynamic>;
              var categoryData = arguments['categoryData'];
              return ServiceListPackagesPage(categoryData);
            },
          ),
          GoRoute(
            path: 'service-packages-details-page',
            name: 'service-packages-details-page',
            builder: (BuildContext context, GoRouterState state) {
              final Map<String, dynamic> arguments = state.extra as Map<String, dynamic>;
              var serviceData = arguments['serviceData'];
              return ServicePackageDetailsPage(serviceData);
            },
          ),
          GoRoute(
            path: 'address-page',
            name: 'address-page',
            builder: (BuildContext context, GoRouterState state) {
              return AddressPage();
            },
          ),
          GoRoute(
            path: 'add-address-page',
            name: 'add-address-page',
            builder: (BuildContext context, GoRouterState state) {
              return AddAddressPage();
            },
          ),
          GoRoute(
            path: 'amc-packages',
            name: 'amc-packages',
            builder: (BuildContext context, GoRouterState state) {
              final Map<String, dynamic> arguments = state.extra as Map<String, dynamic>;
              var products = arguments['products'];
              return PackagesListPage(products);
            },
          ),
          GoRoute(
            path: 'notifications-page',
            name: 'notifications-page',
            builder: (BuildContext context, GoRouterState state) {
              return NotificationPage();
            },
          ),
          GoRoute(
            path: 'package-payment-success',
            name: 'package-payment-success',
            builder: (BuildContext context, GoRouterState state) {
              return PackagePaymentSuccessPage();
            },
          ),
          GoRoute(
            path: 'service-check-out-page',
            name: 'service-check-out-page',
            builder: (BuildContext context, GoRouterState state) {
              final Map<String, dynamic> arguments = state.extra as Map<String, dynamic>;
              var packageData = arguments['packageData'];
              return ServiceCheckOutPage(packageData);
            },
          ),
          GoRoute(
            path: 'service-success-page',
            name: 'service-success-page',
            builder: (BuildContext context, GoRouterState state) {
              return ServiceSuccessPage();
            },
          ),
          GoRoute(
            path: 'service-details-page',
            name: 'service-details-page',
            builder: (BuildContext context, GoRouterState state) {
              final Map<String, dynamic> arguments = state.extra as Map<String, dynamic>;
              var serviceData = arguments['serviceData'];
              return MyServiceDetailsPage(serviceData);
            },
          ),
          GoRoute(
            path: 'product-offers-page',
            name: 'product-offers-page',
            builder: (BuildContext context, GoRouterState state) {
              final Map<String, dynamic> arguments = state.extra as Map<String, dynamic>;
              var productData = arguments['productData'];
              return ProductOffersPage(productData);
            },
          ),
          GoRoute(
            path: 'product-check-out-page',
            name: 'product-check-out-page',
            builder: (BuildContext context, GoRouterState state) {
              final Map<String, dynamic> arguments = state.extra as Map<String, dynamic>;
              var productData = arguments['productData'];
              var offerData = arguments['offerData'];
              return ProductCheckOutPage(productData,offerData);
            },
          ),
          GoRoute(
            path: 'product-success-page',
            name: 'product-success-page',
            builder: (BuildContext context, GoRouterState state) {
              return ProductSuccessPage();
            },
          ),
          GoRoute(
            path: 'order-details-page',
            name: 'order-details-page',
            builder: (BuildContext context, GoRouterState state) {
              final Map<String, dynamic> arguments = state.extra as Map<String, dynamic>;
              var orderBean = arguments['orderBean'];
              return OrderDetailsPage(orderBean);
            },
          ),
          GoRoute(
            path: 'grocery-product-page',
            name: 'grocery-product-page',
            builder: (BuildContext context, GoRouterState state) {
              final Map<String, dynamic> arguments = state.extra as Map<String, dynamic>;
              var categoryData = arguments['categoryData'];
              return GroceryProductPage(categoryData);
            },
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


