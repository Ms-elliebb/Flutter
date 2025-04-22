import 'dart:async';
import 'dart:math';

import 'package:iot_dashboard/domain/entities/sensor_data.dart';

/// Rastgele sensör verileri üreten ve bunları bir [Stream] olarak yayınlayan
/// simüle edilmiş bir veri kaynağı.
class MockSensorDataSource {
  final Random _random = Random();
  Timer? _timer;
  // StreamController'ı broadcast olarak oluştur
  final _controller = StreamController<SensorData>.broadcast();

  /// Sensör verilerini içeren bir broadcast [Stream] döndürür.
  ///
  /// Stream, her saniye yeni bir [SensorData] örneği yayar.
  /// Broadcast stream olduğu için birden fazla dinleyici tarafından dinlenebilir.
  Stream<SensorData> getSensorDataStream() {
    // Eğer timer zaten çalışıyorsa tekrar başlatma
    if (_timer == null || !_timer!.isActive) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        final temperature = 20 + _random.nextDouble() * 10;
        final humidity = 40 + _random.nextDouble() * 20;
        final timestamp = DateTime.now();

        _controller.add(SensorData(
          temperature: temperature,
          humidity: humidity,
          timestamp: timestamp,
        ));
      });
    }

    // onCancel broadcast stream'lerde doğrudan desteklenmez.
    // Timer'ı dispose metodunda durdurmak daha güvenilirdir.
    // _controller.onCancel = () { ... };

    return _controller.stream;
  }

  /// Simülasyonu durdurur ve kaynakları serbest bırakır.
  void dispose() {
    _timer?.cancel();
    _controller.close();
  }
}
