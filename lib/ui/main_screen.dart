import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:x_wet/gen/assets.gen.dart';
import 'package:x_wet/models/day/day.dart';
import 'package:x_wet/models/days_month/days_month.dart';
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
  late List<Widget> screens;
  int currIndex = 0;

  Future<bool> loadHive() async {
    final box = await Hive.openBox<UserData>('userdata');
    if (box.isEmpty == true || box.values.first.weight==null) {
      screens = [FillDataScreen(), SettingsScreen()];
      await box.put('userdata', UserData());
    } else {
      final monthData = await Hive.openBox<WaterDaysInMonth>('data');
      if (monthData.isEmpty == true) {
        print('r');
        monthData.put(
            'data',
            WaterDaysInMonth(
                data: List.generate(
                    daysPerMonths(),
                    (index) => WaterDay(
                        waterValues: [],
                        date: DateTime.utc(DateTime.now().year,
                            DateTime.now().month, index+1)))));
      }
      screens = [
        HomeScreen(
          monthData: monthData.values.first,
          weight: box.values.first.weight ?? 0,
        ),
        SettingsScreen()
      ];
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadHive(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return WillPopScope(
                child: Scaffold(
                  backgroundColor: Color(0xFF243A6B),
                  bottomNavigationBar: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                                color: Colors.white.withOpacity(0.3)))),
                    child: BottomNavigationBar(
                      items: [
                        BottomNavigationBarItem(
                            icon: Assets.images.water.svg(
                                color: AppColors.aquaBlue.withOpacity(0.3),
                                width: 30.w,
                                height: 30.h),
                            label: 'Water',
                            activeIcon: Assets.images.water.svg(
                                color: AppColors.aquaBlue,
                                width: 30.w,
                                height: 30.h)),
                        BottomNavigationBarItem(
                            label: 'Settings',
                            icon: Assets.images.settings.svg(
                                color: AppColors.aquaBlue.withOpacity(0.3),
                                width: 30.w,
                                height: 30.h),
                            activeIcon: Assets.images.settings.svg(
                                color: AppColors.aquaBlue,
                                width: 30.w,
                                height: 30.h)),
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
          } else {
            return Scaffold(
              backgroundColor: Color(0xFF243A6B),
            );
          }
        });
  }

  int daysPerMonths() {
    switch (DateTime.now().month) {
      case DateTime.april:
        return 30;
      case DateTime.june:
        return 30;
      case DateTime.november:
        return 30;
      case DateTime.september:
        return 30;
      case DateTime.february:
        return 28;
      default:
        return 31;
    }
  }
}
