import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  TextEditingController _textEditingController = TextEditingController();
  List<String> tarefas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
            ),
            Container(
              height: 400,
              child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(tarefas[index]),
                      onLongPress: () {
                        setState(() {
                          tarefas.removeAt(index);
                        });
                      },
                    );
                  },
                  itemCount: tarefas.length),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              if (_textEditingController.text.length > 0) {
                setState(() {
                  tarefas.add(_textEditingController.text);
                });
                _textEditingController.clear();
              }
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () {
                setState(() {
                  tarefas.clear();
                });
                _textEditingController.clear();
              },
              child: Icon(Icons.remove)),
        ],
      ),
    );
  }
}
