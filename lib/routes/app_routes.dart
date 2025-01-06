import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trackexpense/view/screen/dashboard/view/dashboard.dart';
import 'package:trackexpense/view/screen/authenticate/view/signin.dart';
import 'package:trackexpense/view/screen/moneyData/view/money_data_screen.dart';
import 'package:trackexpense/view/screen/moneyMonthlyData/view/money_data_screen.dart';
import 'package:trackexpense/view/screen/privacyPolicy/privacy_policy.dart';
import 'package:trackexpense/view/screen/splash/view/splash_view.dart';
import 'package:trackexpense/view/screen/termsConsdition/terms_condition.dart';
// import 'package:trackexpense/view/screen/splash/view/splash_view.dart';

enum AppRoute {
  splashScreen,
  moneyDataScreen,
  signInPage,
  dashboardPage,
  moneyMonthlyScreen,
  privacyPolicy,
  termsCondition
}

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      name: AppRoute.splashScreen.name,
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      name: AppRoute.signInPage.name,
      path: '/signInPage',
      builder: (context, state) => const SignInPage(),
    ),
    GoRoute(
      name: AppRoute.dashboardPage.name,
      path: '/dashboardPage',
      builder: (context, state) => const DashBoardPage(),
    ),
    GoRoute(
      name: AppRoute.moneyMonthlyScreen.name,
      path: '/moneyMonthlyScreen',
      builder: (context, state) => const MoneyMonthlyScreen(),
    ),
    GoRoute(
      name: AppRoute.termsCondition.name,
      path: '/termsCondition',
      builder: (context, state) => const TermsCondition(),
    ),
    GoRoute(
      name: AppRoute.privacyPolicy.name,
      path: '/privacyPolicy',
      builder: (context, state) => const PrivacyPolicy(),
    ),
    GoRoute(
      name: AppRoute.moneyDataScreen.name,
      path: '/moneyDataScreen',
      builder: (context, state) {
        final DateTime data = state.extra! as DateTime;
        return MoneyDataScreen(selectedDate: data,);
      },
    ),
  ],
  errorBuilder: (context, state) {
    return const Scaffold(
      body: Center(
        child: Text('Error'),
      ),
    );
  },
);