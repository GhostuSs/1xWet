import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:x_wet/gen/assets.gen.dart';
import 'package:x_wet/models/user_data/user.dart';
import 'package:x_wet/ui/main_screen.dart';
import 'package:x_wet/uikit/1x_wet_label.dart';
import 'package:x_wet/uikit/raw_bottomsheet.dart';
import 'package:x_wet/uikit/raw_infofield.dart';
import '../../../utils/color_palette/colors.dart';

class FillDataScreen extends StatefulWidget {
  const FillDataScreen({Key? key}) : super(key: key);

  @override
  State<FillDataScreen> createState() => _FillDataScreenState();
}

class _FillDataScreenState extends State<FillDataScreen> {
  final sexData = ['Male', 'Female'];
  final ageData = List.generate(88, (index) => '${index + 12}');
  final weightData = List.generate(196, (index) => '${index + 25}');
  final heightData = List.generate(96, (index) => '${index + 125}');
  String sex = '';
  String age = '';
  String weight = '';
  String height = '';

  @override
  Widget build(BuildContext context) {
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
              padding: EdgeInsets.symmetric(vertical: 35.h),
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
                          }),
                          onOk: (){
                            setState(() {
                              if (sex == '') sex = sexData.first;
                            });
                            Navigator.pop(context);
                          },
                          onCancel: () {
                            Navigator.pop(context);
                            setState(() {
                              sex = '';
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
                            }),
                            onOk: (){
                              setState(() {
                                if (age == '') age = ageData.first;
                              });
                              Navigator.pop(context);
                            },
                            onCancel: () {
                              Navigator.pop(context);
                              setState(() {
                                age = '';
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
                            }),
                            onOk: () {
                              setState(() {
                                if (height == '') height = heightData.first;
                              });
                              Navigator.pop(context);
                            },
                            onCancel: () {
                              Navigator.pop(context);
                              setState(() {
                                height = '';
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
                          }),
                          onOk: (){
                            setState(() {
                              if (weight == '') weight = weightData.first;
                            });
                            Navigator.pop(context);
                          },
                          onCancel: () {
                            Navigator.pop(context);
                            setState(() {
                              weight = '';
                            });
                          },
                        )),
                label: 'Weight',
                value: weight),
            SizedBox(
              height: 32.h,
            ),
            Spacer(),
            Opacity(
              opacity: age.isNotEmpty &&
                      sex.isNotEmpty &&
                      height.isNotEmpty &&
                      weight.isNotEmpty
                  ? 1.0
                  : 0.3,
              child: Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: InkWell(
                  onTap: age.isNotEmpty &&
                      sex.isNotEmpty &&
                      height.isNotEmpty &&
                      weight.isNotEmpty
                      ? () async {
                    final box = await Hive.openBox<UserData>('userdata');
                    box.put(
                        'userdata',
                        UserData(
                            age: int.tryParse(age),
                            sex: sex,
                            height: int.tryParse(height),
                            weight: int.tryParse(weight)));
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => MainScreen()));
                  }
                      : null,
                  borderRadius: BorderRadius.circular(12.r),
                  child: Container(
                    width: 253.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        color: AppColors.aquaBlue,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Center(
                      child: Text('NEXT',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'MontMedium',
                            fontSize: 22.w,
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
