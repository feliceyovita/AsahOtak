import 'package:flutter/material.dart';
import '../models/question.dart';
import '../data/question_data.dart';

class QuizState extends ChangeNotifier {
  String _username = '';
  String? _category;
  int _index = 0;
  int _score = 0;

  String get username => _username;
  String? get category => _category;
  int get index => _index;
  int get score => _score;

  List<Question> get questions =>
      _category == null ? [] : (QuestionData.byCategory[_category] ?? []);

  void setUsername(String name) {
    _username = name.trim();
    notifyListeners();
  }

  // >>> ini yang bikin error hilang
  void setCategory(String cat) {
    _category = cat;
    _index = 0;
    _score = 0;
    notifyListeners();
  }

  void nextQuestion() {
    _index++;
    notifyListeners();
  }

  void addScore() {
    _score++;
    notifyListeners();
  }

  void resetAll() {
    _username = '';
    _category = null;
    _index = 0;
    _score = 0;
    notifyListeners();
  }
}
