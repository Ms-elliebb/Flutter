// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drawing_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DrawingPoint _$DrawingPointFromJson(Map<String, dynamic> json) {
  return _DrawingPoint.fromJson(json);
}

/// @nodoc
mixin _$DrawingPoint {
  /// The x-coordinate of the point.
  double get dx => throw _privateConstructorUsedError;

  /// The y-coordinate of the point.
  double get dy =>
      throw _privateConstructorUsedError; // required Offset position, // Offset yerine dx, dy kullanalım
  /// The ARGB integer representation of the paint color at this point.
  int get colorValue =>
      throw _privateConstructorUsedError; // required Color color,
  /// The thickness of the stroke at this point.
  double get strokeWidth => throw _privateConstructorUsedError;

  /// Serializes this DrawingPoint to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DrawingPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DrawingPointCopyWith<DrawingPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrawingPointCopyWith<$Res> {
  factory $DrawingPointCopyWith(
    DrawingPoint value,
    $Res Function(DrawingPoint) then,
  ) = _$DrawingPointCopyWithImpl<$Res, DrawingPoint>;
  @useResult
  $Res call({double dx, double dy, int colorValue, double strokeWidth});
}

/// @nodoc
class _$DrawingPointCopyWithImpl<$Res, $Val extends DrawingPoint>
    implements $DrawingPointCopyWith<$Res> {
  _$DrawingPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DrawingPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dx = null,
    Object? dy = null,
    Object? colorValue = null,
    Object? strokeWidth = null,
  }) {
    return _then(
      _value.copyWith(
            dx:
                null == dx
                    ? _value.dx
                    : dx // ignore: cast_nullable_to_non_nullable
                        as double,
            dy:
                null == dy
                    ? _value.dy
                    : dy // ignore: cast_nullable_to_non_nullable
                        as double,
            colorValue:
                null == colorValue
                    ? _value.colorValue
                    : colorValue // ignore: cast_nullable_to_non_nullable
                        as int,
            strokeWidth:
                null == strokeWidth
                    ? _value.strokeWidth
                    : strokeWidth // ignore: cast_nullable_to_non_nullable
                        as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DrawingPointImplCopyWith<$Res>
    implements $DrawingPointCopyWith<$Res> {
  factory _$$DrawingPointImplCopyWith(
    _$DrawingPointImpl value,
    $Res Function(_$DrawingPointImpl) then,
  ) = __$$DrawingPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double dx, double dy, int colorValue, double strokeWidth});
}

/// @nodoc
class __$$DrawingPointImplCopyWithImpl<$Res>
    extends _$DrawingPointCopyWithImpl<$Res, _$DrawingPointImpl>
    implements _$$DrawingPointImplCopyWith<$Res> {
  __$$DrawingPointImplCopyWithImpl(
    _$DrawingPointImpl _value,
    $Res Function(_$DrawingPointImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DrawingPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dx = null,
    Object? dy = null,
    Object? colorValue = null,
    Object? strokeWidth = null,
  }) {
    return _then(
      _$DrawingPointImpl(
        dx:
            null == dx
                ? _value.dx
                : dx // ignore: cast_nullable_to_non_nullable
                    as double,
        dy:
            null == dy
                ? _value.dy
                : dy // ignore: cast_nullable_to_non_nullable
                    as double,
        colorValue:
            null == colorValue
                ? _value.colorValue
                : colorValue // ignore: cast_nullable_to_non_nullable
                    as int,
        strokeWidth:
            null == strokeWidth
                ? _value.strokeWidth
                : strokeWidth // ignore: cast_nullable_to_non_nullable
                    as double,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable()
class _$DrawingPointImpl extends _DrawingPoint {
  const _$DrawingPointImpl({
    required this.dx,
    required this.dy,
    required this.colorValue,
    required this.strokeWidth,
  }) : super._();

  factory _$DrawingPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$DrawingPointImplFromJson(json);

  /// The x-coordinate of the point.
  @override
  final double dx;

  /// The y-coordinate of the point.
  @override
  final double dy;
  // required Offset position, // Offset yerine dx, dy kullanalım
  /// The ARGB integer representation of the paint color at this point.
  @override
  final int colorValue;
  // required Color color,
  /// The thickness of the stroke at this point.
  @override
  final double strokeWidth;

  @override
  String toString() {
    return 'DrawingPoint(dx: $dx, dy: $dy, colorValue: $colorValue, strokeWidth: $strokeWidth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DrawingPointImpl &&
            (identical(other.dx, dx) || other.dx == dx) &&
            (identical(other.dy, dy) || other.dy == dy) &&
            (identical(other.colorValue, colorValue) ||
                other.colorValue == colorValue) &&
            (identical(other.strokeWidth, strokeWidth) ||
                other.strokeWidth == strokeWidth));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, dx, dy, colorValue, strokeWidth);

  /// Create a copy of DrawingPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DrawingPointImplCopyWith<_$DrawingPointImpl> get copyWith =>
      __$$DrawingPointImplCopyWithImpl<_$DrawingPointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DrawingPointImplToJson(this);
  }
}

abstract class _DrawingPoint extends DrawingPoint {
  const factory _DrawingPoint({
    required final double dx,
    required final double dy,
    required final int colorValue,
    required final double strokeWidth,
  }) = _$DrawingPointImpl;
  const _DrawingPoint._() : super._();

  factory _DrawingPoint.fromJson(Map<String, dynamic> json) =
      _$DrawingPointImpl.fromJson;

  /// The x-coordinate of the point.
  @override
  double get dx;

  /// The y-coordinate of the point.
  @override
  double get dy; // required Offset position, // Offset yerine dx, dy kullanalım
  /// The ARGB integer representation of the paint color at this point.
  @override
  int get colorValue; // required Color color,
  /// The thickness of the stroke at this point.
  @override
  double get strokeWidth;

  /// Create a copy of DrawingPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DrawingPointImplCopyWith<_$DrawingPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DrawingPath _$DrawingPathFromJson(Map<String, dynamic> json) {
  return _DrawingPath.fromJson(json);
}

/// @nodoc
mixin _$DrawingPath {
  /// The list of [DrawingPoint]s that make up this path.
  List<DrawingPoint> get points => throw _privateConstructorUsedError;

  /// The ARGB integer representation of the color used for this entire path.
  int get colorValue =>
      throw _privateConstructorUsedError; // required Color color,
  /// The stroke width used for this entire path.
  double get strokeWidth => throw _privateConstructorUsedError;

  /// Serializes this DrawingPath to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DrawingPath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DrawingPathCopyWith<DrawingPath> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrawingPathCopyWith<$Res> {
  factory $DrawingPathCopyWith(
    DrawingPath value,
    $Res Function(DrawingPath) then,
  ) = _$DrawingPathCopyWithImpl<$Res, DrawingPath>;
  @useResult
  $Res call({List<DrawingPoint> points, int colorValue, double strokeWidth});
}

/// @nodoc
class _$DrawingPathCopyWithImpl<$Res, $Val extends DrawingPath>
    implements $DrawingPathCopyWith<$Res> {
  _$DrawingPathCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DrawingPath
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? points = null,
    Object? colorValue = null,
    Object? strokeWidth = null,
  }) {
    return _then(
      _value.copyWith(
            points:
                null == points
                    ? _value.points
                    : points // ignore: cast_nullable_to_non_nullable
                        as List<DrawingPoint>,
            colorValue:
                null == colorValue
                    ? _value.colorValue
                    : colorValue // ignore: cast_nullable_to_non_nullable
                        as int,
            strokeWidth:
                null == strokeWidth
                    ? _value.strokeWidth
                    : strokeWidth // ignore: cast_nullable_to_non_nullable
                        as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DrawingPathImplCopyWith<$Res>
    implements $DrawingPathCopyWith<$Res> {
  factory _$$DrawingPathImplCopyWith(
    _$DrawingPathImpl value,
    $Res Function(_$DrawingPathImpl) then,
  ) = __$$DrawingPathImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DrawingPoint> points, int colorValue, double strokeWidth});
}

/// @nodoc
class __$$DrawingPathImplCopyWithImpl<$Res>
    extends _$DrawingPathCopyWithImpl<$Res, _$DrawingPathImpl>
    implements _$$DrawingPathImplCopyWith<$Res> {
  __$$DrawingPathImplCopyWithImpl(
    _$DrawingPathImpl _value,
    $Res Function(_$DrawingPathImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DrawingPath
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? points = null,
    Object? colorValue = null,
    Object? strokeWidth = null,
  }) {
    return _then(
      _$DrawingPathImpl(
        points:
            null == points
                ? _value._points
                : points // ignore: cast_nullable_to_non_nullable
                    as List<DrawingPoint>,
        colorValue:
            null == colorValue
                ? _value.colorValue
                : colorValue // ignore: cast_nullable_to_non_nullable
                    as int,
        strokeWidth:
            null == strokeWidth
                ? _value.strokeWidth
                : strokeWidth // ignore: cast_nullable_to_non_nullable
                    as double,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable()
class _$DrawingPathImpl extends _DrawingPath {
  const _$DrawingPathImpl({
    required final List<DrawingPoint> points,
    required this.colorValue,
    required this.strokeWidth,
  }) : _points = points,
       super._();

  factory _$DrawingPathImpl.fromJson(Map<String, dynamic> json) =>
      _$$DrawingPathImplFromJson(json);

  /// The list of [DrawingPoint]s that make up this path.
  final List<DrawingPoint> _points;

  /// The list of [DrawingPoint]s that make up this path.
  @override
  List<DrawingPoint> get points {
    if (_points is EqualUnmodifiableListView) return _points;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_points);
  }

  /// The ARGB integer representation of the color used for this entire path.
  @override
  final int colorValue;
  // required Color color,
  /// The stroke width used for this entire path.
  @override
  final double strokeWidth;

  @override
  String toString() {
    return 'DrawingPath(points: $points, colorValue: $colorValue, strokeWidth: $strokeWidth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DrawingPathImpl &&
            const DeepCollectionEquality().equals(other._points, _points) &&
            (identical(other.colorValue, colorValue) ||
                other.colorValue == colorValue) &&
            (identical(other.strokeWidth, strokeWidth) ||
                other.strokeWidth == strokeWidth));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_points),
    colorValue,
    strokeWidth,
  );

  /// Create a copy of DrawingPath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DrawingPathImplCopyWith<_$DrawingPathImpl> get copyWith =>
      __$$DrawingPathImplCopyWithImpl<_$DrawingPathImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DrawingPathImplToJson(this);
  }
}

abstract class _DrawingPath extends DrawingPath {
  const factory _DrawingPath({
    required final List<DrawingPoint> points,
    required final int colorValue,
    required final double strokeWidth,
  }) = _$DrawingPathImpl;
  const _DrawingPath._() : super._();

  factory _DrawingPath.fromJson(Map<String, dynamic> json) =
      _$DrawingPathImpl.fromJson;

  /// The list of [DrawingPoint]s that make up this path.
  @override
  List<DrawingPoint> get points;

  /// The ARGB integer representation of the color used for this entire path.
  @override
  int get colorValue; // required Color color,
  /// The stroke width used for this entire path.
  @override
  double get strokeWidth;

  /// Create a copy of DrawingPath
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DrawingPathImplCopyWith<_$DrawingPathImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
