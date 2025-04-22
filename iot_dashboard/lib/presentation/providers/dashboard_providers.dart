import 'dart:collection'; // Queue için eklendi
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iot_dashboard/data/datasources/mock_sensor_data_source.dart';
import 'package:iot_dashboard/data/repositories/sensor_repository_impl.dart';
import 'package:iot_dashboard/domain/entities/sensor_data.dart';
import 'package:iot_dashboard/domain/repositories/sensor_repository.dart';
import 'package:iot_dashboard/domain/usecases/get_sensor_data_usecase.dart';

/// [MockSensorDataSource] için bir provider.
///
/// Uygulama genelinde tek bir instance'ın kullanılmasını sağlar.
final mockSensorDataSourceProvider = Provider<MockSensorDataSource>((ref) {
  final dataSource = MockSensorDataSource();
  ref.onDispose(() {
    dataSource.dispose();
  });
  return dataSource;
});

/// [SensorRepository] için bir provider.
///
/// Somut implementasyon olarak [SensorRepositoryImpl]'i sağlar.
/// Gerekli olan [MockSensorDataSource]'ı `ref.watch` ile alır.
final sensorRepositoryProvider = Provider<SensorRepository>((ref) {
  final dataSource = ref.watch(mockSensorDataSourceProvider);
  return SensorRepositoryImpl(dataSource);
});

/// [GetSensorDataUseCase] için bir provider.
///
/// Gerekli olan [SensorRepository]'yi `ref.watch` ile alır.
final getSensorDataUseCaseProvider = Provider<GetSensorDataUseCase>((ref) {
  final repository = ref.watch(sensorRepositoryProvider);
  return GetSensorDataUseCase(repository);
});

/// Anlık sensör veri akışını sağlayan [StreamProvider].
/// Artık broadcast stream olduğu için birden fazla dinleyici sorun olmaz.
final sensorDataStreamProvider = StreamProvider.autoDispose<SensorData>((ref) {
  final getSensorDataUseCase = ref.watch(getSensorDataUseCaseProvider);
  // Doğrudan stream'i döndür, Riverpod dinlemeyi yönetecek.
  return getSensorDataUseCase.call();
  // Manuel stream.listen kaldırıldı.
});

/// Son N sensör verisini tutan StateNotifier.
class HistoricalDataNotifier extends StateNotifier<List<SensorData>> {
  final int maxSize;
  final Queue<SensorData> _queue;

  HistoricalDataNotifier({this.maxSize = 20}) // Son 20 veriyi tut
    : _queue = Queue<SensorData>(),
      super([]);

  /// Yeni veri ekler ve gerekirse en eski veriyi çıkarır.
  void updateData(SensorData newData) {
    if (_queue.length >= maxSize) {
      _queue.removeFirst(); // Kuyruk doluysa en eski veriyi çıkar
    }
    _queue.add(newData); // Yeni veriyi ekle
    state = List.unmodifiable(
      _queue,
    ); // State'i güncelle (değişmez liste olarak)
  }
}

/// [HistoricalDataNotifier] için [StateNotifierProvider].
///
/// Grafik için kullanılacak son sensör verilerini sağlar.
final historicalDataProvider =
    StateNotifierProvider<HistoricalDataNotifier, List<SensorData>>((ref) {
  final notifier = HistoricalDataNotifier();

  // sensorDataStreamProvider'dan gelen veriyi dinle ve notifier'ı güncelle.
  ref.listen<AsyncValue<SensorData>>(
    sensorDataStreamProvider,
    (previous, next) {
      // Sadece başarılı veri geldiğinde güncelle.
      if (next is AsyncData<SensorData>) {
        notifier.updateData(next.value);
      }
    },
    // Hata durumunu da ele almak isterseniz buraya ekleyebilirsiniz
    // fireImmediately: true, // İsteğe bağlı: Başlangıç değerini hemen almak için
  );

  return notifier;
});
