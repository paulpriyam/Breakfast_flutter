import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel(
      {required this.name, required this.iconPath, required this.boxColor});

  static List<CategoryModel> getCategoryList() {
    List<CategoryModel> list = [];
    list.add(CategoryModel(
        name: "salmon",
        iconPath: "assets/icons/salmon-nigiri.svg",
        boxColor: Colors.green.withOpacity(0.11)));

    list.add(CategoryModel(
        name: "pie",
        iconPath: "assets/icons/pie.svg",
        boxColor: Colors.blue.withOpacity(0.11)));

    list.add(CategoryModel(
        name: "plate",
        iconPath: "assets/icons/plate.svg",
        boxColor: Colors.green.withOpacity(0.11)));

    list.add(CategoryModel(
        name: "pancake",
        iconPath: "assets/icons/pancakes.svg",
        boxColor: Colors.blue.withOpacity(0.11)));
    return list;
  }
}
