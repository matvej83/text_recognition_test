// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_scanner_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CardScannerEvent {


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CardScannerEvent);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CardScannerEvent()';
  }


}

/// @nodoc
class $CardScannerEventCopyWith<$Res> {
  $CardScannerEventCopyWith(CardScannerEvent _,
      $Res Function(CardScannerEvent) __);
}


/// Adds pattern-matching-related methods to [CardScannerEvent].
extension CardScannerEventPatterns on CardScannerEvent {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs TResult maybeMap

  <

  TResult

  extends

  Object?

  >

  (

  {

  TResult

  Function

  (

  Started

  value

  )

  ?

  started

  ,

  TResult

  Function

  (

  CardScanned

  value

  )

  ?

  cardScanned

  ,

  TResult

  Function

  (

  CardScannedAlt

  value

  )

  ?

  cardScannedAlt

  ,

  required

  TResult

  orElse

  (

  )

  ,
}){
final _that = this;
switch (_that) {
case Started() when started != null:
return started(_that);case CardScanned() when cardScanned != null:
return cardScanned(_that);case CardScannedAlt() when cardScannedAlt != null:
return cardScannedAlt(_that);case _:
return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs
TResult map<TResult extends Object?>(
    {required TResult Function( Started value) started, required TResult Function( CardScanned value) cardScanned, required TResult Function( CardScannedAlt value) cardScannedAlt,}) {
  final _that = this;
  switch (_that) {
    case Started():
      return started(_that);
    case CardScanned():
      return cardScanned(_that);
    case CardScannedAlt():
      return cardScannedAlt(_that);
    case _:
      throw StateError('Unexpected subclass');
  }
}

/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs
TResult? mapOrNull<TResult extends Object?>(
    {TResult? Function( Started value)? started, TResult? Function( CardScanned value)? cardScanned, TResult? Function( CardScannedAlt value)? cardScannedAlt,}) {
  final _that = this;
  switch (_that) {
    case Started() when started != null:
      return started(_that);
    case CardScanned() when cardScanned != null:
      return cardScanned(_that);
    case CardScannedAlt() when cardScannedAlt != null:
      return cardScannedAlt(_that);
    case _:
      return null;
  }
}

/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen
<
TResult extends Object?>(
{
TResult
Function
(
)
?
started
,
TResult
Function
(
)
?
cardScanned
,
TResult
Function
(
String
?
text
)
?
cardScannedAlt
,
required
TResult
orElse(),}) {final _that = this;
switch (_that) {
case Started() when started != null:
return started();case CardScanned() when cardScanned != null:
return cardScanned();case CardScannedAlt() when cardScannedAlt != null:
return cardScannedAlt(_that.text);case _:
return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function() started,required TResult Function() cardScanned,required TResult Function( String? text) cardScannedAlt,}) {final _that = this;
switch (_that) {
case Started():
return started();case CardScanned():
return cardScanned();case CardScannedAlt():
return cardScannedAlt(_that.text);case _:
throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()? started,TResult? Function()? cardScanned,TResult? Function( String? text)? cardScannedAlt,}) {final _that = this;
switch (_that) {
case Started() when started != null:
return started();case CardScanned() when cardScanned != null:
return cardScanned();case CardScannedAlt() when cardScannedAlt != null:
return cardScannedAlt(_that.text);case _:
return null;

}
}

}

/// @nodoc


class Started implements CardScannerEvent {
const Started();


@override
bool operator ==(Object other) {
return identical(this, other) || (other.runtimeType == runtimeType&&other is Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
return 'CardScannerEvent.started()';
}


}


/// @nodoc


class CardScanned implements CardScannerEvent {
const CardScanned();


@override
bool operator ==(Object other) {
return identical(this, other) || (other.runtimeType == runtimeType&&other is CardScanned);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
return 'CardScannerEvent.cardScanned()';
}


}


/// @nodoc


class CardScannedAlt implements CardScannerEvent {
const CardScannedAlt(this.text);


final String? text;

/// Create a copy of CardScannerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CardScannedAltCopyWith<CardScannedAlt> get copyWith => _$CardScannedAltCopyWithImpl<CardScannedAlt>(this, _$identity);


@override
bool operator ==(Object other) {
return identical(this, other) || (other.runtimeType == runtimeType&&other is CardScannedAlt&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,text);

@override
String toString() {
return 'CardScannerEvent.cardScannedAlt(text: $text)';
}


}

/// @nodoc
abstract mixin class $CardScannedAltCopyWith<$Res> implements $CardScannerEventCopyWith<$Res> {
factory $CardScannedAltCopyWith(CardScannedAlt value, $Res Function(CardScannedAlt) _then) = _$CardScannedAltCopyWithImpl;
@useResult
$Res call({
String? text
});


}
/// @nodoc
class _$CardScannedAltCopyWithImpl<$Res>
implements $CardScannedAltCopyWith<$Res> {
_$CardScannedAltCopyWithImpl(this._self, this._then);

final CardScannedAlt _self;
final $Res Function(CardScannedAlt) _then;

/// Create a copy of CardScannerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = freezed,}) {
return _then(CardScannedAlt(
freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,
));
}


}

/// @nodoc
mixin _$CardScannerState {


@override
bool operator ==(Object other) {
return identical(this, other) || (other.runtimeType == runtimeType&&other is CardScannerState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
return 'CardScannerState()';
}


}

/// @nodoc
class $CardScannerStateCopyWith<$Res> {
$CardScannerStateCopyWith(CardScannerState _, $Res Function(CardScannerState) __);
}


/// Adds pattern-matching-related methods to [CardScannerState].
extension CardScannerStatePatterns on CardScannerState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)? initial,TResult Function( Waiting value)? waiting,TResult Function( Scanning value)? scanning,TResult Function( ScanningAlt value)? scanningAlt,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Waiting() when waiting != null:
return waiting(_that);case Scanning() when scanning != null:
return scanning(_that);case ScanningAlt() when scanningAlt != null:
return scanningAlt(_that);case _:
return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value) initial,required TResult Function( Waiting value) waiting,required TResult Function( Scanning value) scanning,required TResult Function( ScanningAlt value) scanningAlt,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Waiting():
return waiting(_that);case Scanning():
return scanning(_that);case ScanningAlt():
return scanningAlt(_that);case _:
throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)? initial,TResult? Function( Waiting value)? waiting,TResult? Function( Scanning value)? scanning,TResult? Function( ScanningAlt value)? scanningAlt,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Waiting() when waiting != null:
return waiting(_that);case Scanning() when scanning != null:
return scanning(_that);case ScanningAlt() when scanningAlt != null:
return scanningAlt(_that);case _:
return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()? initial,TResult Function()? waiting,TResult Function( CardDetails? cardDetails)? scanning,TResult Function( CardData? cardData)? scanningAlt,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Waiting() when waiting != null:
return waiting();case Scanning() when scanning != null:
return scanning(_that.cardDetails);case ScanningAlt() when scanningAlt != null:
return scanningAlt(_that.cardData);case _:
return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function() initial,required TResult Function() waiting,required TResult Function( CardDetails? cardDetails) scanning,required TResult Function( CardData? cardData) scanningAlt,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Waiting():
return waiting();case Scanning():
return scanning(_that.cardDetails);case ScanningAlt():
return scanningAlt(_that.cardData);case _:
throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()? initial,TResult? Function()? waiting,TResult? Function( CardDetails? cardDetails)? scanning,TResult? Function( CardData? cardData)? scanningAlt,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Waiting() when waiting != null:
return waiting();case Scanning() when scanning != null:
return scanning(_that.cardDetails);case ScanningAlt() when scanningAlt != null:
return scanningAlt(_that.cardData);case _:
return null;

}
}

}

