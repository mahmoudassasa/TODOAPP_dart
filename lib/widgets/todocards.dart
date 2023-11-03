// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class ToDoCard extends StatelessWidget {
  final bool doneORnot; //حالة التاسك
  final String vartitle; //اسم التاسك
  final Function
      changeStu; // تغيير حالة التاسك و ارجاع وتكرار التاسك لعمل سكرول
  final int index; //لارجاع كل تاسك  برقمة غن طريق الليست وهي تمثل الانديكس
  final Function removeTasks;

  const ToDoCard({
    super.key,
    required this.vartitle, //اسم التاسك
    required this.doneORnot, //حالة التاسك
    required this.changeStu, //تكرار التاسك لعمل سكرول
    required this.index, //لارجاع كل تاسك  برقمة غن طريق الليست وهي تمثل الانديكس
    required this.removeTasks,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeStu(index); //تغيير حالة التاسك و ارجاع وتكرار التاسك لعمل سكرول
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: SizedBox(
          child: Container(
            // width: 333,
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: const Color.fromRGBO(209, 224, 224, 0.2),
            ),
            // color: Color.fromRGBO(209, 224, 224, 0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(vartitle,
                    style:TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color:doneORnot ? Colors.green : Colors.white,

                      decoration: doneORnot ? TextDecoration.lineThrough : TextDecoration.none ,
                      
                      
                    )),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      // Icons.done,
                      // Icons.close,
                      //Icons.check
                      // condition ? If-True : If-False
                      doneORnot ? Icons.check : Icons.close,
                      // condition ? If-True : If-False
                      color: doneORnot ? Colors.green : Colors.red,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                        onPressed: () {
                          removeTasks(index);
                        },
                        icon: const Icon(
                          Icons.delete_sharp,
                          size: 30,
                          color: Colors.red,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
