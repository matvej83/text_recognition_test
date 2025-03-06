// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_scanner_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CardScannerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() cardScanned,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? cardScanned,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? cardScanned,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(CardScanned value) cardScanned,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(CardScanned value)? cardScanned,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(CardScanned value)? cardScanned,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardScannerEventCopyWith<$Res> {
  factory $CardScannerEventCopyWith(
          CardScannerEvent value, $Res Function(CardScannerEvent) then) =
      _$CardScannerEventCopyWithImpl<$Res, CardScannerEvent>;
}

/// @nodoc
class _$CardScannerEventCopyWithImpl<$Res, $Val extends CardScannerEvent>
    implements $CardScannerEventCopyWith<$Res> {
  _$CardScannerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CardScannerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$CardScannerEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CardScannerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'CardScannerEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() cardScanned,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? cardScanned,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? cardScanned,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(CardScanned value) cardScanned,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(CardScanned value)? cardScanned,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(CardScanned value)? cardScanned,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class Started implements CardScannerEvent {
  const factory Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$CardScannedImplCopyWith<$Res> {
  factory _$$CardScannedImplCopyWith(
          _$CardScannedImpl value, $Res Function(_$CardScannedImpl) then) =
      __$$CardScannedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CardScannedImplCopyWithImpl<$Res>
    extends _$CardScannerEventCopyWithImpl<$Res, _$CardScannedImpl>
    implements _$$CardScannedImplCopyWith<$Res> {
  __$$CardScannedImplCopyWithImpl(
      _$CardScannedImpl _value, $Res Function(_$CardScannedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CardScannerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CardScannedImpl implements CardScanned {
  const _$CardScannedImpl();

  @override
  String toString() {
    return 'CardScannerEvent.cardScanned()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CardScannedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() cardScanned,
  }) {
    return cardScanned();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? cardScanned,
  }) {
    return cardScanned?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? cardScanned,
    required TResult orElse(),
  }) {
    if (cardScanned != null) {
      return cardScanned();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(CardScanned value) cardScanned,
  }) {
    return cardScanned(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(CardScanned value)? cardScanned,
  }) {
    return cardScanned?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(CardScanned value)? cardScanned,
    required TResult orElse(),
  }) {
    if (cardScanned != null) {
      return cardScanned(this);
    }
    return orElse();
  }
}

abstract class CardScanned implements CardScannerEvent {
  const factory CardScanned() = _$CardScannedImpl;
}

/// @nodoc
mixin _$CardScannerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() waiting,
    required TResult Function(CardDetails? cardDetails) scanning,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? waiting,
    TResult? Function(CardDetails? cardDetails)? scanning,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? waiting,
    TResult Function(CardDetails? cardDetails)? scanning,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Waiting value) waiting,
    required TResult Function(Scanning value) scanning,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Waiting value)? waiting,
    TResult? Function(Scanning value)? scanning,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Waiting value)? waiting,
    TResult Function(Scanning value)? scanning,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardScannerStateCopyWith<$Res> {
  factory $CardScannerStateCopyWith(
          CardScannerState value, $Res Function(CardScannerState) then) =
      _$CardScannerStateCopyWithImpl<$Res, CardScannerState>;
}

