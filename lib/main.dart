import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:x_wet/utils/color_palette/colors.dart';
import 'package:x_wet/utils/routes/routes.dart';

bool seen = false;
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
        initialRoute: seen==true && premium==true
            ? MainNavigationRoutes.main
            : MainNavigationRoutes.onboarding,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: AppColors.lightBlue,
              selectedLabelStyle: TextStyle(
                  fontFamily: 'MontBold',
                  fontWeight: FontWeight.w400,
                  fontSize: 12.h),
              showUnselectedLabels: true,
              showSelectedLabels: true,
              unselectedItemColor:AppColors.lightBlue.withOpacity(0.3),
              unselectedLabelStyle: TextStyle(
                  color: AppColors.lightBlue.withOpacity(0.3),
                  fontFamily: 'MontBold',
                  fontWeight: FontWeight.w400,
                  fontSize: 12.h),
              unselectedIconTheme: IconThemeData(color: AppColors.lightBlue.withOpacity(0.3),)),
          textTheme: TextTheme(
              button: TextStyle(
                fontSize: 45.sp,
              )),
        ),
      ),
    );
  }
}