import 'package:fitness/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class AddNewTaskDialog extends StatelessWidget {
  final dishController;
  final levelController;
  final durationController;
  final calorieController;
  VoidCallback onSave;
  VoidCallback onCancel;
   AddNewTaskDialog(
      {super.key,
      required this.levelController,
      required this.calorieController,
      required this.dishController,
      required this.durationController,
      required this.onCancel,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        constraints: BoxConstraints.loose(Size(250, 350)),
        child: Column(
          children: [
            TextField(
              controller: dishController,
              decoration: const InputDecoration(
                  hintText: "Enter new dish", border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: levelController,
              decoration: const InputDecoration(
                  hintText: "Enter level", border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: durationController,
                decoration: const InputDecoration(
                    hintText: "Enter Duration", border: OutlineInputBorder())),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: calorieController,
                decoration:const InputDecoration(
                    hintText: "Enter Calorie", border: OutlineInputBorder())),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  text: "Save",
                  onPressed: onSave,
                ),
                const SizedBox(
                  width: 16,
                ),
                MyButton(text: "Cancel", onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
