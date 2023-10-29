import 'package:fitness/constants/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/diet_model.dart';

class DietDatabase {
  List<DietModel> newDiet = [];

  final box = Hive.box<DietModel>(Constants.HIVE_BOX);

  void addDietdata(DietModel data) async {
    await box.add(data);
  }

  void getAllDietData() {
    newDiet.clear();
    var list = box.values.toList().cast<DietModel>();
    newDiet.addAll(list);
  }

  DietModel? getDietDataAtIndex(int index) {
    var box = Hive.box<DietModel>(Constants.HIVE_BOX);
    return box.getAt(index);
  }

  Future<void> deleteDietAtIndex(int index) async {
    var box = Hive.box<DietModel>(Constants.HIVE_BOX);
    await box.deleteAt(index);
  }

  Future<void> updateDietAtIndex(int index, DietModel dietModel) async {
    var box = Hive.box<DietModel>(Constants.HIVE_BOX);
    await box.putAt(index, dietModel);
  }
}
