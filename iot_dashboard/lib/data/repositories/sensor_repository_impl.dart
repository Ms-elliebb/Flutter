import 'package:iot_dashboard/data/datasources/mock_sensor_data_source.dart';
import 'package:iot_dashboard/domain/entities/sensor_data.dart';
import 'package:iot_dashboard/domain/repositories/sensor_repository.dart';

/// [SensorRepository] arayüzünün somut implementasyonu.
///
/// Bu sınıf, sensör verilerini [MockSensorDataSource]'dan alır.
class SensorRepositoryImpl implements SensorRepository {
  final MockSensorDataSource _dataSource;

  /// [SensorRepositoryImpl] örneği oluşturur.
  ///
  /// Gerekli olan [MockSensorDataSource] bağımlılığını alır.
  SensorRepositoryImpl(this._dataSource);

  @override
  Stream<SensorData> getSensorDataStream() {
    // Veri kaynağından gelen stream'i doğrudan döndürür.
    // Gerçek bir senaryoda, burada veri modeli (DTO) entity'ye dönüştürülebilir.
    return _dataSource.getSensorDataStream();
  }
}
