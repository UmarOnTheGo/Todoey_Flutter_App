import 'package:flutter/foundation.dart';
import 'package:todoey_flutter_app/model/task.dart';
import 'package:todoey_flutter_app/services/DatabaseFunction.dart';

class TaskData extends ChangeNotifier {
  DatabaseFunction db = DatabaseFunction();
  List<Task> taskList = [];
  void addTask(String TaskName) {
    taskList.add(Task(taskName: TaskName));
    notifyListeners();
    db.writeData(mapTaskListName(), mapTaskCondition());
  }

  void toggleCheckButton(int index) {
    taskList[index].toggleDoneStatus();
    notifyListeners();
    db.updateTaskCondition(mapTaskCondition());
  }

  void deleteTask(int index) {
    taskList.removeAt(index);
    notifyListeners();
    db.writeData(mapTaskListName(), mapTaskCondition());
  }

  Map<String, String> mapTaskListName() {
    Map<String, String> taskMap = {};
    for (int i = 0; i < taskList.length; i++) {
      taskMap['task_$i'] = taskList[i].taskName; // Use index as key
    }
    print(taskMap);
    return taskMap;
  }

  Map<String, bool> mapTaskCondition() {
    Map<String, bool> taskMap = {};
    for (int i = 0; i < taskList.length; i++) {
      taskMap['task_$i'] = taskList[i].isdone; // Use index as key
    }
    print(taskMap);
    return taskMap;
  }
}
