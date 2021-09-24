import 'package:hive/hive.dart';

part 'user_adapter.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  String name = '';

  @HiveField(1)
  int age = 0;
}
