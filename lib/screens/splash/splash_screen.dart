import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../widgets/purple_button.dart';
import '../home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: AppColors.background,

      body: Stack(

        children: [

          /// Fundo

          Positioned.fill(

            child: Container(
              color: AppColors.background,
            ),

          ),

          SafeArea(

            child: Padding(

              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),

              child: Column(

                children: [

                  const Spacer(),

                  Image.asset(
                    "assets/images/splash.png",
                    height: 320,
                  ),

                  const SizedBox(height: 40),

                  const Text(

                    "Organize suas\n tarefas diárias!",

                    textAlign: TextAlign.center,

                    style: TextStyle(

                      fontSize: 34,

                      fontWeight: FontWeight.bold,

                    ),
                  ),

                  const SizedBox(height: 18),

                  const Text(

                    "Bem-vindo ao TaskMaster",

                    style: TextStyle(

                      fontSize: 18,

                      color: Colors.grey,

                    ),

                  ),

                  const SizedBox(height: 45),

                  PurpleButton(

                    text: "Começar",

                    onPressed: () {

                      Navigator.pushReplacement(

                        context,

                        MaterialPageRoute(

                          builder: (_) => const HomeScreen(),

                        ),

                      );

                    },

                  ),

                  const SizedBox(height: 50),

                ],

              ),

            ),

          ),

        ],

      ),

    );

  }

}