import 'package:fitness/constants/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/diet_model.dart';

class DietDatabase {
  List<DietModel> newDiet = [];

  final box = Hive.box(Constants.HIVE_BOX);

  void addDietdata(DietModel data) {
    box.add(data);
  }

  void getAllDietData() {
    newDiet.clear();
    var list = box.values.toList().cast<DietModel>().reversed.toList();
    newDiet.addAll(list);
  }
}
