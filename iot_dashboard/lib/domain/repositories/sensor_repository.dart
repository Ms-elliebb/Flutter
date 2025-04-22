import 'package:iot_dashboard/domain/entities/sensor_data.dart';

/// Sensör verilerine erişim için arayüz tanımlar.
///
/// Bu soyut sınıf, veri katmanındaki somut implementasyonlar için bir sözleşme görevi görür.
abstract class SensorRepository {
  /// Anlık sensör verilerini içeren bir [Stream] döndürür.
  ///
  /// Stream, yeni veri geldiğinde güncellenir.
  Stream<SensorData> getSensorDataStream();
}
