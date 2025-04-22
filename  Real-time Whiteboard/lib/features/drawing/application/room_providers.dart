import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Manages the list of available room IDs.
///
/// In this simulation, it simply holds a list of strings.
/// In a real application, this might fetch rooms from a database.
final roomListProvider = StateProvider<List<String>>((ref) {
  // Start with a default room for demonstration
  return ['Default Room'];
}); 