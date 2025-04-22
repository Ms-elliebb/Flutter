import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/screens/welcome_screen.dart'; // WelcomeScreen import edildi
import '../../presentation/screens/topic_selection_screen.dart'; // TopicSelectionScreen import edildi
import '../../presentation/screens/quiz_screen.dart'; // QuizScreen import edildi
import '../../presentation/screens/results_screen.dart'; // ResultsScreen import edildi
import '../../presentation/screens/profile_screen.dart'; // ProfileScreen import edildi
import '../../presentation/screens/settings_screen.dart'; // SettingsScreen import edildi
// import '../../presentation/screens/topic_selection_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/', // Başlangıç rotası
    routes: <RouteBase>[
      GoRoute(
        path: '/', // Ana yol
        pageBuilder: (context, state) => _buildPageWithFadeTransition(
          context: context,
          state: state,
          child: const WelcomeScreen(),
        ),
        routes: <RouteBase>[
          GoRoute(
            path: 'topics', // Artık WelcomeScreen'in alt rotası değil, ana rota
            pageBuilder: (context, state) => _buildPageWithFadeTransition(
              context: context,
              state: state,
              child: const TopicSelectionScreen(), // TopicSelectionScreen bağlandı
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/quiz/:quizId', // Quiz ekranı rotası (dinamik ID ile)
        pageBuilder: (BuildContext context, GoRouterState state) {
          final quizId = state.pathParameters['quizId'];
          // quizId null ise veya boşsa hata yönetimi yapılabilir
          if (quizId == null || quizId.isEmpty) {
            // Hata ekranına yönlendir veya varsayılan bir davranış sergile
            return _buildPageWithFadeTransition(
              context: context,
              state: state,
              child: const Scaffold(
                body: Center(child: Text('Geçersiz Quiz ID')),
              ),
            );
          }
          return _buildPageWithFadeTransition(
            context: context,
            state: state,
            child: QuizScreen(quizId: quizId), // QuizScreen bağlandı
          );
        },
      ),
      GoRoute(
        path: '/results',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _buildPageWithFadeTransition(
            context: context,
            state: state,
            child: const ResultsScreen(), // ResultsScreen bağlandı
          );
        },
      ),
       GoRoute(
        path: '/profile',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _buildPageWithFadeTransition(
            context: context,
            state: state,
            child: const ProfileScreen(), // ProfileScreen bağlandı
          );
        },
      ),
      GoRoute(
        path: '/settings',
        pageBuilder: (BuildContext context, GoRouterState state) {
           return _buildPageWithFadeTransition(
            context: context,
            state: state,
            child: const SettingsScreen(), // SettingsScreen bağlandı
          );
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold( // Temel bir hata ekranı
      appBar: AppBar(title: const Text('Hata')),
      body: Center(
         child: Text('Sayfa bulunamadı: ${state.error}'),
      ),
    ),
  );

  // Tekrarı önlemek için yardımcı fonksiyon
  static CustomTransitionPage _buildPageWithFadeTransition<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Basit bir fade geçişi
        return FadeTransition(opacity: animation, child: child);
      },
      transitionDuration: const Duration(milliseconds: 300), // Geçiş süresi
    );
  }
} 