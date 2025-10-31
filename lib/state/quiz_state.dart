import 'package:flutter/foundation.dart';
import '../models/question.dart';
import '../data/question_data.dart';

class QuizState extends ChangeNotifier {
  String _username = '';
  String get username => _username;

  String? _category;
  String? get category => _category;

  int _index = 0;
  int get index => _index;

  int _score = 0;
  int get score => _score;

  List<Question> get questions => _category == null
      ? []
      : QuestionData.byCategory[_category] ?? [];

  void setUsername(String name) {
    _username = name.trim();
    notifyListeners();
  }

  void selectCategory(String c) {
    _category = c;
    _index = 0;
    _score = 0;
    notifyListeners();
  }

  void answer(int optionIndex) {
    if (questions[_index].correctIndex == optionIndex) _score++;
    notifyListeners();
  }

  bool next() {
    if (_index + 1 < questions.length) {
      _index++;
      notifyListeners();
      return true;
    }
    return false;
  }

  void resetAll() {
    _category = null;
    _index = 0;
    _score = 0;
    notifyListeners();
  }
}
