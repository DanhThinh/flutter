import 'package:hive/hive.dart';
part 'history.g.dart';

@HiveType(typeId: 0)
class History{
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? time;
  @HiveField(2)
  final String? feel;
  History({this.name, this.time, this.feel});
}