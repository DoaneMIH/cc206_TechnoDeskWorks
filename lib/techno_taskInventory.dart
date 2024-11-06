import 'package:flutter/material.dart';

class TaskInventory extends StatefulWidget {
  const TaskInventory({super.key});

  @override
  State<TaskInventory> createState() => _TaskInventoryState();
}

class _TaskInventoryState extends State<TaskInventory> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Task Inventory"));
  }
}