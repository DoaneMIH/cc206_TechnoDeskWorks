import 'package:flutter/material.dart';

class NotificationTechno extends StatefulWidget {
  const NotificationTechno({super.key});

  @override
  State<NotificationTechno> createState() => _NotificationState();
}

class _NotificationState extends State<NotificationTechno> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Notification"));
  }
}