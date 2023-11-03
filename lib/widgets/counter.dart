import 'package:flutter/material.dart';

// import '../main.dart';

class Counter extends StatelessWidget {
  const Counter({
    super.key,
    required this.aTasks,
    required this.cTask,
  });
  final int cTask; //عدد التاسكات المكتملة
  final int aTasks; //عدد التاسكات  

  @override
  Widget build(BuildContext context) {
    if (cTask == aTasks) {
     
    } else {
      Colors.red;
    }

    return Padding(
      padding: const EdgeInsets.only(top: 27),
      child: Text("$cTask/$aTasks",
          style:  TextStyle(
            fontSize: 44,
            fontWeight: FontWeight.bold,
            color : cTask == aTasks ? Colors.green : Colors.red,
          )),
    );
  }

  void setState(Null Function() param0) {}
}
