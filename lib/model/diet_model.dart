import 'package:hive_flutter/hive_flutter.dart';

part 'diet_model.g.dart';

@HiveType(typeId: 1)
class DietModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String iconPath;
  @HiveField(2)
  String duration;
  @HiveField(3)
  String level;
  @HiveField(4)
  String calorie;
  @HiveField(5)
  bool isViewSelected;

  DietModel(
      {required this.name,
      required this.iconPath,
      required this.duration,
      required this.calorie,
      required this.level,
      required this.isViewSelected});

  static List<DietModel> getDietList() {
    List<DietModel> list = [];
    list.add(DietModel(
        name: "Honey Pancake",
        iconPath: "assets/icons/honey-pancakes.svg",
        duration: "30 min",
        calorie: "180Kcal",
        level: "Easy",
        isViewSelected: true));

    list.add(DietModel(
        name: "Blueberry Pancake",
        iconPath: "assets/icons/blueberry-pancake.svg",
        duration: "35 min",
        calorie: "280Kcal",
        level: "Medium",
        isViewSelected: false));

    list.add(DietModel(
        name: "Orange Snaks",
        iconPath: "assets/icons/orange-snacks.svg",
        duration: "10 min",
        calorie: "80Kcal",
        level: "Easy",
        isViewSelected: false));
    list.add(DietModel(
        name: "Salmon nigiri",
        iconPath: "assets/icons/salmon-nigiri.svg",
        duration: "50 min",
        calorie: "380Kcal",
        level: "Hard",
        isViewSelected: false));
    return list;
  }
}
