import 'package:fitness/constants/constants.dart';
import 'package:fitness/database/database.dart';
import 'package:fitness/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/diet_model.dart';

class AddNewTaskDialog extends StatefulWidget {
  final int? selectedIndex;
  final dishController;
  final levelController;
  final durationController;
  final calorieController;
  VoidCallback onSave;
  VoidCallback onCancel;
  VoidCallback onUpdate;
  AddNewTaskDialog(
      {super.key,
      required this.selectedIndex,
      required this.levelController,
      required this.calorieController,
      required this.dishController,
      required this.durationController,
      required this.onCancel,
      required this.onSave,
      required this.onUpdate});

  @override
  State<AddNewTaskDialog> createState() => _AddNewTaskDialogState();
}

class _AddNewTaskDialogState extends State<AddNewTaskDialog> {
  @override
  void initState() {
    if (widget.selectedIndex != null) {
      DietDatabase db = DietDatabase();
      var selectedDiet = db.getDietDataAtIndex(widget.selectedIndex!);
      widget.levelController.text = selectedDiet!.level;
      widget.calorieController.text = selectedDiet.calorie;
      widget.dishController.text = selectedDiet.name;
      widget.durationController.text = selectedDiet.duration;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        constraints: BoxConstraints.loose(Size(250, 350)),
        child: Column(
          children: [
            TextField(
              controller: widget.dishController,
              decoration: const InputDecoration(
                  hintText: "Enter new dish", border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: widget.levelController,
              decoration: const InputDecoration(
                  hintText: "Enter level", border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
                controller: widget.durationController,
                decoration: const InputDecoration(
                    hintText: "Enter Duration", border: OutlineInputBorder())),
            const SizedBox(
              height: 10,
            ),
            TextField(
                controller: widget.calorieController,
                decoration: const InputDecoration(
                    hintText: "Enter Calorie", border: OutlineInputBorder())),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                    text: widget.selectedIndex != null ? "Update" : "Save",
                    onPressed: widget.selectedIndex!=null? widget.onUpdate:widget.onSave),
                const SizedBox(
                  width: 16,
                ),
                MyButton(text: "Cancel", onPressed: widget.onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
