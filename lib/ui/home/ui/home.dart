import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import '../../../main.dart';
import '../../../utils/color_palette/colors.dart';
import '../../onboarding/ui/onboarding.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Iterable<HiveResult> results = [];
  // LimitsHive limits = LimitsHive();
  List<String> labels = ['','quick', 'easy','normal','hard','expert'];
  Future<bool> loadHive() async {
    // final box = await Hive.openBox<LimitsHive>('limits');
    // if(box.isEmpty==true) box.put('limits', LimitsHive(timeToUpdate: DateTime.now(),attempts: 5));
    // limits = box.values.first;
    // await Hive.openBox<HiveResult>('results')
    //     .then((value) => results = value.values);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    var data = '';
    loadHive().then((value) => setState((){}));
    return FutureBuilder(
        future: loadHive(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              extendBodyBehindAppBar: true,
              extendBody: true,
              body: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF041B47),
                      Color(0xFF031434),
                    ],
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Divider(
                        color: AppColors.white.withOpacity(0.3),
                      ),
                      if(!premium)Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: Row(mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40.r),
                                  border: Border.all(color: AppColors.red,width: 2.2)
                              ),
                              child: Center(child:Icon(Icons.clear_rounded,color: AppColors.red,)),
                            ),
                            SizedBox(width: 18.w,),
                          ],),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.lightBlue,
                    AppColors.lightBlue,
                  ],
                ),
              ),
            );
          }
        });
  }

  Future<void> _onTap(int index, dynamic data) async {
    //final box = await Hive.openBox<LimitsHive>('limits');
    //final datad = box.values.first;
    // if(datad.timeToUpdate!.difference(DateTime.now()).inHours>23){
    //   datad.timeToUpdate=DateTime.now();
    //   datad.attempts=5;
    // }
    final listMapAll = jsonDecode(data);
    // List<Quiz> quiz = [];
    // for (int i = 0; i < listMapAll[index - 1][index.toString()].length; i++)
    //   quiz.add(Quiz.fromJson(listMapAll[index - 1][index.toString()][i]));
    // if(premium==true || ((datad.attempts!) > 0))
    // {Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (BuildContext ctx) =>
    //         QuizScreen(quiz: quiz, indexOfQuiz: index),
    //   ),
    // );}
    //else{
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext ctx) =>
              OnBoardingScreen(),
        ),
      );
    //}
    // if(datad.attempts!>0)datad.attempts = (box.values.first.attempts!)-1;
    // await box.clear();
    // await box.put('limits', datad);
  }
}