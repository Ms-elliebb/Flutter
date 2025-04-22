import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final colorScheme = Theme.of(context).colorScheme;
     final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayarlar'),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // TODO: Gerçek ayar seçenekleri ekle (örn: Tema Seçimi, Ses Efektleri)
            ListTile(
              leading: const Icon(Icons.palette_outlined),
              title: const Text('Tema'),
              subtitle: const Text('Açık / Koyu Mod (Yakında)'),
              onTap: () {
                // Tema değiştirme mantığı
              },
            ),
             ListTile(
              leading: const Icon(Icons.volume_up_outlined),
              title: const Text('Ses Efektleri'),
              trailing: Switch(
                value: true, // TODO: Gerçek değeri al
                onChanged: (value) {
                   // Ses ayarını değiştir
                },
              ),
            ),
             ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Hakkında'),
              onTap: () {
                // Hakkında sayfası veya dialog göster
              },
            ),
          ],
        ),
      ),
    );
  }
} 