import 'package:data_pass_concept/Constant/constancolor.dart';
import 'package:data_pass_concept/model/todomodelclass.dart';
import 'package:data_pass_concept/widget/listTodo.dart';
import 'package:flutter/material.dart';

class Todo1 extends StatefulWidget {
  Todo1({super.key});

  @override
  State<Todo1> createState() => _Todo1State();
}

class _Todo1State extends State<Todo1> {
  final todoslist = Todo.todolist();
  Todo? _selectedTodo;

  List<Todo> _foundToDo = [];

  @override
  void initState() {
    _foundToDo = todoslist;

    super.initState();
  }

  final _toController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tdBGcolor,
        appBar: _biuldapb(),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  searcbox(),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 40, bottom: 40),
                          child: const Text(
                            'All Todos',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        for (Todo todo in _foundToDo)
                          Todolist(
                            onEditngItem: () {
                              _editing(todo);
                            },
                            todo: todo,
                            onToDoChange: _handleTodoChange,
                            onDeleteItem: _deleteToDoItem,
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(
                        bottom: 20,
                        right: 20,
                        left: 20,
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 10.0,
                              spreadRadius: 0.0),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _toController,
                        decoration: const InputDecoration(
                            hintText: 'Add a new todo item',
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20, right: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_selectedTodo != null) {
                          int index = todoslist.indexWhere(
                              (element) => element.id == _selectedTodo!.id);
                          _selectedTodo!.todotext = _toController.text;
                          todoslist[index] = _selectedTodo!;
                          setState(() {
                            _toController.text = "";
                            _selectedTodo = null;
                          });
                        } else {
                          _addToDoItem(_toController.text);
                        }
                      },
                      child: Text(
                        '+',
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: tdBlue,
                        minimumSize: Size(60, 60),
                        elevation: 10,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  void _handleTodoChange(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todoslist.removeWhere((item) => item.id == id);
    });
  }

  void _editing(Todo edit) {
    _toController.text = edit.todotext;
    setState(() {
      _selectedTodo = edit;
    });
  }

  void _addToDoItem(String todo) {
    setState(() {
      todoslist.insert(
          0,
          Todo(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              todotext: todo));
    });
    _toController.clear();
  }

  void _runfilter(String enteredKeyword) {
    List<Todo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todoslist;
    } else {
      results = todoslist
          .where((item) => item.todotext
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }

  Widget searcbox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        onChanged: (value) => _runfilter(value),
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: tdBlack,
            ),
            prefixIconConstraints: BoxConstraints(maxHeight: 25, minHeight: 25),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(color: tdGrey)),
      ),
    );
  }

  AppBar _biuldapb() {
    return AppBar(
        elevation: 0,
        backgroundColor: tdBGcolor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: tdBlack,
            ),
            Container(
              child: CircleAvatar(
                child: Icon(Icons.person),
                radius: 15,
              ),
            )
          ],
        ));
  }
}
