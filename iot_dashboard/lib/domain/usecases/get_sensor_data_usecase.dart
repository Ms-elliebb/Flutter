import 'package:iot_dashboard/domain/entities/sensor_data.dart';
import 'package:iot_dashboard/domain/repositories/sensor_repository.dart';

/// Sensör veri akışını almak için use case.
///
/// Bu sınıf, presentation katmanının veri erişim detaylarından soyutlanmasını sağlar.
class GetSensorDataUseCase {
  final SensorRepository _repository;

  /// [GetSensorDataUseCase] örneği oluşturur.
  ///
  /// Gerekli olan [SensorRepository] bağımlılığını alır.
  GetSensorDataUseCase(this._repository);

  /// Sensör veri akışını döndüren metodu çağırır.
  ///
  /// Repository'deki [getSensorDataStream] metodunu çağırır.
  Stream<SensorData> call() {
    return _repository.getSensorDataStream();
  }
}
