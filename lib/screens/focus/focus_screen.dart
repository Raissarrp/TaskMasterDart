import 'dart:async';

import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../../widgets/custom_bottom_navigation.dart';
import '../../widgets/purple_button.dart';

class FocusScreen extends StatefulWidget {
  const FocusScreen({super.key});

  @override
  State<FocusScreen> createState() => _FocusScreenState();
}

class _FocusScreenState extends State<FocusScreen> {
  static const Duration _initialDuration = Duration(minutes: 25);
  Duration _remaining = _initialDuration;
  Timer? _timer;
  bool _isRunning = false;

  void _navigate(BuildContext context, int index) {
    const routes = ['/home', '/calendar', '/new-task', '/focus'];
    if (index == 3) return;
    Navigator.pushReplacementNamed(context, routes[index]);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() {
      _isRunning = true;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remaining.inSeconds <= 1) {
        timer.cancel();
        setState(() {
          _isRunning = false;
          _remaining = Duration.zero;
        });
        return;
      }

      setState(() {
        _remaining -= const Duration(seconds: 1);
      });
    });
  }

  void _pauseTimer() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
    });
  }

  void _toggleTimer() {
    if (_remaining == Duration.zero) {
      setState(() {
        _remaining = _initialDuration;
      });
    }

    if (_isRunning) {
      _pauseTimer();
    } else {
      _startTimer();
    }
  }

  String _formattedTime() {
    final minutes = _remaining.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = _remaining.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final buttonText = _remaining == Duration.zero
        ? 'Reiniciar'
        : _isRunning
            ? 'Pausar'
            : _remaining == _initialDuration
                ? 'Comecar'
                : 'Retomar';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Foco'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(18),
                ),
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    const Text('Hora do Foco ', style: AppTextStyles.body),
                    const Spacer(),
                    const Icon(Icons.timer_outlined, size: 72, color: AppColors.panelSoft),
                    const SizedBox(height: 12),
                    Text(
                      _formattedTime(),
                      style: const TextStyle(
                        fontSize: 44,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const Spacer(),
                    PurpleButton(text: buttonText, onPressed: _toggleTimer),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: 3,
        onTap: (index) => _navigate(context, index),
      ),
    );
  }
}
