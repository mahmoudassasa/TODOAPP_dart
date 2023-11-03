// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/counter.dart';
import 'package:to_do_app/widgets/todocards.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ToDoApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

//Class for Task (ToDoCard)
class Tasks {
  String title;
  bool status;
  Tasks({required this.title, required this.status});
}

class _ToDoAppState extends State<ToDoApp> {
//List Of To Do
  List allTasks = [
    Tasks(
      title: "Enter Task1",
      status: true,
    ),
    Tasks(
      title: "Enter Task2",
      status: false,
    ),
    Tasks(
      title: "Enter Task3",
      status: false,
    ),
  ];
//To change task complate or not complate
  changeStu(int tIndex) {
    setState(() {
      allTasks[tIndex].status = !allTasks[tIndex].status;
    });
  }

//To add new task
  addNewTask() {
    setState(() {
      allTasks.add(
        Tasks(
          title: myController.text,
          status: false,
        ),
      );
    });
  }

//To Delete All Tasks
  deletAll() {
    setState(() {
      allTasks.removeRange(0, allTasks.length);
    });
  }

// To Delete the Task when you click on the delete button
  removeTask(int removeTask) {
    setState(() {
      allTasks.remove(allTasks[removeTask]);
    });
  }

//to create controller to get the text inside the TextField
  final myController = TextEditingController();
//to calculate only complated task
  int calcCmpTask() {
    int compTasks = 0;
    allTasks.forEach((item) {
      if (item.status) {
        compTasks++;
      }
    });
    return compTasks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        title: const Text("TO DO APP",
            style: TextStyle(
              fontSize: 33,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  deletAll();
                  //Another code to delete AllTasks
                  // allTasks.clear();
                });
              },
              icon: const Icon(
                Icons.delete_sharp,
                size: 30,
                color: Colors.red,
              ))
        ],
        centerTitle: false,
        backgroundColor: const Color.fromRGBO(209, 224, 224, 0.2),
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            showDialog(
              // showModalBottomSheet( طريقة اخري
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11)),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    // height: double.infinity,
                    height: 200,
                    // color: Colors.amber[100],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: myController,
                          maxLength: 20,
                          decoration: const InputDecoration(
                              labelText: "Write Your Task"),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        TextButton(
                            onPressed: () {
                              addNewTask();
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "ADD",
                              style: TextStyle(fontSize: 22),
                            ))
                      ],
                    ),
                  ),
                );
              },
              // isScrollControlled: true,  showModalBottomSheet في حالة
            );
          },
          child: const Icon(Icons.add)),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Counter(cTask: calcCmpTask(), aTasks: allTasks.length),
            // ToDoCard(),
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 600,
              child: ListView.builder(
                  itemCount: allTasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    //I will all these information when I create ToDoCard() widget in file "todocards.dart"
                    return ToDoCard(
                      vartitle: allTasks[index].title,
                      doneORnot: allTasks[index].status,
                      changeStu: changeStu,
                      index:index
                          , //الأنديكس = 0 ثم 1 ثم  ..... يمثل الانديكس عدد العناصر في الليست  والتي تبدا العد من 0
                      removeTasks: removeTask,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
