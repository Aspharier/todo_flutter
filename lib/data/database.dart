import 'package:hive/hive.dart';

class ToDoDataBase {
  List toDoList = [];
  // reference our box
  final _myBox = Hive.box('myBox');

  void createInitalData(){
    toDoList = [
      ["Make Food",false],
      ["Do Exercise",false],
    ];
  }
  // LOAD THE DATA FROM DATABASE
  void loadData(){
    toDoList = _myBox.get("TODOLIST");
  }

  // UPDATE THE DATABASE
  void updateDataBase(){
    _myBox.put("TODOLIST",toDoList);
  }

}