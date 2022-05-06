import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:x_wet/gen/assets.gen.dart';
import 'package:x_wet/models/day/day.dart';
import 'package:x_wet/models/days_month/days_month.dart';
import 'package:x_wet/ui/description/uikit/water_widget.dart';
import 'package:x_wet/ui/main_screen.dart';
import 'package:x_wet/ui/settings/ui/settings_screen.dart';
import 'package:x_wet/uikit/1x_wet_label.dart';
import 'package:x_wet/uikit/raw_bottomsheet.dart';
import 'package:x_wet/utils/color_palette/colors.dart';

class DescriptionScreen extends StatefulWidget {
  DescriptionScreen({required this.dayWater});
  final WaterDay dayWater;
  @override
  State<StatefulWidget> createState() {
    return _DescriptionScreenState();
  }
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  int drankMl = 0;
  int waterVal = 0;
  int currIndex = 0;
  late List<Widget> screens;
  List<String> waterData =
      List.generate(100, (index) => ((index+1) * 10).toString());
  @override
  void initState() {
    for (int i = 0; i < widget.dayWater.waterValues!.length; i++) {
      drankMl += widget.dayWater.waterValues![i];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    drankMl=0;
    for (int i = 0; i < widget.dayWater.waterValues!.length; i++) {
      drankMl += widget.dayWater.waterValues![i];
    }
    return Scaffold(
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
        body: currIndex == 0 ? Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 46.h,left: 15.w),
                child: InkWell(
                  onTap: () async {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>MainScreen()));
                  },
                  child: Center(child: Icon(Icons.arrow_back_ios,color: AppColors.white,)),),
              ),
              XWetLabel()
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          Text(
            months[widget.dayWater.date!.month - 1] +
                ' ' +
                widget.dayWater.date!.day.toString() +
                ', ' +
                daysPerWeek[widget.dayWater.date!.weekday-1].toString(),
            style: TextStyle(
                color: AppColors.aquaBlue,
                fontWeight: FontWeight.w700,
                fontFamily: 'MontBold',
                fontSize: 22.w),
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            'Today you drank',
            style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w500,
                fontFamily: 'MontMedium',
                fontSize: 18.w),
          ),
          Text(
            '${drankMl} ml',
            style: TextStyle(
                color: AppColors.aquaBlue,
                fontWeight: FontWeight.w700,
                fontFamily: 'MontBold',
                fontSize: 18.w),
          ),
          SizedBox(
            height: 24.h,
          ),
          Container(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              direction: Axis.horizontal,
              children: [
                for (int elements in widget.dayWater.waterValues!)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 26.w,vertical: 10.h),
                    child: WaterWidget(water: elements),
                  ),
              ],
            ),
          ),
          Spacer(),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: InkWell(
                onTap: () => showModalBottomSheet(
                    isDismissible: false,
                    context: context,
                    builder: (_) => RawBottomSheet(
                        label: 'Water',
                        data: waterData,
                        onSelectedItemChanged: (value) => waterVal=value*10,
                        onCancel: () {
                          waterVal=0;
                          Navigator.pop(context);
                        },
                        onOk: () async {
                          if(waterVal==0){
                            waterVal=10;
                          }
                          final box = await Hive.openBox<WaterDaysInMonth>('data');
                          final listData = box.values.first;
                          List<int> list = widget.dayWater.waterValues!;
                          print(widget.dayWater.date);
                          list.add(waterVal);
                          final WaterDay newData = WaterDay(date: widget.dayWater.date,waterValues: list);
                          listData.data!.removeWhere((element) => element.date!.day==widget.dayWater.date!.day);
                          listData.data!.add(newData);
                          listData.data!.sort((a,b)=>a.date!.day.compareTo(b.date!.day));
                          await box.clear();
                          box.put('data', listData);
                          setState(() {});
                          Navigator.pop(context);
                        })),
                borderRadius: BorderRadius.circular(12.r),
                child: Container(
                  width: 253.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      color: AppColors.aquaBlue,
                      borderRadius: BorderRadius.circular(12.r)),
                  child: Center(
                    child: Text('ADD WATER',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'MontMedium',
                          fontSize: 22.w,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                ),
              ))
        ]) : SettingsScreen()
    );
  }

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
  List<String> daysPerWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
}
