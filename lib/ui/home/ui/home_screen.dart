import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_wet/gen/assets.gen.dart';
import 'package:x_wet/models/day/day.dart';
import 'package:x_wet/models/days_month/days_month.dart';
import 'package:x_wet/uikit/1x_wet_label.dart';
import 'package:x_wet/utils/color_palette/colors.dart';
import 'package:hive/hive.dart';
import '../../description/ui/description_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({required this.monthData, required this.weight});
  final WaterDaysInMonth monthData;
  final int weight;
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  initState(){
    super.initState();

  }
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
                  padding: EdgeInsets.symmetric(horizontal: 6.5.w),
                ),
                for (int d = 1;
                    d <
                        DateTime.utc(
                                DateTime.now().year, DateTime.now().month, 1)
                            .weekday;
                    d++)
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 9.w, vertical: 8.h),
                    child: Container(
                      width: 30.w,
                      height: 47.h,
                    ),
                  ),
                for (int i = 0; i < daysPerMonths(); i++)
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 9.w, vertical: 8.h),
                    child: InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DescriptionScreen(
                                  dayWater: widget.monthData.data![i],),),),
                      child: Container(
                        width: 30.w,
                        height: 47.h,
                        child: Stack(
                          children: [
                            Assets.images.cup.svg(color: checkColor(widget.monthData.data?[i] ?? WaterDay(date: DateTime.now(),waterValues: [1,2,3,4]))),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                '${i+1}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.w,
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

  Color checkColor(WaterDay dayWater) {
    if((dayWater.date!.day)==DateTime.now().day) {
      if (dayWater.waterValues?.isEmpty == true) return AppColors.red;
      if(dayWater.waterValues?.isEmpty == false && checkWaterDrunk(dayWater)) return AppColors.aquaBlue;
      if(dayWater.waterValues?.isEmpty == false) return AppColors.yellow;
    }
    if(dayWater.date?.isBefore(DateTime.now())==true && dayWater.waterValues?.isEmpty==true){
      return AppColors.red;
    }else{
      if(dayWater.date?.isAfter(DateTime.now())==true)
      return AppColors.gray;
    }
    if(dayWater.date?.isBefore(DateTime.now())==true&& dayWater.waterValues!.isNotEmpty==true){
      if(checkWaterDrunk(dayWater)==true){
        return AppColors.aquaBlue;
      }else{
        return AppColors.yellow;
      }
    }
    return AppColors.gray;
  }

  bool checkWaterDrunk(WaterDay waterDay){
    int sum = 0;
    for(var a in waterDay.waterValues!){
      sum+=a;
    }
    print('!');
    print((sum/1000)/(widget.weight/9)>0.25);
    return (sum/1000)/(widget.weight/9)>0.25 ? true : false;
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
