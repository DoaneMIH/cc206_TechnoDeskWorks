import 'package:flutter/material.dart';

class TaskOrganizer extends StatefulWidget {
  const TaskOrganizer({super.key});

  @override
  State<TaskOrganizer> createState() => _TaskOrganizerState();
}

class _TaskOrganizerState extends State<TaskOrganizer> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Task Organizer"));
  }
}