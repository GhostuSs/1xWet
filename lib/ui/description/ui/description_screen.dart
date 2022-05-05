import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_wet/ui/description/uikit/water_widget.dart';
import 'package:x_wet/uikit/1x_wet_label.dart';
import 'package:x_wet/utils/color_palette/colors.dart';

class DescriptionScreen extends StatefulWidget {
  DescriptionScreen({required this.date});
  final DateTime date;
  @override
  State<StatefulWidget> createState() {
    return _DescriptionScreenState();
  }
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF243A6B),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
            children: [
          XWetLabel(),
          SizedBox(
            height: 40.h,
          ),
          Text(
            months[widget.date.month - 1] +' '+widget.date.day.toString()+
                ', ' +
                daysPerWeek[DateTime.now().weekday-1].toString(),
            style: TextStyle(
                color: AppColors.aquaBlue,
                fontWeight: FontWeight.w700,
                fontFamily: 'MontBold',
                fontSize: 22.w),
          ),

          Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: [
                WaterWidget(water: 250)
            ],
          )
        ]));
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
  List<String> daysPerWeek=[
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
}

