import 'package:api_app/VM/to_do_vm.dart';
import 'package:flutter/material.dart';

class ToDoView extends StatefulWidget {
  ToDoView({super.key});

  @override
  State<ToDoView> createState() => _ToDoViewState();
}

class _ToDoViewState extends State<ToDoView> {
  ToDoVm toDoVm = ToDoVm();

  @override
  void initState() {
    toDoVm.getToDos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("To Do List"),
          bottom: TabBar(tabs: [
            Text("Complated"),
            Text("Not Complated"),
            Text("All"),
          ]),
        ),
        body: FutureBuilder(
          future: toDoVm.getToDos(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return TabBarView(children: [
                ListView.builder(
                  itemCount: toDoVm.complateToDos.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        toDoVm.complateToDos[index].todo!,
                      ),
                      trailing: Text(
                        "${toDoVm.complateToDos[index].completed}",
                        style: TextStyle(color: Colors.green),
                      ),
                      leading: CircleAvatar(
                        child: FittedBox(
                          child: Text("${toDoVm.complateToDos[index].id}"),
                        ),
                      ),
                    );
                  },
                ),
                ListView.builder(
                  itemCount: toDoVm.notComplateToDo.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        toDoVm.notComplateToDo[index].todo!,
                      ),
                      trailing: Text(
                        "${toDoVm.notComplateToDo[index].completed}",
                        style: TextStyle(color: Colors.red),
                      ),
                      leading: CircleAvatar(
                        child: FittedBox(
                          child: Text("${toDoVm.notComplateToDo[index].id}"),
                        ),
                      ),
                    );
                  },
                ),
                ListView.builder(
                  itemCount: toDoVm.toDos.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        toDoVm.toDos[index].todo!,
                      ),
                      trailing: Text(
                        "${toDoVm.toDos[index].completed}",
                        style: TextStyle(
                            color: toDoVm.toDos[index].completed!
                                ? Colors.green
                                : Colors.red),
                      ),
                      leading: CircleAvatar(
                        child: FittedBox(
                          child: Text("${toDoVm.toDos[index].id}"),
                        ),
                      ),
                    );
                  },
                ),
              ]);
            } else
              return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
