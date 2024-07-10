import 'package:hive/hive.dart';

class ToDoDataBase {
  List toDoList = [];
  final _myBox = Hive.box('mybox'); // Consistent box name

  void createInitalData() {
    toDoList = [
      ["Make Food", false],
      ["Do Exercise", false],
    ];
  }

  // Load data asynchronously
  Future<void> loadData() async {
    toDoList = _myBox.get("TODOLIST") ?? []; // Handle potential null value
  }

  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}