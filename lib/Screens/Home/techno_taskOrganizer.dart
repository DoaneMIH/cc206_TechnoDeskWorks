import 'dart:convert';

import 'package:exercisce_unit4/Screens/Home/addtaskPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

class TaskOrganizer extends StatefulWidget {
  const TaskOrganizer({super.key});

  @override
  State<TaskOrganizer> createState() => _TaskOrganizerState();
}

class _TaskOrganizerState extends State<TaskOrganizer> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  

  // Event source - stores tasks mapped to dates
  Map<DateTime, List<Map<String, dynamic>>> events = {};

@override
  void initState() {
    super.initState();
    _loadTasks();
  }
  // Normalize the date to avoid time-related mismatches
  DateTime _normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  Future<void> _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? tasksJson = prefs.getString('tasks');
    if (tasksJson != null) {
      final decodedMap = jsonDecode(tasksJson);
      setState(() {
        events = (decodedMap as Map<String, dynamic>).map((key, value) {
          return MapEntry(DateTime.parse(key), List<Map<String, dynamic>>.from(value));
        });
      });
    }
  }

  Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedMap = jsonEncode(events.map((key, value) {
      return MapEntry(key.toIso8601String(), value);
    }));
    await prefs.setString('tasks', encodedMap);
  }

  // Fetch events for the selected day
  List<Map<String, dynamic>> _getEventsForDay(DateTime day) {
    final normalizedDay = DateTime(day.year, day.month, day.day);
    return events[normalizedDay] ?? [];
  }

  // Add a new task for a specific date
  void _addTask(DateTime date, String task) {
    final normalizedDate = _normalizeDate(date);
    setState(() {
      if (events[normalizedDate] != null) {
        events[normalizedDate]!.add({"task": task, "done": false});
      } else {
        events[normalizedDate] = [{"task": task, "done": false}];
      }
    });
    _saveTasks();
  }

  // Mark a task as done
  void _markTaskDone(DateTime date, int index) {
    setState(() {
      events[date]?[index]["done"] = !(events[date]?[index]["done"] ?? false);
    });
    _saveTasks();
  }

  // Delete a task
  void _deleteTask(DateTime date, int index) {
    setState(() {
      events[date]?.removeAt(index);
      if (events[date]?.isEmpty ?? true) {
        events.remove(date);
      }
    });
    _saveTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(207, 229, 251, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(253, 254, 255, 1),
        // title: const Text("Task Organizer"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(255, 255, 255, 1),
                  Color.fromRGBO(207, 229, 251, 1.0),
                ],
              ),
            ),  
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  "MONTH",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: 400,
                    decoration:BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.1), 
                          blurRadius: 4,
                          spreadRadius: 1,
                        )
                      ]
                    ),
                    child: TableCalendar(
                      focusedDay: _focusedDay,
                      firstDay: DateTime.utc(2024, 11, 18),
                      lastDay: DateTime.utc(2030, 12, 30),
                      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      },
                      calendarFormat: _calendarFormat,
                      onFormatChanged: (format) {
                        setState(() {
                          _calendarFormat = format;
                        });
                      },
                      eventLoader: (day) => _getEventsForDay(day),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    width: 400,
                    // color: Colors.amberAccent,
                    child: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        "UPCOMING TASKS",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
                // Display list of tasks for the selected day
                ..._getEventsForDay(_selectedDay).asMap().entries.map((entry) {
                  final index = entry.key;
                  final task = entry.value;

                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                      ),
                      height: 100,
                      width: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Task description
                            Expanded(
                              child: Text(
                                task["task"],
                                style: TextStyle(
                                  fontSize: 16,
                                  decoration: task["done"]
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                ),
                              ),
                            ),
                            // Check button
                            IconButton(
                              icon: Icon(
                                task["done"]
                                    ? Icons.check_circle
                                    : Icons.radio_button_unchecked,
                                color: task["done"] ? Colors.green : Colors.grey,
                              ),
                              onPressed: () => _markTaskDone(
                                  DateTime(_selectedDay.year, _selectedDay.month, _selectedDay.day), index),
                            ),
                            // Delete button
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () =>
                                  _deleteTask(DateTime(_selectedDay.year, _selectedDay.month, _selectedDay.day), index),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 80,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.1), 
                          blurRadius: 4,
                          spreadRadius: 0.50,
                        )
                      ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AddTaskPage(onTaskAdded: _addTask)));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text("Add New Task", 
                          style: TextStyle(fontSize: 25),),
                          Icon(Icons.add, size: 35,),
                        ],),
                      ),
                    )
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
