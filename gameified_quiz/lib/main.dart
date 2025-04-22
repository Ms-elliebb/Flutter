import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/navigation/app_router.dart';
import 'core/theme/app_theme.dart';
import 'presentation/providers/quiz_provider.dart';
import 'presentation/providers/user_progress_provider.dart'; // UserProgressProvider import edildi
// import 'presentation/providers/user_progress_provider.dart'; // Örnek provider

void main() {
  // TODO: Uygulama başlamadan önce yapılması gerekenler (Firebase init vb.)
  // SharedPreferences gibi asenkron işlemler main içinde başlatılabilir:
  // WidgetsFlutterBinding.ensureInitialized();
  // await SharedPreferences.getInstance(); // İsteğe bağlı ön yükleme

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Provider'ları uygulama genelinde kullanılabilir hale getirmek için MultiProvider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuizProvider()),
        ChangeNotifierProvider(create: (_) => UserProgressProvider()), // UserProgressProvider eklendi
        // TODO: Gerçek Provider'ları buraya ekleyin
        // ChangeNotifierProvider(create: (_) => UserProgressProvider()),
      ],
      child: MaterialApp.router(
        title: 'Gameified Quiz App', // Uygulama adı
        theme: AppTheme.lightTheme, // Açık temayı uygula
        // darkTheme: AppTheme.darkTheme, // İsteğe bağlı: Koyu tema
        // themeMode: ThemeMode.system, // Sistem temasına göre ayarla
        routerConfig: AppRouter.router, // GoRouter yapılandırmasını kullan
        debugShowCheckedModeBanner: false, // Debug banner'ını kaldır
      ),
    );
  }
}

// Varsayılan MyHomePage ve _MyHomePageState sınıfları kaldırıldı.
