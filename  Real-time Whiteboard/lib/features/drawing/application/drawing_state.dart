import 'package:flutter/material.dart'; // Bu import vardı ama üstte değildi, yukarı taşıyalım
// import 'package:flutter/foundation.dart'; // Kaldırılan import
import 'package:freezed_annotation/freezed_annotation.dart'; // Freezed kullanacaksak
import '../domain/drawing_models.dart';
import '../domain/drawing_tool.dart'; // Eklenen import

part 'drawing_state.freezed.dart'; // Freezed kullanacaksak

/// Represents the immutable state of the drawing feature.
///
/// Includes the list of completed paths, the currently drawn path (if any),
/// and the currently selected tool settings (tool, color, stroke width).
/// Managed by [DrawingNotifier].
@freezed
class DrawingState with _$DrawingState {
  const DrawingState._(); // Eklenen private constructor

  const factory DrawingState({
    /// List of paths that have been completed and drawn on the canvas.
    @Default([]) List<DrawingPath> paths,

    /// The path currently being drawn by the user (null if not drawing).
    DrawingPath? currentPath,

    /// The currently selected drawing tool (pen or eraser).
    @Default(DrawingTool.pen) DrawingTool selectedTool,

    /// The ARGB integer value of the currently selected color.
    @Default(0xFF000000) int selectedColorValue, // Default to black
    /// The currently selected stroke width for the drawing tool.
    @Default(5.0) double selectedStrokeWidth,

    // TODO: Add state for selected tool, color, stroke width later
  }) = _DrawingState;

  /// Returns the selected color as a [Color] object.
  Color get selectedColor => Color(selectedColorValue);
}
