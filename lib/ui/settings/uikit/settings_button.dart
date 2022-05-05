import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_wet/utils/color_palette/colors.dart';

class SettingsButton extends StatelessWidget {
  final Widget icon;
  final String label;
  final VoidCallback? onPressed;

  SettingsButton(
      {Key? key, required this.icon, required this.label, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: InkWell(
        onTap: onPressed ?? () => debugPrint('pressed'),
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          width: double.infinity,
          height: 65.h,
          decoration: BoxDecoration(
            color: AppColors.lightBlue.withOpacity(0.25),
            border: Border.all(color: AppColors.aquaBlue,width: 2.2.w),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Row(
              children: [
                SizedBox(
                  width: 32.w,
                  height: 32.h,
                  child: icon,
                ),
                SizedBox(width: 16.w),
                Text(
                  label,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 18.h,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'MontMedium',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}