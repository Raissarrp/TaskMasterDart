import 'package:flutter/material.dart';

import '../../widgets/custom_bottom_navigation.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/purple_button.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({super.key});

  void _navigate(BuildContext context, int index) {
    const routes = ['/home', '/calendar', '/new-task', '/focus'];
    if (index == 2) return;
    Navigator.pushReplacementNamed(context, routes[index]);
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
            const CustomTextField(hint: 'Titulo', icon: Icons.text_fields), 
            const SizedBox(height: 10),
            const CustomTextField(hint: 'Categoria', icon: Icons.category_outlined),
            const SizedBox(height: 10),
            const CustomTextField(hint: 'Data', icon: Icons.calendar_month_outlined),
            const SizedBox(height: 10),
            const CustomTextField(hint: 'Horario', icon: Icons.access_time),
            const SizedBox(height: 10),
            TextField(
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: 'Descricao',
                alignLabelWithHint: true,
              ),
            ),
            const SizedBox(height: 18),
            PurpleButton(text: 'Adicionar', onPressed: () {}),
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
