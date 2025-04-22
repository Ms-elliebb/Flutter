import 'package:equatable/equatable.dart';

/// Sensör verilerini temsil eden sınıf.
///
/// [Equatable] kullanarak nesne karşılaştırmalarını kolaylaştırır.
class SensorData extends Equatable {
  /// Sıcaklık değeri.
  final double temperature;

  /// Nem değeri.
  final double humidity;

  /// Verinin alındığı zaman damgası.
  final DateTime timestamp;

  /// [SensorData] örneği oluşturur.
  const SensorData({
    required this.temperature,
    required this.humidity,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [temperature, humidity, timestamp];
}
