import 'package:trackexpense/core/image_constants.dart';
import 'package:trackexpense/utils/colors.dart';
import 'package:trackexpense/utils/utils.dart';
import 'package:trackexpense/view/screen/authenticate/bloc/user_authenticate_bloc.dart';
import 'package:trackexpense/view/screen/dashboard/home/bloc/rupeeMonthlyDataBloc/rupee_monthly_data_bloc.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kBlack,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: screenHeight * 0.2,
              ),
              Container(
                width: double.infinity,
                height: screenHeight * 0.4,
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/icons/rupeemate.png',
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Welcome",
                    style: GoogleFonts.baskervville(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: kWhite,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Sign in for free to track your expenses",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[300],
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.08,
                  ),
                  BlocListener<UserAuthenticateBloc, UserAuthenticateBlocState>(
                    listener: (context, state) {
                      if(state is UserAuthenticateBlocLoaded) {
                        context.read<RupeeMonthlyDataBloc>().add(RupeeMonthlyData(month: DateTime.now().month, year: DateTime.now().year, userId: state.profileData.userId ?? ''));
                        context.pushReplacementNamed(AppRoute.dashboardPage.name);
                      }
                    },
                    child: ElevatedButton.icon(
                      onPressed: () {
                        context.read<UserAuthenticateBloc>().add(UserAuthenticate());
                      },
                      icon: SvgPicture.asset(
                        IconConstants().google,
                        height: 32,
                        width: 32,
                      ),
                      label: const Text(
                        "Login with Google",
                        style: TextStyle(
                            color: kBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kWhite,
                        minimumSize: Size(screenWidth * 0.9, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
