import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'drawing_models.freezed.dart';
part 'drawing_models.g.dart'; // JSON serileştirme için (ileride gerekebilir)

/// Represents a single point with position, color, and stroke width.
///
/// Used within a [DrawingPath]. Stored using Freezed for immutability
/// and includes JSON serialization logic.
@freezed
class DrawingPoint with _$DrawingPoint {
  const DrawingPoint._(); // Eklenen private constructor

  // JSON serileştirme için factory ekleyelim (opsiyonel ama iyi pratik)
  @JsonSerializable()
  const factory DrawingPoint({
    /// The x-coordinate of the point.
    required double dx,

    /// The y-coordinate of the point.
    required double dy,
    // required Offset position, // Offset yerine dx, dy kullanalım

    /// The ARGB integer representation of the paint color at this point.
    required int colorValue,
    // required Color color,

    /// The thickness of the stroke at this point.
    required double strokeWidth,
  }) = _DrawingPoint;

  // Offset'e kolay erişim için getter
  Offset get position => Offset(dx, dy);

  // Color'a kolay erişim için getter
  Color get color => Color(colorValue);

  factory DrawingPoint.fromJson(Map<String, dynamic> json) =>
      _$DrawingPointFromJson(json);
}

/// Represents a continuous path drawn by the user, consisting of multiple points.
///
/// Stored using Freezed for immutability and includes JSON serialization logic.
@freezed
class DrawingPath with _$DrawingPath {
  const DrawingPath._(); // Eklenen private constructor

  @JsonSerializable()
  const factory DrawingPath({
    /// The list of [DrawingPoint]s that make up this path.
    required List<DrawingPoint> points,

    /// The ARGB integer representation of the color used for this entire path.
    required int colorValue,
    // required Color color,

    /// The stroke width used for this entire path.
    required double strokeWidth,
  }) = _DrawingPath;

  // Color'a kolay erişim için getter
  Color get color => Color(colorValue);

  factory DrawingPath.fromJson(Map<String, dynamic> json) =>
      _$DrawingPathFromJson(json);
}
