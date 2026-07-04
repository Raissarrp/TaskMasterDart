import '../models/task.dart';

final List<Task> fakeTasks = [
  Task(
    id: '1',
    title: 'Estudar Flutter',
    description: 'Revisar widgets e gerenciamento de estado.',
    category: 'Trabalho',
    dueDate: DateTime(2026, 9, 2, 9, 0),
  ),
  Task(
    id: '2',
    title: 'Treino de foco',
    description: 'Sessao de 25 minutos de concentracao.',
    category: 'Pessoal',
    dueDate: DateTime(2026, 9, 3, 11, 0),
  ),
  Task(
    id: '3',
    title: 'Organizar semana',
    description: 'Planejar atividades no calendario.',
    category: 'Planejamento',
    dueDate: DateTime(2026, 9, 4, 14, 0),
    isCompleted: true,
  ),
];
