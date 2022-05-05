import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_wet/gen/assets.gen.dart';
import 'package:x_wet/ui/onboarding/ui/onboarding.dart';
import 'package:x_wet/ui/settings/uikit/settings_button.dart';
import 'package:x_wet/ui/webview_page/ui/webview.dart';
import 'package:x_wet/uikit/1x_wet_label.dart';
import 'package:x_wet/utils/color_palette/colors.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingsScreenState();
  }
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            color: Color(0xFF243A6B),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 26.h),
                child: XWetLabel(),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: SettingsButton(
                  icon: Assets.images.buyPremium.svg(),
                  label: 'Buy premium',
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => OnBoardingScreen())),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: SettingsButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => WebViewPage())),
                  icon: Assets.images.privacyPolicy.svg(),
                  label: 'Privacy policy',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: SettingsButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => WebViewPage())),
                  icon: Assets.images.termsOfUse.svg(),
                  label: 'Terms of use',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: SettingsButton(
                  icon: Assets.images.support.svg(),
                  label: 'Support',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: SettingsButton(
                  icon: Assets.images.rateApp.svg(),
                  label: 'Rate app',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}