/// @nodoc


class Initial implements CardScannerState {
const Initial();


@override
bool operator ==(Object other) {
return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
return 'CardScannerState.initial()';
}


}


/// @nodoc


class Waiting implements CardScannerState {
const Waiting();


@override
bool operator ==(Object other) {
return identical(this, other) || (other.runtimeType == runtimeType&&other is Waiting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
return 'CardScannerState.waiting()';
}


}


/// @nodoc


class Scanning implements CardScannerState {
const Scanning(this.cardDetails);


final CardDetails? cardDetails;

/// Create a copy of CardScannerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScanningCopyWith<Scanning> get copyWith => _$ScanningCopyWithImpl<Scanning>(this, _$identity);


@override
bool operator ==(Object other) {
return identical(this, other) || (other.runtimeType == runtimeType&&other is Scanning&&(identical(other.cardDetails, cardDetails) || other.cardDetails == cardDetails));
}


@override
int get hashCode => Object.hash(runtimeType,cardDetails);

@override
String toString() {
return 'CardScannerState.scanning(cardDetails: $cardDetails)';
}


}

/// @nodoc
abstract mixin class $ScanningCopyWith<$Res> implements $CardScannerStateCopyWith<$Res> {
factory $ScanningCopyWith(Scanning value, $Res Function(Scanning) _then) = _$ScanningCopyWithImpl;
@useResult
$Res call({
CardDetails? cardDetails
});


}
/// @nodoc
class _$ScanningCopyWithImpl<$Res>
implements $ScanningCopyWith<$Res> {
_$ScanningCopyWithImpl(this._self, this._then);

final Scanning _self;
final $Res Function(Scanning) _then;

/// Create a copy of CardScannerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cardDetails = freezed,}) {
return _then(Scanning(
freezed == cardDetails ? _self.cardDetails : cardDetails // ignore: cast_nullable_to_non_nullable
as CardDetails?,
));
}


}

/// @nodoc


class ScanningAlt implements CardScannerState {
const ScanningAlt(this.cardData);


final CardData? cardData;

/// Create a copy of CardScannerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScanningAltCopyWith<ScanningAlt> get copyWith => _$ScanningAltCopyWithImpl<ScanningAlt>(this, _$identity);


@override
bool operator ==(Object other) {
return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanningAlt&&(identical(other.cardData, cardData) || other.cardData == cardData));
}


@override
int get hashCode => Object.hash(runtimeType,cardData);

@override
String toString() {
return 'CardScannerState.scanningAlt(cardData: $cardData)';
}


}

/// @nodoc
abstract mixin class $ScanningAltCopyWith<$Res> implements $CardScannerStateCopyWith<$Res> {
factory $ScanningAltCopyWith(ScanningAlt value, $Res Function(ScanningAlt) _then) = _$ScanningAltCopyWithImpl;
@useResult
$Res call({
CardData? cardData
});


$CardDataCopyWith<$Res>? get cardData;

}
/// @nodoc
class _$ScanningAltCopyWithImpl<$Res>
implements $ScanningAltCopyWith<$Res> {
_$ScanningAltCopyWithImpl(this._self, this._then);

final ScanningAlt _self;
final $Res Function(ScanningAlt) _then;

/// Create a copy of CardScannerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cardData = freezed,}) {
return _then(ScanningAlt(
freezed == cardData ? _self.cardData : cardData // ignore: cast_nullable_to_non_nullable
as CardData?,
));
}

/// Create a copy of CardScannerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CardDataCopyWith<$Res>? get cardData {
if (_self.cardData == null) {
return null;
}

return $CardDataCopyWith<$Res>(_self.cardData!, (value) {
return _then(_self.copyWith(cardData: value));
});
}
}

// dart format on
