import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/task_store.dart';
import '../../models/task.dart';
import '../../widgets/custom_bottom_navigation.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/purple_button.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  final _titleController = TextEditingController();
  final _categoryController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  void _navigate(BuildContext context, int index) {
    const routes = ['/home', '/calendar', '/new-task', '/focus'];
    if (index == 2) return;
    Navigator.pushReplacementNamed(context, routes[index]);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _categoryController.dispose();
    _descriptionController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (date == null) return;

    setState(() {
      _selectedDate = date;
      _dateController.text = DateFormat('dd/MM/yyyy').format(date);
    });
  }

  Future<void> _pickTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? const TimeOfDay(hour: 9, minute: 0),
    );

    if (time == null) return;

    setState(() {
      _selectedTime = time;
      _timeController.text = time.format(context);
    });
  }

  void _saveTask() {
    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();
    final category = _categoryController.text.trim();

    if (title.isEmpty || description.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha titulo e descricao.')),
      );
      return;
    }

    final dueDate = _selectedDate == null
        ? null
        : DateTime(
            _selectedDate!.year,
            _selectedDate!.month,
            _selectedDate!.day,
            _selectedTime?.hour ?? 0,
            _selectedTime?.minute ?? 0,
          );

    TaskStore.instance.addTask(
      Task(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: title,
        description: description,
        category: category.isEmpty ? 'Tarefa' : category,
        dueDate: dueDate,
      ),
    );

    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova tarefa'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(
              hint: 'Titulo',
              icon: Icons.text_fields,
              controller: _titleController,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              hint: 'Categoria',
              icon: Icons.category_outlined,
              controller: _categoryController,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              hint: 'Data',
              icon: Icons.calendar_month_outlined,
              controller: _dateController,
              readOnly: true,
              onTap: _pickDate,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              hint: 'Horario',
              icon: Icons.access_time,
              controller: _timeController,
              readOnly: true,
              onTap: _pickTime,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _descriptionController,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: 'Descricao',
                alignLabelWithHint: true,
              ),
            ),
            const SizedBox(height: 18),
            PurpleButton(text: 'Adicionar', onPressed: _saveTask),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: 2,
        onTap: (index) => _navigate(context, index),
      ),
    );
  }
}
