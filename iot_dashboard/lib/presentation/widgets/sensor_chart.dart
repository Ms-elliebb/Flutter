import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:iot_dashboard/core/constants/ui_constants.dart';
import 'package:iot_dashboard/domain/entities/sensor_data.dart';
import 'package:intl/intl.dart';

/// Zaman içindeki sensör verilerini gösteren bir çizgi grafik widget'ı.
class SensorChart extends StatelessWidget {
  final List<SensorData> dataPoints;
  final Color? lineColor; // Tema rengini kullanmak için null olabilir
  final String chartTitle;

  /// [SensorChart] örneği oluşturur.
  const SensorChart({
    super.key,
    required this.dataPoints,
    this.lineColor,
    required this.chartTitle,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    // Tema birincil rengini veya belirtilen rengi kullan
    final finalLineColor = lineColor ?? colorScheme.primary;

    final spots = dataPoints.asMap().entries.map((entry) {
      final x = entry.value.timestamp.millisecondsSinceEpoch.toDouble();
      final y = entry.value.temperature;
      return FlSpot(x, y);
    }).toList();

    if (spots.length < 2) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(UiConstants.paddingMedium),
          child: Center(
            child: Text(
              '$chartTitle grafiği için yeterli veri yok.',
              style: textTheme.bodyMedium,
            ),
          ),
        ),
      );
    }

    final minX = spots.first.x;
    final maxX = spots.last.x;
    final temperatures = dataPoints.map((d) => d.temperature);
    // Y ekseni aralığını daha dinamik hale getirelim
    double minY = (temperatures.isEmpty ? 0 : temperatures.reduce(min)) - 2;
    double maxY = (temperatures.isEmpty ? 30 : temperatures.reduce(max)) + 2;
    if (maxY - minY < 4) maxY = minY + 4; // Çok dar aralıkları önle
    minY = minY.floorToDouble();
    maxY = maxY.ceilToDouble();

    return Card(
      child: Padding(
        padding: const EdgeInsets.only(
          top: UiConstants.paddingLarge,
          bottom: UiConstants.paddingMedium,
          right: UiConstants.paddingMedium,
          left: UiConstants.paddingSmall, // Sol eksen etiketleri için daha az boşluk
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: UiConstants.paddingMedium - UiConstants.paddingSmall), // Sol padding'i dengele
              child: Text(
                chartTitle,
                style: textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: UiConstants.marginLarge),
            Expanded(
              child: LineChart(
                LineChartData(
                  minX: minX,
                  maxX: maxX,
                  minY: minY,
                  maxY: maxY,
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: true,
                    horizontalInterval: (maxY - minY) / 4,
                    verticalInterval: (maxX - minX) / 5,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: colorScheme.onSurface.withOpacity(0.1),
                        strokeWidth: 1,
                      );
                    },
                    getDrawingVerticalLine: (value) {
                      return FlLine(
                        color: colorScheme.onSurface.withOpacity(0.1),
                        strokeWidth: 1,
                      );
                    },
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        interval: (maxX - minX) / 5,
                        getTitlesWidget: (value, meta) {
                          final dateTime = DateTime.fromMillisecondsSinceEpoch(value.toInt());
                          final timeString = DateFormat('HH:mm').format(dateTime);
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            space: UiConstants.paddingSmall,
                            child: Text(timeString, style: textTheme.bodySmall),
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        interval: (maxY - minY) / 4,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toStringAsFixed(0),
                            style: textTheme.bodySmall,
                            textAlign: TextAlign.right,
                          );
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                      color: colorScheme.onSurface.withOpacity(0.2),
                      width: 1
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: spots,
                      isCurved: true,
                      color: finalLineColor,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [
                            finalLineColor.withOpacity(0.3),
                            finalLineColor.withOpacity(0.0),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ],
                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipItems: (touchedSpots) {
                        return touchedSpots.map((spot) {
                          final dateTime = DateTime.fromMillisecondsSinceEpoch(spot.x.toInt());
                          final timeString = DateFormat('HH:mm:ss').format(dateTime);
                          return LineTooltipItem(
                            '${spot.y.toStringAsFixed(1)}°C',
                            TextStyle(color: colorScheme.onPrimary, fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: '\n$timeString',
                                style: TextStyle(color: colorScheme.onPrimary?.withOpacity(0.8), fontSize: 10),
                              ),
                            ],
                            textAlign: TextAlign.center,
                          );
                        }).toList();
                      },
                    ),
                    handleBuiltInTouches: true,
                  ),
                ),
                duration: const Duration(milliseconds: 250),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
