import 'package:fitness/constants/constants.dart';
import 'package:fitness/model/diet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DietWidget extends StatelessWidget {
  DietWidget(
      {super.key,
      required this.diet,
      required this.itemCount,
      required this.onIndexSelected});

  final List<DietModel> diet;
  final int itemCount;
  final void Function(int) onIndexSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints.loose(Size(double.maxFinite, itemCount * 110.0)),
      child: ListView.separated(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                onIndexSelected(index);
              },
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    color: index % 2 == 0
                        ? Colors.blue.withOpacity(0.11)
                        : Colors.green.withOpacity(0.11),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(diet[index].iconPath),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          diet[index].name,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "${diet[index].level} | ${diet[index].duration} | ${diet[index].calorie}",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(colors: [
                          diet[index].isViewSelected
                              ? Colors.transparent
                              : Colors.blue.withOpacity(0.2),
                          diet[index].isViewSelected
                              ? Colors.transparent
                              : Colors.blue.withOpacity(0.8)
                        ]),
                      ),
                      child:
                          const Center(child: Icon(Icons.keyboard_arrow_right)),
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: diet.length),
    );
  }
}
