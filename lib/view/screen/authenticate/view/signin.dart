import 'package:trackexpense/core/image_constants.dart';
import 'package:trackexpense/utils/app_sizes.dart';
import 'package:trackexpense/utils/colors.dart';
import 'package:trackexpense/utils/utils.dart';
import 'package:trackexpense/view/screen/authenticate/bloc/user_authenticate_bloc.dart';
import 'package:trackexpense/view/screen/dashboard/home/bloc/saveRupeeToObjectBloc/save_rupee_to_object_bloc.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight * 0.8,
      color: kBlack,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.cancel_outlined, color: kWhite,)
              ),
              gapW24
            ],
          ),
          gapH16,
          Container(
            width: double.infinity,
            height: screenHeight * 0.25,
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
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: screenHeight * 0.08,
              ),
              BlocConsumer<UserAuthenticateBloc, UserAuthenticateBlocState>(
                listener: (context, state) {
                  if(state is UserAuthenticateBlocLoaded) {
                    context.read<SaveRupeeToObjectBloc>().add(SaveRupeeToObject(userId: state.profileData.userId ?? ''));
                    context.pop();
                    // context.read<RupeeMonthlyDataBloc>().add(RupeeMonthlyData(month: DateTime.now().month, year: DateTime.now().year, userId: state.profileData.userId ?? ''));
                    // context.pushReplacementNamed(AppRoute.dashboardPage.name);
                  }
                },
                builder: (context, state) {
                  return InkWell(
                    onTap: () {
                      context.read<UserAuthenticateBloc>().add(UserAuthenticate());
                    },
                    child: Container(
                      height: 50,
                      width: screenWidth * 0.9,
                      decoration: BoxDecoration( 
                        border: Border.all(color: kWhite),
                        color: state.isLoading ? kBlack : kWhite,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: state.isLoading ? const Center(child: SizedBox(height: 30, width: 30, child: CircularProgressIndicator(color: kWhite,))) 
                      : Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              IconConstants().google,
                              height: 32,
                              width: 32,
                            ),
                            gapW10,
                            const Text(
                              "Login with Google",
                              style: TextStyle(
                                color: kBlack,
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ],
      ),
    );
  }
}
