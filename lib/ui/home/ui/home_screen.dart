import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_wet/gen/assets.gen.dart';
import 'package:x_wet/uikit/1x_wet_label.dart';
import 'package:x_wet/utils/color_palette/colors.dart';

import '../../description/ui/description_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF243A6B),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          XWetLabel(),
          SizedBox(
            height: 40.h,
          ),
          Text(
            months[DateTime.now().month - 1] +
                ' ' +
                DateTime.now().year.toString(),
            style: TextStyle(
                color: AppColors.aquaBlue,
                fontWeight: FontWeight.w700,
                fontFamily: 'MontBold',
                fontSize: 22.w),
          ),
          SizedBox(
            height: 24.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 26.w),
            child: Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.start,
              children: [
                Padding(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (var el in prefs)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6.5.w),
                          child: Text(
                            el,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.w,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'MontMedium'),
                          ),
                        )
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                ),
                for (int i = 0; i < daysPerMonths(); i++)
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 9.w, vertical: 8.h),
                    child: InkWell(
                      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>DescriptionScreen(date:DateTime.now()))),
                      child: Container(
                        width: 30.w,
                        height: 47.h,
                        child: Stack(
                          children: [
                            Assets.images.cup.svg(color: AppColors.yellow),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                '${i + 1}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.w,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'MontMedium'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
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

  List<String> prefs = ['Mn', 'Tu', 'Wd', 'Th', 'Fr', 'Sa', 'Sn'];

  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
}
