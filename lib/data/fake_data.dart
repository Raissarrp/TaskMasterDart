import '../models/task.dart';

const List<Task> fakeTasks = [
  Task(
    id: '1',
    title: 'Estudar Flutter',
    description: 'Revisar widgets e gerenciamento de estado.',
  ),
  Task(
    id: '2',
    title: 'Treino de foco',
    description: 'Sessao de 25 minutos de concentracao.',
  ),
  Task(
    id: '3',
    title: 'Organizar semana',
    description: 'Planejar atividades no calendario.',
    isCompleted: true,
  ),
];
