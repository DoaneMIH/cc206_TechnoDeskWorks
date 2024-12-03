import 'package:flutter/material.dart';

class AddTaskPage extends StatefulWidget {
  final Function(DateTime, String) onTaskAdded; // Callback to send task back

  const AddTaskPage({super.key, required this.onTaskAdded});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _taskController = TextEditingController();
  DateTime _selectedDate = DateTime.now(); // Default selected date

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 255, 214, 148),
                    Color.fromARGB(255, 255, 222, 192)
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            title: const Text(
              'Add Task',
              style: TextStyle(
                //color: Color.fromRGBO(57, 105, 144, 1), 
                //fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Task Input
            TextField(
              controller: _taskController,
              decoration: const InputDecoration(
                labelText: "Task",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Date Picker
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Selected Date: ${_selectedDate.toLocal()}".split(' ')[0],
                  style: const TextStyle(fontSize: 16),
                ),
                TextButton(
                  onPressed: () async {
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    );
                    if (pickedDate != null && pickedDate != _selectedDate) {
                      setState(() {
                        _selectedDate = pickedDate;
                      });
                    }
                  },
                  child: const Text("Select Date"),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Add Task Button
            ElevatedButton(
              onPressed: () {
                if (_taskController.text.isNotEmpty) {
                  // Call callback to add task
                  widget.onTaskAdded(_selectedDate, _taskController.text);
                  Navigator.pop(context); // Return to Task Organizer
                }
              },
              child: const Text("Add Task"),
            ),
          ],
        ),
      ),
    );
  }
}
