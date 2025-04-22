import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart'; // Benzersiz kullanıcı ID'si için
import '../../data/models/user_progress_model.dart';
import '../../services/storage_service.dart';

class UserProgressProvider with ChangeNotifier {
  final StorageService _storageService = StorageService();
  UserProgress? _userProgress;
  bool _isLoading = false;
  static const String _defaultUserId = 'default_user'; // Veya daha iyi bir ID yöntemi

  UserProgress? get userProgress => _userProgress;
  bool get isLoading => _isLoading;

  UserProgressProvider() {
    // Provider oluşturulduğunda ilerlemeyi yükle
    loadProgress();
  }

  // Kayıtlı ilerlemeyi yükle
  Future<void> loadProgress() async {
    _isLoading = true;
    notifyListeners();

    _userProgress = await _storageService.loadUserProgress();

    // Eğer kayıtlı veri yoksa veya userId eksikse, yeni bir tane oluştur
    if (_userProgress == null) {
      // TODO: Daha sağlam bir userId yönetimi (örn: Firebase Auth veya Device ID)
      final userId = const Uuid().v4(); // Geçici olarak UUID kullan
      _userProgress = UserProgress(userId: userId);
      // Yeni oluşturulan boş ilerlemeyi kaydetmeyebiliriz, ilk quiz tamamlanınca kaydedilir.
    } else {
      // Eğer eski bir kayıtta userId yoksa (güncelleme senaryosu)
      if (_userProgress!.userId.isEmpty) {
         final userId = const Uuid().v4();
         _userProgress = UserProgress(
            userId: userId,
            completedQuizzes: _userProgress!.completedQuizzes,
            totalScore: _userProgress!.totalScore,
         );
         // Güncellenmiş halini kaydet
         await _storageService.saveUserProgress(_userProgress!);
      }
    }


    _isLoading = false;
    notifyListeners();
  }

  // Quiz sonucunu ilerlemeye ekle ve kaydet
  Future<void> addCompletedQuiz(String quizId, QuizResult result) async {
    if (_userProgress == null) {
      // Eğer bir şekilde userProgress null ise, tekrar yüklemeyi dene veya hata ver
      await loadProgress();
      if(_userProgress == null) {
         print("Hata: UserProgress null olduğu için quiz sonucu eklenemedi.");
         return;
      }
    }

    // Mevcut ilerlemeyi güncelle
    _userProgress = _userProgress!.addQuizResult(quizId, result);

    // Güncellenmiş ilerlemeyi kaydet
    await _storageService.saveUserProgress(_userProgress!); 

    notifyListeners(); // UI'ı güncelle
  }

  // Tüm ilerlemeyi sıfırla (opsiyonel)
  Future<void> resetProgress() async {
     _isLoading = true;
     notifyListeners();
     await _storageService.clearUserProgress();
     // Sıfırlanmış yeni bir ilerleme oluştur
     final userId = _userProgress?.userId ?? const Uuid().v4(); // Mevcut ID'yi koru veya yeni oluştur
     _userProgress = UserProgress(userId: userId);
     _isLoading = false;
     notifyListeners();
  }
} 