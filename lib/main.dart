import 'package:flutter/material.dart';
import 'config/app_router.dart';
import 'config/app_routes.dart';
import 'state/quiz_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AsahOtakApp());
}

class AsahOtakApp extends StatelessWidget {
  const AsahOtakApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuizState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AsahOtak',
        theme: ThemeData(
          fontFamily: 'Baloo2',
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2D7A7A)),
        ),
        initialRoute: AppRoutes.welcome,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
