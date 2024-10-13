import 'package:flutter/material.dart';
import 'package:app_todolist/cadastro_page.dart';

import 'model/tarefa.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _listaTarefas = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: _listaTarefas.length,
        itemBuilder: (context, position) {
          return ListTile(
            title: Text(_listaTarefas[position].text),
            onTap: () {
              setState(() {
                _listaTarefas.removeAt(position);
              });
            },
          );
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            Tarefa novaTarefa = await Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CadastroPage()));
            setState(() {
              _listaTarefas.add(novaTarefa);
            });
          } catch (e) {
            print("Error: ${e.toString()}");
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
