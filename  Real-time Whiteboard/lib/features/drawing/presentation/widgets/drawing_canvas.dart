import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/drawing_notifier.dart';
import '../../domain/drawing_models.dart';

/// A widget that displays the drawing canvas and handles user pan gestures for a specific room.
///
/// Uses [CustomPaint] with a [DrawingPainter] to render the paths.
/// Interacts with the [DrawingNotifier] via Riverpod using the provided [roomId]
/// to get state updates and notify about user actions (pan start, update, end).
class DrawingCanvas extends ConsumerWidget {
  /// The identifier for the room whose canvas this widget displays.
  final String roomId;

  /// Creates a DrawingCanvas widget for a specific room.
  const DrawingCanvas({required this.roomId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the drawing state from the notifier for the specific room.
    final drawingState = ref.watch(drawingNotifierProvider(roomId));
    final notifier = ref.read(drawingNotifierProvider(roomId).notifier);

    // We use a GestureDetector to detect user input on the canvas.
    return GestureDetector(
      onPanStart: (details) {
        notifier.startPath(details.localPosition);
      },
      onPanUpdate: (details) {
        notifier.addPoint(details.localPosition);
      },
      onPanEnd: (details) {
        notifier.endPath();
      },
      child: CustomPaint(
        // Pass the completed paths and the current path to the painter.
        painter: DrawingPainter(
          paths: drawingState.paths,
          currentPath: drawingState.currentPath,
        ),
        // Ensure the CustomPaint takes up the available space.
        size: Size.infinite,
      ),
    );
  }
}

/// A [CustomPainter] that draws the completed paths and the current path
/// onto the canvas based on the state provided by [DrawingNotifier].
class DrawingPainter extends CustomPainter {
  /// List of completed paths to draw.
  final List<DrawingPath> paths;

  /// The path currently being drawn (optional).
  final DrawingPath? currentPath;

  /// Creates a DrawingPainter.
  ///
  /// Requires the list of completed [paths] and the optional [currentPath].
  DrawingPainter({required this.paths, this.currentPath});

  @override
  void paint(Canvas canvas, Size size) {
    // Draw a slightly off-white background
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..color = Colors.grey[100]!,
    );

    // Draw all completed paths
    for (final path in paths) {
      _drawPath(canvas, path);
    }

    // Draw the current path if it exists
    if (currentPath != null) {
      _drawPath(canvas, currentPath!);
    }
  }

  /// Helper method to draw a single [DrawingPath] onto the canvas.
  void _drawPath(Canvas canvas, DrawingPath path) {
    if (path.points.isEmpty) return;

    final paint =
        Paint()
          ..color = path.color
          ..strokeWidth = path.strokeWidth
          ..style = PaintingStyle.stroke
          ..strokeCap =
              StrokeCap
                  .round // Makes lines smoother
          ..strokeJoin = StrokeJoin.round;

    // Create a Path object from the points
    final Path pathObject = Path();
    pathObject.moveTo(
      path.points.first.position.dx,
      path.points.first.position.dy,
    );
    for (int i = 1; i < path.points.length; i++) {
      pathObject.lineTo(path.points[i].position.dx, path.points[i].position.dy);
    }

    canvas.drawPath(pathObject, paint);
  }

  @override
  bool shouldRepaint(covariant DrawingPainter oldDelegate) {
    // Repaint only if the paths or the current path have changed.
    return oldDelegate.paths != paths || oldDelegate.currentPath != currentPath;
  }
}
