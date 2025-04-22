// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drawing_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DrawingPointImpl _$$DrawingPointImplFromJson(Map<String, dynamic> json) =>
    _$DrawingPointImpl(
      dx: (json['dx'] as num).toDouble(),
      dy: (json['dy'] as num).toDouble(),
      colorValue: (json['colorValue'] as num).toInt(),
      strokeWidth: (json['strokeWidth'] as num).toDouble(),
    );

Map<String, dynamic> _$$DrawingPointImplToJson(_$DrawingPointImpl instance) =>
    <String, dynamic>{
      'dx': instance.dx,
      'dy': instance.dy,
      'colorValue': instance.colorValue,
      'strokeWidth': instance.strokeWidth,
    };

_$DrawingPathImpl _$$DrawingPathImplFromJson(Map<String, dynamic> json) =>
    _$DrawingPathImpl(
      points:
          (json['points'] as List<dynamic>)
              .map((e) => DrawingPoint.fromJson(e as Map<String, dynamic>))
              .toList(),
      colorValue: (json['colorValue'] as num).toInt(),
      strokeWidth: (json['strokeWidth'] as num).toDouble(),
    );

Map<String, dynamic> _$$DrawingPathImplToJson(_$DrawingPathImpl instance) =>
    <String, dynamic>{
      'points': instance.points,
      'colorValue': instance.colorValue,
      'strokeWidth': instance.strokeWidth,
    };
