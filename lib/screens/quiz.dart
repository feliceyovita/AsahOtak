import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/quiz_state.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<QuizState>();
    if (state.category == null) {
      Future.microtask(() => Navigator.pushReplacementNamed(context, '/home'));
      return const SizedBox.shrink();
    }
    final q = state.questions[state.index];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('${state.category} · Soal ${state.index + 1} dari ${state.questions.length}',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            LinearProgressIndicator(value: (state.index + 1) / state.questions.length, minHeight: 10),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Align(alignment: Alignment.centerLeft,
                  child: Text(q.text, style: Theme.of(context).textTheme.titleLarge)),
            ),
            const SizedBox(height: 12),
            ...List.generate(q.options.length, (i) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: ElevatedButton(
                onPressed: () {
                  state.answer(i);
                  final hasNext = state.next();
                  if (!hasNext) Navigator.pushReplacementNamed(context, '/result');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(14),
                  alignment: Alignment.centerLeft,
                ),
                child: Text(q.options[i]),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
