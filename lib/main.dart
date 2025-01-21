import 'package:flutter/services.dart';
import 'package:trackexpense/core/object_init.dart';
import 'package:trackexpense/data/local/profile/profile_object_repo_impl.dart';
import 'package:trackexpense/data/local/rupeeMate/rupeemate_object_repo_impl.dart';
import 'package:trackexpense/data/remote/notification/notification_repository_impl.dart';
import 'package:trackexpense/data/remote/profile/profile_repository_impl.dart';
import 'package:trackexpense/data/remote/rupeemate/rupeemate_repo_impl.dart';
import 'package:trackexpense/data/remote/splitFriend/split_friend_repository_impl.dart';
import 'package:trackexpense/data/remote/travel/travel_repository_impl.dart';
import 'package:trackexpense/data/remote/travelMate/travelmate_repository_impl.dart';
import 'package:trackexpense/utils/utils.dart';
import 'package:trackexpense/view/screen/authenticate/bloc/user_authenticate_bloc.dart';
import 'package:trackexpense/view/screen/dashboard/home/bloc/expenseCreditBloc/expense_credit_bloc.dart';
import 'package:trackexpense/view/screen/dashboard/home/bloc/rupeeMonthlyBloc/rupee_monthly_bloc.dart';
import 'package:trackexpense/view/screen/dashboard/home/bloc/rupeeMonthlyDataBloc/rupee_monthly_data_bloc.dart';
import 'package:trackexpense/view/screen/dashboard/home/bloc/saveRupeeToObjectBloc/save_rupee_to_object_bloc.dart';
import 'package:trackexpense/view/screen/dashboard/profile/bloc/logout/logout_bloc.dart';
import 'package:trackexpense/view/screen/dashboard/search/view/filter/bloc/filter_bloc_bloc.dart';
import 'package:trackexpense/view/screen/moneyData/bloc/rupee_data_bloc.dart';
import 'package:trackexpense/view/screen/moneyData/view/addData/bloc/add_expense_bloc_bloc.dart';
import 'package:trackexpense/view/screen/dashboard/profile/bloc/profileData/profile_data_bloc.dart';
import 'package:trackexpense/view/screen/moneyMonthlyData/bloc/money_monthly_bloc.dart';
import 'package:trackexpense/view/screen/notification/bloc/acceptRejectSplitBloc/accept_reject_split_bloc.dart';
import 'package:trackexpense/view/screen/notification/bloc/notificationBloc/notification_bloc.dart';
import 'package:trackexpense/view/screen/splash/bloc/bloc/fetch_profile_data_bloc.dart';
import 'package:trackexpense/view/screen/splitWithFriend/addMember/bloc/addUserSplitBloc/add_user_split_bloc.dart';
import 'package:trackexpense/view/screen/splitWithFriend/addMember/bloc/userSearchBloc/user_search_bloc.dart';
import 'package:trackexpense/view/screen/splitWithFriend/addSplitFriend/bloc/add_split_friend_bloc.dart';
import 'package:trackexpense/view/screen/splitWithFriend/splitFriend/bloc/split_friend_bloc.dart';
import 'package:trackexpense/view/screen/travelBudget/addTravel/bloc/add_travel_bloc.dart';
import 'package:trackexpense/view/screen/travelBudget/addTravelMate/bloc/add_travel_mate_bloc.dart';
import 'package:trackexpense/view/screen/travelBudget/travelDetailView/bloc/travel_detail_bloc.dart';
import 'package:trackexpense/view/screen/travelBudget/travelView/bloc/trave_data_bloc.dart';


late ObjectBox objectBox; 
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
  objectBox = await ObjectBox.create();

  final profileDataBloc = ProfileDataBloc();
  final expenseCreditBloc = ExpenseCreditBloc();
  final profileRepository = ProfileRepositoryImpl();
  final profileObjectRepository = ProfileObjectRepositoryImpl();
  final rupeeObjectRepository = RupeeObjectRepositoryImpl();
  final rupeeMateRepository = RupeeMateRepositoryImpl();
  final travelRepository = TravelRepositoryImpl();
  final travelMateRepository = TravelMateRepositoryImpl();
  final splitFriendRepository = SplitFriendRepositoryImpl();
  final notificationRepository = NotificationRepositoryImpl();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddExpenseBlocBloc(
            rupeeMateRepository: rupeeMateRepository,
            rupeeObjectRepository: rupeeObjectRepository
          ),
        ),
        BlocProvider(
          create: (context) => profileDataBloc,
        ),
        BlocProvider(
          create: (context) => UserAuthenticateBloc(
            profileRepository: profileRepository,
            rupeeObjectRepository: rupeeObjectRepository,
            profileObjectRepository: profileObjectRepository,
            profileDataBloc: profileDataBloc,
          ),
        ),
        BlocProvider(
          create: (context) => FetchProfileDataBloc(
            profileObjectRepository: profileObjectRepository,
            rupeeObjectRepository: rupeeObjectRepository,
            profileDataBloc: profileDataBloc,
          ),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(
            profileDataBloc: profileDataBloc,
            profileObjectRepository: profileObjectRepository,
            rupeeObjectRepository: rupeeObjectRepository
          ),
        ),
        BlocProvider(
          create: (context) => RupeeDataBloc(
            rupeeObjectRepository: rupeeObjectRepository,
          ),
        ),
        BlocProvider(
          create: (context) => RupeeMonthlyDataBloc(
            expenseCreditBloc: expenseCreditBloc, 
            rupeeObjectRepository: rupeeObjectRepository
          ),
        ),
        BlocProvider(
          create: (context) => expenseCreditBloc,
        ),
        BlocProvider(
          create: (context) => RupeeMonthlyBloc(rupeeObjectRepository: rupeeObjectRepository),
        ),
        BlocProvider(
          create: (context) => FilterBlocBloc(),
        ),
        BlocProvider(
          create: (context) => MoneyMonthlyBloc(rupeeObjectRepository: rupeeObjectRepository),
        ),
        BlocProvider(
          create: (context) => SaveRupeeToObjectBloc(
            rupeeMateRepository: rupeeMateRepository,
            rupeeObjectRepository: rupeeObjectRepository, 
            rupeeMonthlyDataBloc: context.read<RupeeMonthlyDataBloc>(),
          ),
        ),
        BlocProvider(
          create: (context) => AddTravelBloc(travelRepository: travelRepository),
        ),
        BlocProvider(
          create: (context) => TravelDataBloc(travelRepository: travelRepository),
        ),
        BlocProvider(
          create: (context) => AddTravelMateBloc(travelMateRepository: travelMateRepository),
        ),
        BlocProvider(
          create: (context) => TravelDetailBloc(travelMateRepository: travelMateRepository),
        ),
        BlocProvider(
          create: (context) => AddSplitFriendBloc(splitFriendRepository: splitFriendRepository),
        ),
        BlocProvider(
          create: (context) => SplitFriendBloc(splitFriendRepository: splitFriendRepository),
        ),
        BlocProvider(
          create: (context) => UserSearchBloc(profileRepository: profileRepository),
        ),
        BlocProvider(
          create: (context) => AddUserSplitBloc(notificationRepository: notificationRepository),
        ),
        BlocProvider(
          create: (context) => NotificationBloc(notificationRepository: notificationRepository),
        ),
        BlocProvider(
          create: (context) => AcceptRejectSplitBloc(
            notificationRepository: notificationRepository,
            splitFriendRepository: splitFriendRepository,
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