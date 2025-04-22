import 'package:flutter/material.dart';
import 'package:iot_dashboard/core/constants/ui_constants.dart';

/// Tek bir sensör verisini (ikon, başlık, değer) gösteren kart widget'ı.
class SensorCard extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String value;
  final Color? iconColor; // Belirli bir renk atanmak istenirse hala kullanılabilir

  /// [SensorCard] örneği oluşturur.
  const SensorCard({
    super.key,
    required this.iconData,
    required this.title,
    required this.value,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    // Card widget'ı tema tarafından zaten stilize ediliyor (AppTheme'da tanımlandı).
    // İsterseniz burada override edebilirsiniz.
    return Card(
      // elevation: 0, // Temadan gelen elevation'ı kullan
      // shape: ..., // Temadan gelen shape'i kullan
      child: Padding(
        // Sabitler kullanıldı
        padding: const EdgeInsets.all(UiConstants.paddingMedium),
        child: Row(
          children: [
            // Sensör İkonu
            Icon(
              iconData,
              size: UiConstants.iconSizeLarge, // Sabit kullanıldı
              color: iconColor ?? colorScheme.primary, // Belirtilmemişse tema birincil rengi
            ),
            const SizedBox(width: UiConstants.marginMedium), // Sabit kullanıldı
            // Başlık ve Değer
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center, // Dikeyde ortala
                children: [
                  Text(
                    title,
                    // Temadan gelen text stilini kullan (titleMedium)
                    style: textTheme.titleMedium,
                  ),
                  const SizedBox(height: UiConstants.paddingSmall / 2), // Daha az boşluk
                  Text(
                    value,
                    // Temadan gelen text stilini kullan (headlineSmall)
                    style: textTheme.headlineSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
