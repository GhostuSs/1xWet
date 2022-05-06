import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_palette/colors.dart';

class RawInfoField extends StatelessWidget{
  RawInfoField({required this.onPressed, required this.label, required this.value});
  
  final VoidCallback onPressed;
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,style: TextStyle(
                color: AppColors.white,
                fontSize: 18.h,
                fontWeight: FontWeight.w500,
                fontFamily: 'MontMedium'
            ),),
            SizedBox(height: 4.h,),
            InkWell(
              onTap: onPressed,
              borderRadius: BorderRadius.circular(10.r),
              child: Container(
                width: double.infinity,
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.lightBlue.withOpacity(0.25),
                  border: Border.all(color: AppColors.aquaBlue),
                ),
                padding: EdgeInsets.only(top: 8.h,bottom: 8.h,left: 16.w,right: 10.w),
                child: Row(
                children: [
                  Text(value,style: TextStyle(
                  color: AppColors.white,
                  fontFamily: 'MontMedium',
                  fontSize: 18.h,
                  fontWeight: FontWeight.w500,
                ),
                ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios,color: AppColors.aquaBlue,),

                ]
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  
}