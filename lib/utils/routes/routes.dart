import 'package:flutter/material.dart';
import 'package:x_wet/ui/onboarding/ui/onboarding.dart';

import '../../ui/main_screen.dart';

abstract class MainNavigationRoutes {
  static const String main = '/';
  static const String onboarding = '/onboarding';
}

final routes = {
  MainNavigationRoutes.main: (BuildContext context) => MainScreen(),
  MainNavigationRoutes.onboarding: (BuildContext context) =>
  const OnBoardingScreen(),
};