import 'package:trackexpense/utils/colors.dart';
import 'package:trackexpense/utils/utils.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:trackexpense/view/screen/dashboard/home/view/home_view.dart';
import 'package:trackexpense/view/screen/dashboard/notification/view/notification_page.dart';
import 'package:trackexpense/view/screen/dashboard/profile/view/profile_view.dart';
import 'package:trackexpense/view/screen/dashboard/search/view/search_view.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  int selectedIndex = 0;

  final PageController pageController = PageController();

  List<Widget> pages = [
    HomeView(),
    SearchView(),
    NotificationPage(),
    ProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        children: pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: kBlack,
            )
          ],
        ),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            color: kBlack,
            child: GNav(
              backgroundColor: kBlack,
              rippleColor: kBlack,
              hoverColor: kBlack,
              gap: 8,
              haptic: true,
              activeColor: kWhite,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabActiveBorder: Border.all(color: kWhite),
              color: kWhite,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: LineIcons.bell,
                  text: 'Notifications',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                ),
              ],
              selectedIndex: selectedIndex,
              onTabChange: (index) {
                setState(() {
                  selectedIndex = index;
                });
                pageController.jumpToPage(index); 
              },
            ),
          ),
        ),
      ),
    );
  }
}
