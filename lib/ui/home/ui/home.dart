import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:x_wet/gen/assets.gen.dart';
import 'package:x_wet/models/user_data/user.dart';
import 'package:x_wet/uikit/1x_wet_label.dart';
import 'package:x_wet/uikit/raw_bottomsheet.dart';
import 'package:x_wet/uikit/raw_infofield.dart';
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
  final sexData = ['Male', 'Female'];
  final ageData = List.generate(88, (index) => '${index+12}');
  final weightData = List.generate(196, (index) => '${index+25}');
  final heightData = List.generate(96, (index) => '${index+125}');
  String sex = '';
  String age = '';
  String weight = '';
  String height = '';
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
    loadHive().then((value) => setState(() {}));
    return FutureBuilder(
        future: loadHive(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              extendBodyBehindAppBar: true,
              extendBody: true,
              body: Container(
                decoration: const BoxDecoration(color: Color(0xFF243A6B)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    XWetLabel(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 40.h),
                      child: Assets.images.watercup.svg(),
                    ),
                    RawInfoField(
                        onPressed: () => showModalBottomSheet(
                          isDismissible: false,
                            context: context,
                            builder: (_) => RawBottomSheet(
                                  label: 'Sex',
                                  data: sexData,
                                  onSelectedItemChanged: (int) => setState(() {
                                    sex = sexData[int];
                                  }), onOk: ()=>Navigator.pop(context),
                              onCancel: (){
                                Navigator.pop(context);
                                    setState(() {
                                      sex='';
                                    });
                              },
                                )),
                        label: 'Sex',
                        value: sex),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: RawInfoField(
                          onPressed: () => showModalBottomSheet(
                              isDismissible: false,
                              context: context,
                              builder: (_) => RawBottomSheet(
                                label: 'Age',
                                data: ageData,
                                onSelectedItemChanged: (int) => setState(() {
                                  age = ageData[int];
                                }), onOk: ()=>Navigator.pop(context),
                                onCancel: (){
                                  Navigator.pop(context);
                                  setState(() {
                                    age='';
                                  });
                                },
                              )),
                          label: 'Age',
                          value: age),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: RawInfoField(
                          onPressed: () => showModalBottomSheet(
                              isDismissible: false,
                              context: context,
                              builder: (_) => RawBottomSheet(
                                label: 'Height',
                                data: heightData,
                                onSelectedItemChanged: (int) => setState(() {
                                  height = heightData[int];
                                }), onOk: ()=>Navigator.pop(context),
                                onCancel: (){
                                  Navigator.pop(context);
                                  setState(() {
                                    height='';
                                  });
                                },
                              )),
                          label: 'Height',
                          value: height),
                    ),
                    RawInfoField(
                        onPressed: () => showModalBottomSheet(
                            isDismissible: false,
                            context: context,
                            builder: (_) => RawBottomSheet(
                              label: 'Weight',
                              data: weightData,
                              onSelectedItemChanged: (int) => setState(() {
                                weight = weightData[int];
                              }), onOk: ()=>Navigator.pop(context),
                              onCancel: (){
                                Navigator.pop(context);
                                setState(() {
                                  weight='';
                                });
                              },
                            )),
                        label: 'Weight',
                        value: weight),
                    SizedBox(height: 32.h,),
                    Visibility(
                      visible: age.isNotEmpty&&sex.isNotEmpty&&height.isNotEmpty&&weight.isNotEmpty,
                        child: InkWell(
                          onTap: () async {
                            final box = await Hive.openBox<UserData>('userdata');
                            box.put('userdata', UserData(
                              age: int.tryParse(age),
                              sex: sex,
                              height: int.tryParse(height),
                              weight: int.tryParse(weight)
                            ));
                          },
                      borderRadius: BorderRadius.circular(12.r),
                      child: Container(
                        width: 253.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: AppColors.aquaBlue,
                          borderRadius: BorderRadius.circular(12.r)
                        ),
                        child: Center(
                          child: Text('NEXT',style:TextStyle(
                            color: Colors.white,
                            fontFamily: 'MontMedium',
                            fontSize: 22.w,
                            fontWeight: FontWeight.w700,
                          )),
                        ),
                      ),
                    ))
                  ],
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
        builder: (BuildContext ctx) => OnBoardingScreen(),
      ),
    );
    //}
    // if(datad.attempts!>0)datad.attempts = (box.values.first.attempts!)-1;
    // await box.clear();
    // await box.put('limits', datad);
  }
}
