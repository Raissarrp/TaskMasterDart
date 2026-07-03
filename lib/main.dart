import 'package:flutter/material.dart';

import 'theme/app_theme.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/stat_card.dart';
import 'widgets/task_card.dart';

void main() {
  runApp(const TaskMaster());
}

class TaskMaster extends StatelessWidget {
  const TaskMaster({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 50),

              const CustomAppBar(name: "Rai"),

              const SizedBox(height: 30),

              const TaskCard(
                title: "Landing Page",
                subtitle: "Criar layout do aplicativo",
              ),

              const SizedBox(height: 30),

              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: const [
                    StatCard(
                      title: "Concluídas",
                      value: "29",
                      color: Colors.green,
                      icon: Icons.check,
                    ),
                    StatCard(
                      title: "Pendentes",
                      value: "32",
                      color: Colors.orange,
                      icon: Icons.schedule,
                    ),
                    StatCard(
                      title: "Hoje",
                      value: "6",
                      color: Colors.blue,
                      icon: Icons.today,
                    ),
                    StatCard(
                      title: "Projetos",
                      value: "38",
                      color: Colors.purple,
                      icon: Icons.folder,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}