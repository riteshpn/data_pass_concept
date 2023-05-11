import 'package:data_pass_concept/Constant/constancolor.dart';
import 'package:data_pass_concept/model/todomodelclass.dart';
import 'package:flutter/material.dart';

class Todolist extends StatelessWidget {
  final Todo todo;
  final onToDoChange;
  final onDeleteItem;
  final onEditngItem;

  const Todolist(
      {super.key,
      required this.onEditngItem,
      required this.todo,
      required this.onToDoChange,
      required this.onDeleteItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToDoChange(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        title: Text(
          todo.todotext,
          style: TextStyle(
            fontSize: 16,
            color: tdBlack,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: SizedBox(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  onEditngItem();
                  // onDeleteItem(todo.id);
                },
              ),

              IconButton(
                color: Colors.red,
                icon: Icon(Icons.delete),
                onPressed: () {
                  onDeleteItem(todo.id);
                },
              )
              // Container(
              //   padding: EdgeInsets.all(0),
              //   margin: EdgeInsets.symmetric(vertical: 10),
              //   height: 35,
              //   width: 37,
              //   decoration: BoxDecoration(
              //       color: tdred, borderRadius: BorderRadius.circular(5)),
              //   child: IconButton(
              //     color: Colors.white,
              //     icon: Icon(Icons.delete),
              //     onPressed: () {
              //       onDeleteItem(todo.id);
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
