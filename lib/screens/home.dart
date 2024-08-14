import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter_app/components/BottomSheet.dart';
import 'package:todoey_flutter_app/components/listVeiwWidget.dart';
import 'package:todoey_flutter_app/model/task_data.dart';
import 'package:todoey_flutter_app/screens/loginPage.dart';
import 'package:todoey_flutter_app/services/AuthFunctions.dart';

// ignore: camel_case_types
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(null),
        toolbarHeight: 40,
        backgroundColor: Colors.lightBlueAccent,
        actions: [
        IconButton(onPressed: (){
          SignOut();
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return LoginPage();
          }));
        }, icon: const Icon(Icons.logout_outlined))
      ],),
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      color: Colors.lightBlueAccent,
                      Icons.view_list_rounded,
                      size: 30,
                    ),
                  ),
                  const Text(
                    'Todoey',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${Provider.of<TaskData>(context, listen: true).taskList.length} tasks',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: TaskListView(), // Pass the updated list here
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'button',
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 50,
        ),
        onPressed: () {
          showBottomSheetWidget(context);
        },
      ),
    );
  }
}
