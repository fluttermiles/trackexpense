import 'package:trackexpense/utils/colors.dart';
import 'package:trackexpense/utils/utils.dart';
import 'package:trackexpense/view/screen/dashboard/home/bloc/rupeeMonthlyDataBloc/rupee_monthly_data_bloc.dart';
import 'package:trackexpense/view/screen/dashboard/search/view/filter/bloc/filter_bloc_bloc.dart';
import 'package:trackexpense/view/screen/splash/bloc/bloc/fetch_profile_data_bloc.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    context.read<FilterBlocBloc>().add(Filter(month: DateTime.now().month, year: DateTime.now().year));
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        context.read<FetchProfileDataBloc>().add(FetchProfileData());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FetchProfileDataBloc, FetchProfileBlocState>(
      listener: (context, state) {
        if(state is FetchProfileBlocLoaded){
          context.read<RupeeMonthlyDataBloc>().add(RupeeMonthlyData());
          context.pushReplacementNamed(AppRoute.dashboardPage.name);
        }
        if(state is FetchProfileBlocError){
          context.pushReplacementNamed(AppRoute.dashboardPage.name);
        }
      },
      child: Scaffold(
        backgroundColor: kBlack,
        body: Container(
          color: kBlack,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Image.asset(
              'assets/icons/rupeemate.png',
              fit: BoxFit.cover,
              height: 200,
            ),
          ),
        ),
      ),
    );
  }
}
