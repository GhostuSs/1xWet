
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_wet/gen/assets.gen.dart';
import 'package:x_wet/utils/color_palette/colors.dart';

class WaterWidget extends StatelessWidget{
  WaterWidget({required this.water});
  final int water;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Assets.images.cup.svg(color: AppColors.aquaBlue),
          SizedBox(height: 8.h,),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('${water}',style: TextStyle(
                  color: AppColors.white,
                  fontFamily: 'MontBold',fontWeight: FontWeight.w700,fontSize: 15.w
              ),),
              Text(' ml',style: TextStyle(
                  color: AppColors.white,
                  fontFamily: 'MontMedium',fontWeight: FontWeight.w300,fontSize: 15.w,
              ),)
            ],
          )
        ],
      ),
    );
  }
}