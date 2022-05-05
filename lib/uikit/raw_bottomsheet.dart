import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_wet/utils/color_palette/colors.dart';

class RawBottomSheet extends StatelessWidget {
  RawBottomSheet(
      {required this.label,
      required this.data,
      required this.onSelectedItemChanged,
      required this.onCancel, required this.onOk});

  final String label;
  List<String> data;
  final void Function(int) onSelectedItemChanged;
  final VoidCallback onCancel;
  final VoidCallback onOk;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightBlue,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: onCancel,
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 17.w,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        label,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.w,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: onOk,
                        child: Text(
                          'OK',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 17.w,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.black,
                thickness: 0.3,
              )
            ],
          ),
          Container(
            height: 215.h,
            child: CupertinoPicker(
                itemExtent: 55.h,
                onSelectedItemChanged: onSelectedItemChanged,
                selectionOverlay: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Divider(
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                children: [
                  for (var el in data)
                    Center(
                      child: Text(el),
                    )
                ]),
          )
        ],
      ),
    );
  }
}
