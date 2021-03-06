import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:x_wet/models/day/day.dart';
import 'package:x_wet/models/days_month/days_month.dart';
import 'package:x_wet/models/user_data/user.dart';
import 'package:x_wet/utils/color_palette/colors.dart';
import 'package:x_wet/utils/routes/routes.dart';

bool premium = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]);
  Directory directory = Directory.current;
  if (Platform.isIOS) {
    directory = await getApplicationDocumentsDirectory();
  } else {
    directory = await getApplicationDocumentsDirectory();
  }
  Hive.init(directory.path);
  Hive..registerAdapter<UserData>(UserDataAdapter())
      ..registerAdapter<WaterDay>(WaterDayAdapter())
      ..registerAdapter<WaterDaysInMonth>(WaterDaysInMonthAdapter());
  await Hive.openBox<WaterDaysInMonth>('data');
   final box = await Hive.openBox<UserData>('userdata');
  // final boxs = await Hive.openBox<WaterDaysInMonth>('data');
  // await boxs.clear();
  // await box.clear();
  // final boxf = await Hive.openBox<bool>('premium');
  // await boxf.clear();
  if(box.isEmpty==true)box.put('userdata', UserData());
  final prem = await Hive.openBox<bool>('premium');
  if (prem.values.isEmpty) await prem.put('premium', false);
  premium = prem.values.first;
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (Column) => MaterialApp(
        darkTheme: ThemeData(
          selectedRowColor: AppColors.aquaBlue,
          unselectedWidgetColor: AppColors.lightBlue.withOpacity(0.3),
        ),
        routes: routes,
        initialRoute: premium==true
            ? MainNavigationRoutes.main
            : MainNavigationRoutes.onboarding,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: AppColors.aquaBlue,
              selectedLabelStyle: TextStyle(
                  fontFamily: 'MontBold',
                  fontWeight: FontWeight.w400,
                  fontSize: 12.h,
              ),
              showUnselectedLabels: true,
              showSelectedLabels: true,
              unselectedItemColor:AppColors.aquaBlue.withOpacity(0.3),
              unselectedLabelStyle: TextStyle(
                  color: AppColors.aquaBlue.withOpacity(0.3),
                  fontFamily: 'MontBold',
                  fontWeight: FontWeight.w400,
                  fontSize: 12.h),
              unselectedIconTheme: IconThemeData(color: AppColors.aquaBlue.withOpacity(0.3),)),
          textTheme: TextTheme(
              button: TextStyle(
                fontSize: 45.sp,
              )),
        ),
      ),
    );
  }
}