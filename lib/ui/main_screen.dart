import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:x_wet/gen/assets.gen.dart';
import 'package:x_wet/models/user_data/user.dart';
import 'package:x_wet/ui/home/ui/home_screen.dart';
import 'package:x_wet/ui/settings/ui/settings_screen.dart';
import 'package:x_wet/utils/color_palette/colors.dart';
import 'fill_data/ui/fill_data.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  late List<Widget> screens=[FillDataScreen(),SettingsScreen()];
  int currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:  Hive.openBox<UserData>('userdata').then((value) => screens = value.isEmpty ? [FillDataScreen(),SettingsScreen()] : [HomeScreen(),SettingsScreen()] ),
        builder: (_,AsyncSnapshot snapshot){
      if(snapshot.hasData){
        return WillPopScope(
            child: Scaffold(
              backgroundColor: Color(0xFF243A6B),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Colors.white.withOpacity(0.3)))),
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
                  backgroundColor: Color(0xFF243A6B),
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
      }else{
        return Scaffold();
      }
    });
  }
}