/// @nodoc
class _$CardScannerStateCopyWithImpl<$Res, $Val extends CardScannerState>
    implements $CardScannerStateCopyWith<$Res> {
  _$CardScannerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CardScannerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CardScannerStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of CardScannerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'CardScannerState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() waiting,
    required TResult Function(CardDetails? cardDetails) scanning,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? waiting,
    TResult? Function(CardDetails? cardDetails)? scanning,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? waiting,
    TResult Function(CardDetails? cardDetails)? scanning,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Waiting value) waiting,
    required TResult Function(Scanning value) scanning,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Waiting value)? waiting,
    TResult? Function(Scanning value)? scanning,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Waiting value)? waiting,
    TResult Function(Scanning value)? scanning,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements CardScannerState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$WaitingImplCopyWith<$Res> {
  factory _$$WaitingImplCopyWith(
          _$WaitingImpl value, $Res Function(_$WaitingImpl) then) =
      __$$WaitingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WaitingImplCopyWithImpl<$Res>
    extends _$CardScannerStateCopyWithImpl<$Res, _$WaitingImpl>
    implements _$$WaitingImplCopyWith<$Res> {
  __$$WaitingImplCopyWithImpl(
      _$WaitingImpl _value, $Res Function(_$WaitingImpl) _then)
      : super(_value, _then);

  /// Create a copy of CardScannerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$WaitingImpl implements Waiting {
  const _$WaitingImpl();

  @override
  String toString() {
    return 'CardScannerState.waiting()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WaitingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() waiting,
    required TResult Function(CardDetails? cardDetails) scanning,
  }) {
    return waiting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? waiting,
    TResult? Function(CardDetails? cardDetails)? scanning,
  }) {
    return waiting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? waiting,
    TResult Function(CardDetails? cardDetails)? scanning,
    required TResult orElse(),
  }) {
    if (waiting != null) {
      return waiting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Waiting value) waiting,
    required TResult Function(Scanning value) scanning,
  }) {
    return waiting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Waiting value)? waiting,
    TResult? Function(Scanning value)? scanning,
  }) {
    return waiting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Waiting value)? waiting,
    TResult Function(Scanning value)? scanning,
    required TResult orElse(),
  }) {
    if (waiting != null) {
      return waiting(this);
    }
    return orElse();
  }
}

abstract class Waiting implements CardScannerState {
  const factory Waiting() = _$WaitingImpl;
}

/// @nodoc
abstract class _$$ScanningImplCopyWith<$Res> {
  factory _$$ScanningImplCopyWith(
          _$ScanningImpl value, $Res Function(_$ScanningImpl) then) =
      __$$ScanningImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CardDetails? cardDetails});
}

/// @nodoc
class __$$ScanningImplCopyWithImpl<$Res>
    extends _$CardScannerStateCopyWithImpl<$Res, _$ScanningImpl>
    implements _$$ScanningImplCopyWith<$Res> {
  __$$ScanningImplCopyWithImpl(
      _$ScanningImpl _value, $Res Function(_$ScanningImpl) _then)
      : super(_value, _then);

  /// Create a copy of CardScannerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardDetails = freezed,
  }) {
    return _then(_$ScanningImpl(
      freezed == cardDetails
          ? _value.cardDetails
          : cardDetails // ignore: cast_nullable_to_non_nullable
              as CardDetails?,
    ));
  }
}

/// @nodoc

class _$ScanningImpl implements Scanning {
  const _$ScanningImpl(this.cardDetails);

  @override
  final CardDetails? cardDetails;

  @override
  String toString() {
    return 'CardScannerState.scanning(cardDetails: $cardDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScanningImpl &&
            (identical(other.cardDetails, cardDetails) ||
                other.cardDetails == cardDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cardDetails);

  /// Create a copy of CardScannerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScanningImplCopyWith<_$ScanningImpl> get copyWith =>
      __$$ScanningImplCopyWithImpl<_$ScanningImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() waiting,
    required TResult Function(CardDetails? cardDetails) scanning,
  }) {
    return scanning(cardDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? waiting,
    TResult? Function(CardDetails? cardDetails)? scanning,
  }) {
    return scanning?.call(cardDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? waiting,
    TResult Function(CardDetails? cardDetails)? scanning,
    required TResult orElse(),
  }) {
    if (scanning != null) {
      return scanning(cardDetails);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Waiting value) waiting,
    required TResult Function(Scanning value) scanning,
  }) {
    return scanning(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Waiting value)? waiting,
    TResult? Function(Scanning value)? scanning,
  }) {
    return scanning?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Waiting value)? waiting,
    TResult Function(Scanning value)? scanning,
    required TResult orElse(),
  }) {
    if (scanning != null) {
      return scanning(this);
    }
    return orElse();
  }
}

abstract class Scanning implements CardScannerState {
  const factory Scanning(final CardDetails? cardDetails) = _$ScanningImpl;

  CardDetails? get cardDetails;

  /// Create a copy of CardScannerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScanningImplCopyWith<_$ScanningImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
