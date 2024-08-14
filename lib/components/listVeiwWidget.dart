import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter_app/model/task_data.dart';

class TaskListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Provider.of<TaskData>(context, listen: true).taskList.length,
        itemBuilder: (context, index) {
          return _ListTile(
            name: Provider.of<TaskData>(context).taskList[index].taskName,
            index: index,
          );
        });
  }
}

class _ListTile extends StatefulWidget {
  final String name;
  final int index;
  _ListTile({required this.name, required this.index});
  @override
  State<_ListTile> createState() => _ListTileState();
}

class _ListTileState extends State<_ListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        height: 60,
        width: double.infinity,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: ()=>Provider.of<TaskData>(context, listen: false)
                          .toggleCheckButton(widget.index) ,
                child:Container(
                margin: EdgeInsets.only(left: 15),
                width: 150,
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.name,
                  style: TextStyle(
                    decoration: Provider.of<TaskData>(context)
                            .taskList[widget.index]
                            .isdone
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                ),
              )),
              SizedBox(
                width: 120,
              ),
              CheckBoxWidget(
                  isChecked: Provider.of<TaskData>(context)
                      .taskList[widget.index]
                      .isdone,
                  onChangedCallback: (bool? value) =>
                      Provider.of<TaskData>(context, listen: false)
                          .toggleCheckButton(widget.index)),
              IconButton(
                  onPressed: () {
                    Provider.of<TaskData>(context, listen: false)
                        .deleteTask(widget.index);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        duration: Duration(seconds: 2),
                        content: Text('Task has been deleted')));
                  },
                  icon:
                      const Icon(Icons.delete, color: Colors.lightBlueAccent)),
            ]),
      ),
    );
  }
}

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({
    super.key,
    required this.isChecked,
    
    required this.onChangedCallback,
  });

  final bool isChecked;
  final Function(bool?) onChangedCallback;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: onChangedCallback,
    );
  }
}
