// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drawing_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DrawingState {
  /// List of paths that have been completed and drawn on the canvas.
  List<DrawingPath> get paths => throw _privateConstructorUsedError;

  /// The path currently being drawn by the user (null if not drawing).
  DrawingPath? get currentPath => throw _privateConstructorUsedError;

  /// The currently selected drawing tool (pen or eraser).
  DrawingTool get selectedTool => throw _privateConstructorUsedError;

  /// The ARGB integer value of the currently selected color.
  int get selectedColorValue =>
      throw _privateConstructorUsedError; // Default to black
  /// The currently selected stroke width for the drawing tool.
  double get selectedStrokeWidth => throw _privateConstructorUsedError;

  /// Create a copy of DrawingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DrawingStateCopyWith<DrawingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrawingStateCopyWith<$Res> {
  factory $DrawingStateCopyWith(
    DrawingState value,
    $Res Function(DrawingState) then,
  ) = _$DrawingStateCopyWithImpl<$Res, DrawingState>;
  @useResult
  $Res call({
    List<DrawingPath> paths,
    DrawingPath? currentPath,
    DrawingTool selectedTool,
    int selectedColorValue,
    double selectedStrokeWidth,
  });

  $DrawingPathCopyWith<$Res>? get currentPath;
}

/// @nodoc
class _$DrawingStateCopyWithImpl<$Res, $Val extends DrawingState>
    implements $DrawingStateCopyWith<$Res> {
  _$DrawingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DrawingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paths = null,
    Object? currentPath = freezed,
    Object? selectedTool = null,
    Object? selectedColorValue = null,
    Object? selectedStrokeWidth = null,
  }) {
    return _then(
      _value.copyWith(
            paths:
                null == paths
                    ? _value.paths
                    : paths // ignore: cast_nullable_to_non_nullable
                        as List<DrawingPath>,
            currentPath:
                freezed == currentPath
                    ? _value.currentPath
                    : currentPath // ignore: cast_nullable_to_non_nullable
                        as DrawingPath?,
            selectedTool:
                null == selectedTool
                    ? _value.selectedTool
                    : selectedTool // ignore: cast_nullable_to_non_nullable
                        as DrawingTool,
            selectedColorValue:
                null == selectedColorValue
                    ? _value.selectedColorValue
                    : selectedColorValue // ignore: cast_nullable_to_non_nullable
                        as int,
            selectedStrokeWidth:
                null == selectedStrokeWidth
                    ? _value.selectedStrokeWidth
                    : selectedStrokeWidth // ignore: cast_nullable_to_non_nullable
                        as double,
          )
          as $Val,
    );
  }

  /// Create a copy of DrawingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DrawingPathCopyWith<$Res>? get currentPath {
    if (_value.currentPath == null) {
      return null;
    }

    return $DrawingPathCopyWith<$Res>(_value.currentPath!, (value) {
      return _then(_value.copyWith(currentPath: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DrawingStateImplCopyWith<$Res>
    implements $DrawingStateCopyWith<$Res> {
  factory _$$DrawingStateImplCopyWith(
    _$DrawingStateImpl value,
    $Res Function(_$DrawingStateImpl) then,
  ) = __$$DrawingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<DrawingPath> paths,
    DrawingPath? currentPath,
    DrawingTool selectedTool,
    int selectedColorValue,
    double selectedStrokeWidth,
  });

  @override
  $DrawingPathCopyWith<$Res>? get currentPath;
}

/// @nodoc
class __$$DrawingStateImplCopyWithImpl<$Res>
    extends _$DrawingStateCopyWithImpl<$Res, _$DrawingStateImpl>
    implements _$$DrawingStateImplCopyWith<$Res> {
  __$$DrawingStateImplCopyWithImpl(
    _$DrawingStateImpl _value,
    $Res Function(_$DrawingStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DrawingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paths = null,
    Object? currentPath = freezed,
    Object? selectedTool = null,
    Object? selectedColorValue = null,
    Object? selectedStrokeWidth = null,
  }) {
    return _then(
      _$DrawingStateImpl(
        paths:
            null == paths
                ? _value._paths
                : paths // ignore: cast_nullable_to_non_nullable
                    as List<DrawingPath>,
        currentPath:
            freezed == currentPath
                ? _value.currentPath
                : currentPath // ignore: cast_nullable_to_non_nullable
                    as DrawingPath?,
        selectedTool:
            null == selectedTool
                ? _value.selectedTool
                : selectedTool // ignore: cast_nullable_to_non_nullable
                    as DrawingTool,
        selectedColorValue:
            null == selectedColorValue
                ? _value.selectedColorValue
                : selectedColorValue // ignore: cast_nullable_to_non_nullable
                    as int,
        selectedStrokeWidth:
            null == selectedStrokeWidth
                ? _value.selectedStrokeWidth
                : selectedStrokeWidth // ignore: cast_nullable_to_non_nullable
                    as double,
      ),
    );
  }
}

/// @nodoc

class _$DrawingStateImpl extends _DrawingState {
  const _$DrawingStateImpl({
    final List<DrawingPath> paths = const [],
    this.currentPath,
    this.selectedTool = DrawingTool.pen,
    this.selectedColorValue = 0xFF000000,
    this.selectedStrokeWidth = 5.0,
  }) : _paths = paths,
       super._();

  /// List of paths that have been completed and drawn on the canvas.
  final List<DrawingPath> _paths;

  /// List of paths that have been completed and drawn on the canvas.
  @override
  @JsonKey()
  List<DrawingPath> get paths {
    if (_paths is EqualUnmodifiableListView) return _paths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paths);
  }

  /// The path currently being drawn by the user (null if not drawing).
  @override
  final DrawingPath? currentPath;

  /// The currently selected drawing tool (pen or eraser).
  @override
  @JsonKey()
  final DrawingTool selectedTool;

  /// The ARGB integer value of the currently selected color.
  @override
  @JsonKey()
  final int selectedColorValue;
  // Default to black
  /// The currently selected stroke width for the drawing tool.
  @override
  @JsonKey()
  final double selectedStrokeWidth;

  @override
  String toString() {
    return 'DrawingState(paths: $paths, currentPath: $currentPath, selectedTool: $selectedTool, selectedColorValue: $selectedColorValue, selectedStrokeWidth: $selectedStrokeWidth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DrawingStateImpl &&
            const DeepCollectionEquality().equals(other._paths, _paths) &&
            (identical(other.currentPath, currentPath) ||
                other.currentPath == currentPath) &&
            (identical(other.selectedTool, selectedTool) ||
                other.selectedTool == selectedTool) &&
            (identical(other.selectedColorValue, selectedColorValue) ||
                other.selectedColorValue == selectedColorValue) &&
            (identical(other.selectedStrokeWidth, selectedStrokeWidth) ||
                other.selectedStrokeWidth == selectedStrokeWidth));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_paths),
    currentPath,
    selectedTool,
    selectedColorValue,
    selectedStrokeWidth,
  );

  /// Create a copy of DrawingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DrawingStateImplCopyWith<_$DrawingStateImpl> get copyWith =>
      __$$DrawingStateImplCopyWithImpl<_$DrawingStateImpl>(this, _$identity);
}

abstract class _DrawingState extends DrawingState {
  const factory _DrawingState({
    final List<DrawingPath> paths,
    final DrawingPath? currentPath,
    final DrawingTool selectedTool,
    final int selectedColorValue,
    final double selectedStrokeWidth,
  }) = _$DrawingStateImpl;
  const _DrawingState._() : super._();

  /// List of paths that have been completed and drawn on the canvas.
  @override
  List<DrawingPath> get paths;

  /// The path currently being drawn by the user (null if not drawing).
  @override
  DrawingPath? get currentPath;

  /// The currently selected drawing tool (pen or eraser).
  @override
  DrawingTool get selectedTool;

  /// The ARGB integer value of the currently selected color.
  @override
  int get selectedColorValue; // Default to black
  /// The currently selected stroke width for the drawing tool.
  @override
  double get selectedStrokeWidth;

  /// Create a copy of DrawingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DrawingStateImplCopyWith<_$DrawingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
