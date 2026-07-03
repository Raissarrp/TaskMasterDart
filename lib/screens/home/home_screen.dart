import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/stat_card.dart';
import '../../widgets/task_card.dart';
import '../../widgets/custom_bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(

        child: SingleChildScrollView(

          padding: const EdgeInsets.all(24),

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              const CustomAppBar(name: "Rai"),

              const SizedBox(height: 30),

              const TaskCard(
                title: "Landing Page",
                subtitle: "10:00 - 12:00",
              ),

              const SizedBox(height: 35),

              const Text(
                "Estatísticas",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),

                crossAxisCount: 2,

                crossAxisSpacing: 18,

                mainAxisSpacing: 18,

                childAspectRatio: 1.1,

                children: const [

                  StatCard(
                    title: "Concluídas",
                    value: "29",
                    color: Colors.green,
                    icon: Icons.check_circle,
                  ),

                  StatCard(
                    title: "Pendentes",
                    value: "32",
                    color: Colors.orange,
                    icon: Icons.access_time,
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
            ],
          ),
        ),
      ),

      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: currentIndex,
        onTap: (index) {

          setState(() {

            currentIndex = index;

          });

        },
      ),
    );
  }
}