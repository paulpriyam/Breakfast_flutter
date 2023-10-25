import 'package:flutter/material.dart';

class FitnessItem extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  FitnessItem(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Checkbox(value: taskCompleted, onChanged: onChanged),
          Text(taskName)
        ],
      ),
    );
  }
}
