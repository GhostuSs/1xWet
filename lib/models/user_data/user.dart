
import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class UserData extends HiveObject{
  UserData({this.age,this.sex,this.height,this.weight});
  @HiveField(0)
  String? sex;
  @HiveField(1)
  int? age;
  @HiveField(2)
  int? height;
  @HiveField(3)
  int? weight;
  
}