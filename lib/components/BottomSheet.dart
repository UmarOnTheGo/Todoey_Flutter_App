// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter_app/model/task_data.dart';

  void showBottomSheetWidget(BuildContext context) {
    TextEditingController myTextController = TextEditingController();
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              width: double.infinity,
              height: 600,
              child: SafeArea(
                child: Column(
                  children: [
                    const Text('Add Task',
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.blue,
                            fontWeight: FontWeight.w300)),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      cursorColor: Colors.lightBlueAccent,
                      style: const TextStyle(color: Colors.lightBlueAccent),
                      controller: myTextController,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FloatingActionButton.extended(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        isExtended: true,
                        extendedPadding:
                            const EdgeInsets.only(left: 250, right: 250),
                        backgroundColor: Colors.lightBlueAccent,
                        onPressed: () {
                          if (myTextController.text.isNotEmpty) {
                            Provider.of<TaskData>(context, listen: false)
                                .addTask(myTextController.text);
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    duration: Duration(seconds: 3),
                                    content: Text('Task has been added')));
                          }
                        },
                        label: const Text('Add',
                            style: TextStyle(color: Colors.white)))
                  ],
                ),
              ));
        });
  }
