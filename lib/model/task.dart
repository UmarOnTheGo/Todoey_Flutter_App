class Task{
  final String taskName;
  bool isdone=false;
  Task(
    {required this.taskName});
  void toggleDoneStatus(){
    isdone=!isdone;
  }  
}