import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_flutter/data/database.dart';
import 'package:todo_flutter/utilities/dialog_box.dart';
import 'package:todo_flutter/utilities/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Reference the Hive box (make sure the name matches main.dart)
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    super.initState();
    _loadInitialData(); // Load data asynchronously
  }

  // Load data and update UI
  Future<void> _loadInitialData() async {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitalData();
    } else {
      await db.loadData(); // Await data loading
    }
    setState(() {}); // Rebuild UI after data is loaded
  }

  // Text controller
  final _controller = TextEditingController();

  // Checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  // Save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  // Create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );},
    );
  }

  // Delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFbde0fe),
      appBar: AppBar(
        title: const Center(
          child: Text('TO DO'),
        ),
        backgroundColor: const Color(0xFFa2d2ff),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}