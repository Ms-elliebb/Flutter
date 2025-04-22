// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drawing_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$drawingNotifierHash() => r'0c141c6729c4f9b334c2522bb7e207fdb00c9621';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$DrawingNotifier extends BuildlessNotifier<DrawingState> {
  late final String roomId;

  DrawingState build(String roomId);
}

/// Manages the state for the drawing feature using Riverpod for a specific room.
///
/// Holds the list of completed paths, the currently drawn path,
/// and the selected drawing tool settings (tool, color, stroke width) for one room.
///
/// Copied from [DrawingNotifier].
@ProviderFor(DrawingNotifier)
const drawingNotifierProvider = DrawingNotifierFamily();

/// Manages the state for the drawing feature using Riverpod for a specific room.
///
/// Holds the list of completed paths, the currently drawn path,
/// and the selected drawing tool settings (tool, color, stroke width) for one room.
///
/// Copied from [DrawingNotifier].
class DrawingNotifierFamily extends Family<DrawingState> {
  /// Manages the state for the drawing feature using Riverpod for a specific room.
  ///
  /// Holds the list of completed paths, the currently drawn path,
  /// and the selected drawing tool settings (tool, color, stroke width) for one room.
  ///
  /// Copied from [DrawingNotifier].
  const DrawingNotifierFamily();

  /// Manages the state for the drawing feature using Riverpod for a specific room.
  ///
  /// Holds the list of completed paths, the currently drawn path,
  /// and the selected drawing tool settings (tool, color, stroke width) for one room.
  ///
  /// Copied from [DrawingNotifier].
  DrawingNotifierProvider call(String roomId) {
    return DrawingNotifierProvider(roomId);
  }

  @override
  DrawingNotifierProvider getProviderOverride(
    covariant DrawingNotifierProvider provider,
  ) {
    return call(provider.roomId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'drawingNotifierProvider';
}

/// Manages the state for the drawing feature using Riverpod for a specific room.
///
/// Holds the list of completed paths, the currently drawn path,
/// and the selected drawing tool settings (tool, color, stroke width) for one room.
///
/// Copied from [DrawingNotifier].
class DrawingNotifierProvider
    extends NotifierProviderImpl<DrawingNotifier, DrawingState> {
  /// Manages the state for the drawing feature using Riverpod for a specific room.
  ///
  /// Holds the list of completed paths, the currently drawn path,
  /// and the selected drawing tool settings (tool, color, stroke width) for one room.
  ///
  /// Copied from [DrawingNotifier].
  DrawingNotifierProvider(String roomId)
    : this._internal(
        () => DrawingNotifier()..roomId = roomId,
        from: drawingNotifierProvider,
        name: r'drawingNotifierProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$drawingNotifierHash,
        dependencies: DrawingNotifierFamily._dependencies,
        allTransitiveDependencies:
            DrawingNotifierFamily._allTransitiveDependencies,
        roomId: roomId,
      );

  DrawingNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.roomId,
  }) : super.internal();

  final String roomId;

  @override
  DrawingState runNotifierBuild(covariant DrawingNotifier notifier) {
    return notifier.build(roomId);
  }

  @override
  Override overrideWith(DrawingNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: DrawingNotifierProvider._internal(
        () => create()..roomId = roomId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        roomId: roomId,
      ),
    );
  }

  @override
  NotifierProviderElement<DrawingNotifier, DrawingState> createElement() {
    return _DrawingNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DrawingNotifierProvider && other.roomId == roomId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, roomId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DrawingNotifierRef on NotifierProviderRef<DrawingState> {
  /// The parameter `roomId` of this provider.
  String get roomId;
}

class _DrawingNotifierProviderElement
    extends NotifierProviderElement<DrawingNotifier, DrawingState>
    with DrawingNotifierRef {
  _DrawingNotifierProviderElement(super.provider);

  @override
  String get roomId => (origin as DrawingNotifierProvider).roomId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
