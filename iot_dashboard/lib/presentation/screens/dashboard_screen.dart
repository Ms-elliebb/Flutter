import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iot_dashboard/core/constants/ui_constants.dart'; // Sabitleri import et
// AppTheme import'u renk sabitleri için gerekmiyorsa kaldırılabilir
// import 'package:iot_dashboard/core/theme/app_theme.dart'; // Temayı import et (renk sabitleri için)
import 'package:iot_dashboard/presentation/providers/dashboard_providers.dart';
import 'package:iot_dashboard/presentation/widgets/sensor_card.dart';
import 'package:iot_dashboard/presentation/widgets/sensor_chart.dart';

/// Ana kontrol paneli ekranı.
///
/// Sensör verilerini gösterir ve ilgili widget'ları içerir.
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  // Eşik değerini tanımla (örneğin, tablet genişliği)
  static const double wideLayoutThreshold = 600.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sensorDataAsync = ref.watch(sensorDataStreamProvider);
    final historicalData = ref.watch(historicalDataProvider);
    final colorScheme = Theme.of(context).colorScheme;
    // Koyu tema için varsayılan metin rengini alalım (grafik için)
    final defaultTextColor = Theme.of(context).textTheme.bodyMedium?.color ?? Colors.white;

    return Scaffold(
      appBar: AppBar(
        title: const Text('IoT Kontrol Paneli'),
        centerTitle: true, // Başlığı ortala
        elevation: 1.0, // Hafif bir gölge
        // Gradient'i flexibleSpace ile ekleyelim
        flexibleSpace: Container(
          decoration: BoxDecoration(
            // AppBar arkaplanı artık tema tarafından belirleniyor (_darkSurfaceColor)
            // Gradient'i şimdilik kaldıralım, tek renk daha iyi olabilir
            color: Theme.of(context).appBarTheme.backgroundColor,
            // gradient: LinearGradient(
            //   colors: [colorScheme.surface.withOpacity(0.9), colorScheme.surface],
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            // ),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Mevcut genişliğe göre sütun sayısını belirle
          final crossAxisCount = constraints.maxWidth < wideLayoutThreshold ? 1 : 2;
          // GridView için uygun padding ve aspect ratio ayarla
          final double padding = UiConstants.paddingMedium;
          final double aspectRatio = crossAxisCount == 1 ? 2.5 : 1.9; // Tek sütunda daha yüksek kartlar

          return sensorDataAsync.when(
            data: (sensorData) {
              // Başarılı veri durumunda GridView göster
              return GridView.count(
                padding: EdgeInsets.all(padding),
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: padding, // Yatay boşluk
                mainAxisSpacing: padding, // Dikey boşluk
                childAspectRatio: aspectRatio,
                children: <Widget>[
                  // Sıcaklık Kartı (Varsayılan ikon rengi - beyaz)
                  SensorCard(
                    iconData: Icons.thermostat,
                    title: 'Sıcaklık',
                    value: '${sensorData.temperature.toStringAsFixed(1)} °C',
                    // iconColor kaldırıldı
                  ),
                  // Nem Kartı (Varsayılan ikon rengi - beyaz)
                  SensorCard(
                    iconData: Icons.opacity,
                    title: 'Nem',
                    value: '${sensorData.humidity.toStringAsFixed(1)} %',
                    // iconColor kaldırıldı
                  ),
                  // Grafik (Beyaz çizgi)
                  if (historicalData.isNotEmpty)
                    SensorChart(
                      dataPoints: historicalData,
                      chartTitle: 'Sıcaklık Zaman Serisi',
                      // lineColor'ı tema varsayılan metin rengi yapalım
                      lineColor: defaultTextColor, 
                    ),
                  // Zaman bilgisi (Belki en alta ayrı bir widget olarak?)
                  // Şimdilik GridView'e eklemeyelim.
                ],
              );
            },
            loading: () {
              return const Center(child: CircularProgressIndicator());
            },
            error: (error, stackTrace) {
              print('Hata: $error');
              print(stackTrace);
              return Center(
                child: Padding(
                  padding: EdgeInsets.all(padding),
                  child: Text(
                    'Veri alınırken bir hata oluştu:\n$error',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: colorScheme.error,
                        ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
