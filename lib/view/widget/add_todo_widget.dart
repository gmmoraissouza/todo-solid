import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_solid/controller/todos_controller.dart';

class AddTodoWidget extends StatefulWidget {
  const AddTodoWidget({Key? key}) : super(key: key);

  @override
  State<AddTodoWidget> createState() => _AddTodoWidgetState();
}

class _AddTodoWidgetState extends State<AddTodoWidget> {
  final _title = TextEditingController();
  static final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = context.read<TodosController>();
    return Container(
      height: 300,
      padding: const EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Nova tarefa',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const Divider(
                thickness: 1,
                height: 1,
              ),
              TextFormField(
                controller: _title,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(24),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  label: const Text('Titulo'),
                ),
                validator: (value) {
                  return (value!.isEmpty) ? "Informe o título!" : null;
                },
              ),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: FilledButton.tonalIcon(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await controller.createTodo(_title.text);
                      if (context.mounted) Navigator.pop(context);
                    }
                  },
                  icon: const Icon(Icons.check),
                  label: const Text('Salvar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
