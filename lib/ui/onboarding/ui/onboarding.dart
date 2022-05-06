import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:hive/hive.dart';
import 'package:x_wet/main.dart';
import 'package:x_wet/ui/webview_page/ui/webview.dart';
import 'package:x_wet/utils/color_palette/colors.dart';
import 'package:x_wet/utils/routes/routes.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _OnBoardingScreenState();
  }
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
      backgroundColor: Color(0xFF142850),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF142850),
              Color(0xFF253B6E)
            ]
          ),
            image: DecorationImage(
                image: AssetImage('assets/images/onboarding.png'),
                fit: BoxFit.contain
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 57.h, horizontal: 28.w),
                  child: InkWell(
                    onTap: () async {
                      final box = await Hive.openBox<bool>('seen');
                      await box.clear();
                      await box.put('seen', true);
                      Navigator.pushNamed(context, MainNavigationRoutes.main);
                    },
                    child: Icon(
                      Icons.clear,
                      color: AppColors.white,
                      size: 30.h,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 70.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Text(
                    '1X WET:',
                    style: TextStyle(
                        color: AppColors.aquaBlue,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'MontBold',
                        fontSize: 50.w,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(1,1),
                            blurRadius: 2,
                          )
                        ]
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.zero,
              child: Container(
                child: Center(
                  child: Text(
                    'ASSISTANT',
                    style: TextStyle(
                        color: AppColors.lightBlue,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'MontBold',
                        fontSize: 50.w),
                  ),
                ),
              ),
            ),
            SizedBox(height: 100.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:100.w,vertical: 12.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    textAlign:TextAlign.center,
                      text: TextSpan(
                      text: 'Reminders:\n',
                      style: TextStyle(
                        color: AppColors.aquaBlue,
                        fontSize: 24.h,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'MontMedium',
                      ),
                      children: [TextSpan(
                          text: 'to drink water',
                          style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'MontMedium',
                              fontSize: 24.w,
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(0.5),
                                  offset: Offset(1,1),
                                  blurRadius: 1,
                                )
                              ]
                          )
                      )]
                  )),
                ],
              ),
            ),
            Container(
              width: 205.w,
              height: 1.5,
              color: AppColors.lightBlue,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:95.w,vertical: 12.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                      textAlign:TextAlign.center,
                      text: TextSpan(
                          text: 'Adding notes\n',
                          style: TextStyle(
                            color: AppColors.aquaBlue,
                            fontSize: 24.h,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'MontMedium',
                          ),
                          children: [TextSpan(
                              text: 'to the calendar',
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'MontMedium',
                                  fontSize: 24.w,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black.withOpacity(0.5),
                                      offset: Offset(1,1),
                                      blurRadius: 1,
                                    )
                                  ]
                              )
                          )]
                      )),
                ],
              ),
            ),
            Container(
              width: 205.w,
              height: 1.5,
              color: AppColors.lightBlue,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:112.w,vertical: 12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      textAlign:TextAlign.center,
                      text: TextSpan(
                          text: 'Ad removing\n',
                          style: TextStyle(
                            color: AppColors.aquaBlue,
                            fontSize: 24.h,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'MontMedium',
                          ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 24.w, right: 24.w),
              child: InkWell(
                onTap: () async {
                  final box = await Hive.openBox<bool>('premium');
                  await box.clear();
                  await box.put('premium', true);
                  final seen = await Hive.openBox<bool>('seen');
                  await seen.clear();
                  await seen.put('seen', true);
                  premium=true;
                  Navigator.pushNamed(context, MainNavigationRoutes.main);
                },
                child: Container(
                  height: 56.h,
                  width: 327.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: AppColors.aquaBlue),
                  child: Center(
                    child: Text(
                      "Buy premium (0.99\$)".toUpperCase(),
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'MontBold',
                        fontSize: 22.w,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Opacity(
              opacity: 0.4,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 35.w,vertical: 18.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>WebViewPage())),
                      child: Text(
                        'Terms of use',
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'MontBold',
                            fontSize: 14.w),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        final box = await Hive.openBox<bool>('premium');
                        await box.clear();
                        await box.put('premium', true);
                        premium=true;
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Restore',
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'MontBold',
                            fontSize: 14.w),
                      ),
                    ),
                    InkWell(
                      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>WebViewPage())),
                      child: Text(
                        'Privacy Policy',
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'MontBold',
                            fontSize: 14.w),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ), onWillPop: ()async=>false);
  }
}