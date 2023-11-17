import 'package:flutter/material.dart';
import 'package:flutter_fire_base_online/data/listTodo.dart';

void main() {
  runApp(const MaterialApp( home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _userToDo;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Список дел'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: listTodo.length,
        itemBuilder: (BuildContext context, int index){
          return  Dismissible(
            key: Key(listTodo[index]),
            child: Card(
              child: ListTile(
                title: Text(listTodo[index]),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.delete_sweep,
                    color: Colors.red,
                  ), onPressed: () {
                  setState(() {
                    listTodo.removeAt(index);
                  });
                },
                ),
              ),
            ),
            onDismissed: (direction){
              if (direction == DismissDirection.endToStart) {
                setState(() {
                  listTodo.removeAt(index);
                });
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(
              title: const Text('Добавить элемент'),
              content: TextField(
                onChanged: (String value){
                  _userToDo = value;
                },
              ),
              actions: [
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      listTodo.add(_userToDo!);
                    });
                    Navigator.of(context).pop();
                  }, child: const Text('Добавить'),
                ),
              ],
            );
          });
        },
        child: const Icon(
          Icons.add_box,
          color: Colors.indigo,
        ),
      ),
    );
  }
}
