import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'; // BuildContext için eklendi
import 'package:provider/provider.dart';
import '../../data/models/quiz_model.dart';
import '../../data/models/question_model.dart';
import '../../data/models/user_progress_model.dart';
import '../../data/datasources/local/static_quiz_data.dart'; // Statik verilere erişim için
import 'user_progress_provider.dart'; // UserProgressProvider importu eklendi

enum QuizStatus { initial, loading, loaded, answering, correct, incorrect, completed }

class QuizProvider with ChangeNotifier {
  Quiz? _currentQuiz;
  int _currentQuestionIndex = 0;
  Map<String, int?> _userAnswers = {}; // Soru ID'si -> Seçilen cevap indeksi (null: cevaplanmadı)
  int _score = 0;
  QuizStatus _status = QuizStatus.initial;
  String? _selectedQuizId;

  Quiz? get currentQuiz => _currentQuiz;
  int get currentQuestionIndex => _currentQuestionIndex;
  Question? get currentQuestion {
    if (_currentQuiz != null && _currentQuestionIndex < _currentQuiz!.questions.length) {
      return _currentQuiz!.questions[_currentQuestionIndex];
    }
    return null;
  }
  Map<String, int?> get userAnswers => Map.unmodifiable(_userAnswers);
  int get score => _score;
  QuizStatus get status => _status;
  bool get isQuizCompleted => _status == QuizStatus.completed;
  int? get selectedAnswerForCurrentQuestion {
    final question = currentQuestion;
    if (question != null) {
      return _userAnswers[question.id];
    }
    return null;
  }

  // Quizi Yükleme
  Future<void> loadQuiz(String quizId) async {
    if (_selectedQuizId == quizId && _status != QuizStatus.initial) return; // Zaten yüklü veya yükleniyor

    _status = QuizStatus.loading;
    _selectedQuizId = quizId;
    notifyListeners();

    // Simüle edilmiş yükleme süresi
    await Future.delayed(const Duration(milliseconds: 500));

    _currentQuiz = StaticQuizData.getQuizById(quizId);
    if (_currentQuiz != null && _currentQuiz!.questions.isNotEmpty) {
      _resetQuizState();
      _status = QuizStatus.loaded;
    } else {
      _status = QuizStatus.initial; // Hata durumu eklenebilir
      _selectedQuizId = null;
      _currentQuiz = null;
    }
    notifyListeners();
  }

  // Cevap Verme
  void answerQuestion(BuildContext context, int selectedOptionIndex) {
    final question = currentQuestion;
    if (question == null || _status == QuizStatus.correct || _status == QuizStatus.incorrect) return;

    _userAnswers[question.id] = selectedOptionIndex;
    bool isCorrect = selectedOptionIndex == question.correctAnswerIndex;

    if (isCorrect) {
      _score += 10; // Örnek puanlama
      _status = QuizStatus.correct;
    } else {
      _status = QuizStatus.incorrect;
    }
    notifyListeners();

    // Kısa bir süre sonra sonraki adıma geç (animasyon vb. için)
    Future.delayed(const Duration(milliseconds: 1200), () {
      _moveToNextStep(context);
    });
  }

  // Sonraki Soru veya Bitirme
  void _moveToNextStep(BuildContext context) {
    if (_currentQuestionIndex < _currentQuiz!.questions.length - 1) {
      _currentQuestionIndex++;
      _status = QuizStatus.answering;
      notifyListeners();
    } else {
      _status = QuizStatus.completed;
      // Quiz bitince sonucu UserProgressProvider'a gönder ve kaydet
      final result = QuizResult(
        score: _score,
        // TODO: Doğru cevap sayısını hesapla
        correctAnswers: _userAnswers.entries.where((entry) {
            // Null check eklendi
            final question = _currentQuiz?.questions.firstWhere((q) => q.id == entry.key);
            return question != null && entry.value == question.correctAnswerIndex;
          }).length,
        totalQuestions: _currentQuiz!.questions.length,
        completedAt: DateTime.now(),
      );
      // UserProgressProvider'a erişip sonucu ekle (listen: false önemli)
      Provider.of<UserProgressProvider>(context, listen: false)
          .addCompletedQuiz(_currentQuiz!.id, result);
      notifyListeners(); // Status değiştiği için UI güncellenmeli
    }
  }

  // Quiz durumunu sıfırlama (tekrar oynamak için vb.)
  void resetQuiz() {
    _resetQuizState(); // Doğrudan durumu sıfırla
    notifyListeners(); // UI'ı güncelle
  }

  void _resetQuizState(){
     _currentQuestionIndex = 0;
     _userAnswers = {};
     _score = 0;
     _status = QuizStatus.answering; // Başlangıç durumu
  }
} 