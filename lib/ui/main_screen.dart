import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_wet/gen/assets.gen.dart';
import 'package:x_wet/ui/settings/ui/settings_screen.dart';
import 'package:x_wet/utils/color_palette/colors.dart';
import 'home/ui/home.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = [HomeScreen(),SettingsScreen()];
  int currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.black.withOpacity(0.8)))),
            child: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: Assets.images.water
                        .svg(color: AppColors.aquaBlue.withOpacity(0.3),width: 30.w,height: 30.h),
                    label: 'Water',
                    activeIcon: Assets.images.water.svg(color: AppColors.aquaBlue,width: 30.w,height: 30.h)),
                BottomNavigationBarItem(
                    label: 'Settings',
                    icon: Assets.images.settings.svg(
                        color: AppColors.aquaBlue.withOpacity(0.3),
                        width: 30.w,
                        height: 30.h),
                    activeIcon: Assets.images.settings.svg(
                        color: AppColors.aquaBlue, width: 30.w, height: 30.h)),
              ],
              backgroundColor: Color(0xFF031434),
              unselectedLabelStyle: TextStyle(
                fontFamily: 'MontBold',
                fontWeight: FontWeight.w400,
                color: Color(0xFF1A66FFB2).withOpacity(0.3),
                fontSize: 12.h,
              ),
              currentIndex: currIndex,
              onTap: (index) {
                setState(() {
                  currIndex = index;
                });
              },
            ),
          ),
          body: Container(
            child: screens[currIndex],
          ),
        ),
        onWillPop: () async => false);
  }
}