import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/models/user_progress_model.dart';

class StorageService {
  static const String _userProgressKey = 'user_progress';

  // UserProgress verisini kaydet
  Future<bool> saveUserProgress(UserProgress progress) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = jsonEncode(progress.toJson()); // Modeli JSON string'e çevir
      return await prefs.setString(_userProgressKey, jsonString);
    } catch (e) {
      print('Hata: UserProgress kaydedilemedi - $e');
      return false;
    }
  }

  // UserProgress verisini yükle
  Future<UserProgress?> loadUserProgress() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString(_userProgressKey);
      if (jsonString != null) {
        final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>; // JSON string'i Map'e çevir
        return UserProgress.fromJson(jsonMap); // Map'ten modeli oluştur
      }
      return null; // Kayıtlı veri yok
    } catch (e) {
      print('Hata: UserProgress yüklenemedi - $e');
      return null;
    }
  }

  // Kayıtlı ilerlemeyi sil (opsiyonel)
  Future<bool> clearUserProgress() async {
     try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.remove(_userProgressKey);
     } catch (e) {
       print('Hata: UserProgress silinemedi - $e');
       return false;
     }
  }
} 