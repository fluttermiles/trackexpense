import 'package:flutter/services.dart';
import 'package:trackexpense/data/remote/profile/profile_repository_impl.dart';
import 'package:trackexpense/data/remote/rupeemate/rupeemate_repo_impl.dart';
import 'package:trackexpense/utils/utils.dart';
import 'package:trackexpense/view/screen/authenticate/bloc/user_authenticate_bloc.dart';
import 'package:trackexpense/view/screen/dashboard/home/bloc/rupeeMonthlyDataBloc/rupee_monthly_data_bloc.dart';
import 'package:trackexpense/view/screen/dashboard/profile/bloc/logout/logout_bloc.dart';
import 'package:trackexpense/view/screen/moneyData/bloc/rupee_data_bloc.dart';
import 'package:trackexpense/view/screen/moneyData/view/addData/bloc/add_expense_bloc_bloc.dart';
import 'package:trackexpense/view/screen/dashboard/profile/bloc/profileData/profile_data_bloc.dart';
import 'package:trackexpense/view/screen/splash/bloc/bloc/fetch_profile_data_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  MobileAds.instance.initialize();
  await Firebase.initializeApp();

  final profileDataBloc = ProfileDataBloc();
  final profileRepository = ProfileRepositoryImpl();
  final rupeeMateRepository = RupeeMateRepositoryImpl();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddExpenseBlocBloc(
            rupeeMateRepository: rupeeMateRepository,
          ),
        ),
        BlocProvider(
          create: (context) => profileDataBloc,
        ),
        BlocProvider(
          create: (context) => UserAuthenticateBloc(
            profileRepository: profileRepository,
            profileDataBloc: profileDataBloc,
          ),
        ),
        BlocProvider(
          create: (context) => FetchProfileDataBloc(
            profileRepository: profileRepository,
            profileDataBloc: profileDataBloc,
          ),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(
            profileDataBloc: profileDataBloc,
          ),
        ),
        BlocProvider(
          create: (context) => RupeeDataBloc(
            rupeeMateRepository: rupeeMateRepository,
          ),
        ),
        BlocProvider(
          create: (context) => RupeeMonthlyDataBloc(
            rupeeMateRepository: rupeeMateRepository,
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: router,
          );
        }
      )
    );
  }
}