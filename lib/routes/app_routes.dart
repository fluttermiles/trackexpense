import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trackexpense/data/remote/travel/models/travel_model.dart';
import 'package:trackexpense/view/screen/faqs/faq_view.dart';
import 'package:trackexpense/view/screen/notification/view/notification_page.dart';
import 'package:trackexpense/view/screen/dashboard/view/dashboard.dart';
import 'package:trackexpense/view/screen/authenticate/view/signin.dart';
import 'package:trackexpense/view/screen/moneyData/view/money_data_screen.dart';
import 'package:trackexpense/view/screen/moneyMonthlyData/view/money_data_screen.dart';
import 'package:trackexpense/view/screen/privacyPolicy/privacy_policy.dart';
import 'package:trackexpense/view/screen/splash/view/splash_view.dart';
import 'package:trackexpense/view/screen/splitWithFriend/addSplitFriend/view/add_split_Friend_view.dart';
import 'package:trackexpense/view/screen/splitWithFriend/splitFriend/view/split_friend_view.dart';
import 'package:trackexpense/view/screen/termsConsdition/terms_condition.dart';
import 'package:trackexpense/view/screen/travelBudget/addTravel/view/add_travel_view.dart';
import 'package:trackexpense/view/screen/travelBudget/travelDetailView/view/travel_detail_view.dart';
import 'package:trackexpense/view/screen/travelBudget/travelView/view/travel_view.dart';
// import 'package:trackexpense/view/screen/splash/view/splash_view.dart';

enum AppRoute {
  splashScreen,
  moneyDataScreen,
  signInPage,
  dashboardPage,
  moneyMonthlyScreen,
  privacyPolicy,
  termsCondition,
  travelView,
  travelDetailView,
  addTravelData,
  splitFriendView,
  addSplitFriend,
  notificationScreen,
  feedback
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
      name: AppRoute.notificationScreen.name,
      path: '/notificationScreen',
      builder: (context, state) => const NotificationPage(),
    ),
    GoRoute(
      name: AppRoute.travelView.name,
      path: '/travelView',
      builder: (context, state) => const TravelView(),
    ),
    GoRoute(
      name: AppRoute.splitFriendView.name,
      path: '/splitFriendView',
      builder: (context, state) => const SplitFriendView(),
    ),
    GoRoute(
      name: AppRoute.addSplitFriend.name,
      path: '/addSplitFriend',
      builder: (context, state) => const AddSplitFriendView(),
    ),
    GoRoute(
      name: AppRoute.travelDetailView.name,
      path: '/travelDetailView',
      builder: (context, state) {
        final TravelModel data = state.extra! as TravelModel;
        return TravelDetailView(travelModel: data,);
      },
    ),
    GoRoute(
      name: AppRoute.addTravelData.name,
      path: '/addTravelData',
      builder: (context, state) => const AddTravelView(),
    ),
    GoRoute(
      name: AppRoute.feedback.name,
      path: '/feedback',
      builder: (context, state) => const FAQPage(),
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

