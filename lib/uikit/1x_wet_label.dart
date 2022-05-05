import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_wet/utils/color_palette/colors.dart';

class XWetLabel extends StatelessWidget {
  const XWetLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 46.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '1X WET:',
            style: TextStyle(
                color: AppColors.aquaBlue,
                fontWeight: FontWeight.w700,
                fontFamily: 'MontBold',
                fontSize: 32.h),
          ),
          SizedBox(width: 10.w,),
          Text(
            'ASSISTANT',
            style: TextStyle(
                color: AppColors.lightBlue,
                fontWeight: FontWeight.w700,
                fontFamily: 'MontBold',
                fontSize: 32.h),
          )
        ],
      ),
    );
  }
}