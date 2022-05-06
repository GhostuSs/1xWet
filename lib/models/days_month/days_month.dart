
import 'package:hive/hive.dart';
import 'package:x_wet/models/day/day.dart';
part 'days_month.g.dart';

@HiveType(typeId: 8)
class WaterDaysInMonth extends HiveObject{
  WaterDaysInMonth({this.data});
  @HiveField(0)
  List<WaterDay>? data=[];
}