import 'package:flutter/material.dart';
import 'home/ui/home.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = [HomeScreen()];//SettingsScreen()];
  int currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          // bottomNavigationBar: Container(
          //   decoration: BoxDecoration(
          //       border: Border(
          //           top: BorderSide(color: Colors.black.withOpacity(0.84)))),
          //   child: BottomNavigationBar(
          //     items: [
          //       BottomNavigationBarItem(
          //           icon: Assets.images.quiz
          //               .svg(color: AppColors.lightBlue.withOpacity(0.3),width: 30.w,height: 30.h),
          //           label: 'Quiz',
          //           activeIcon: Assets.images.quiz.svg(color: AppColors.lightBlue,width: 30.w,height: 30.h)),
          //       BottomNavigationBarItem(
          //           label: 'Settings',
          //           icon: Assets.images.settings.svg(
          //               color: AppColors.lightBlue.withOpacity(0.3),
          //               width: 30.w,
          //               height: 30.h),
          //           activeIcon: Assets.images.settings.svg(
          //               color: AppColors.lightBlue, width: 30.w, height: 30.h)),
          //     ],
          //     backgroundColor: AppColors.darkblue,
          //     unselectedLabelStyle: TextStyle(
          //       fontFamily: 'MontBold',
          //       fontWeight: FontWeight.w400,
          //       color: Color(0xFF1A66FFB2).withOpacity(0.3),
          //       fontSize: 12.h,
          //     ),
          //     currentIndex: currIndex,
          //     onTap: (index) {
          //       setState(() {
          //         currIndex = index;
          //       });
          //     },
          //   ),
          // ),
          body: Container(
            child: screens[currIndex],
          ),
        ),
        onWillPop: () async => false);
  }
}