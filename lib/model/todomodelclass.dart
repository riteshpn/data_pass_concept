class Todo {
  String id;
  String todotext;
  bool isDone;

  Todo({required this.id, required this.todotext, this.isDone = false});

  static List<Todo> todolist() {
    return [
      Todo(id: '1', todotext: 'morning exercise', isDone: true),
      Todo(id: '02', todotext: 'flutter notes revise', isDone: true),
      Todo(id: '03', todotext: 'study set mangemangemnt', isDone: false),
      Todo(id: '04', todotext: 'chech emails', isDone: false),
      Todo(id: '05', todotext: 'Team Discussion', isDone: false),
      Todo(id: '06', todotext: 'Lunch with team mates', isDone: false),
    ];
  }
}
