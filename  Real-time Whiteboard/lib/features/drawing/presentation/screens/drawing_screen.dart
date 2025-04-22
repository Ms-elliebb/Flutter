import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/drawing_canvas.dart';
import '../widgets/drawing_toolbar.dart';

/// The main screen for the drawing application for a specific room.
///
/// Displays the [DrawingToolbar] at the top and the [DrawingCanvas]
/// filling the remaining space, both connected to the state of the given [roomId].
class DrawingScreen extends ConsumerWidget {
  /// The unique identifier for the drawing room this screen represents.
  final String roomId;

  /// Creates the main drawing screen for a specific room.
  const DrawingScreen({required this.roomId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room: $roomId'),
        // Potansiyel olarak buraya oda bilgisi veya başka kontroller eklenebilir
      ),
      // Use a Column to place the toolbar above the canvas
      body: Column(
        children: [
          DrawingToolbar(roomId: roomId),
          const Divider(height: 1, thickness: 1), // Separator
          // Make the canvas expand to fill the remaining space
          Expanded(child: DrawingCanvas(roomId: roomId)),
        ],
      ),
    );
  }
}
