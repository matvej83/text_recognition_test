// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CardData {

  String? get cardNumber;

  String? get expiryDate;

  String? get cvv;

  /// Create a copy of CardData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CardDataCopyWith<CardData> get copyWith =>
      _$CardDataCopyWithImpl<CardData>(this as CardData, _$identity);

  /// Serializes this CardData to a JSON map.
  Map<String, dynamic> toJson();


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CardData &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.cvv, cvv) || other.cvv == cvv));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cardNumber, expiryDate, cvv);

  @override
  String toString() {
    return 'CardData(cardNumber: $cardNumber, expiryDate: $expiryDate, cvv: $cvv)';
  }


}

/// @nodoc
abstract mixin class $CardDataCopyWith<$Res> {
  factory $CardDataCopyWith(CardData value,
      $Res Function(CardData) _then) = _$CardDataCopyWithImpl;

  @useResult
  $Res call({
    String? cardNumber, String? expiryDate, String? cvv
  });


}

/// @nodoc
class _$CardDataCopyWithImpl<$Res>
    implements $CardDataCopyWith<$Res> {
  _$CardDataCopyWithImpl(this._self, this._then);

  final CardData _self;
  final $Res Function(CardData) _then;

  /// Create a copy of CardData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call(
      {Object? cardNumber = freezed, Object? expiryDate = freezed, Object? cvv = freezed,}) {
    return _then(_self.copyWith(
      cardNumber: freezed == cardNumber
          ? _self.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
      as String?,
      expiryDate: freezed == expiryDate
          ? _self.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
      as String?,
      cvv: freezed == cvv
          ? _self.cvv
          : cvv // ignore: cast_nullable_to_non_nullable
      as String?,
    ));
  }

}


/// Adds pattern-matching-related methods to [CardData].
extension CardDataPatterns on CardData {
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

  TResult Function( _CardData value)? $default,{required TResult orElse(),}){
  final _that = this;
  switch (_that) {
  case _CardData() when $default != null:
  return $default(_that);case _:
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

  @optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CardData value) $default,){
  final _that = this;
  switch (_that) {
  case _CardData():
  return $default(_that);case _:
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

  @optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CardData value)? $default,){
  final _that = this;
  switch (_that) {
  case _CardData() when $default != null:
  return $default(_that);case _:
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

  @optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? cardNumber, String? expiryDate, String? cvv)? $default,{required TResult orElse(),}) {final _that = this;
  switch (_that) {
  case _CardData() when $default != null:
  return $default(_that.cardNumber,_that.expiryDate,_that.cvv);case _:
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

  @optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? cardNumber, String? expiryDate, String? cvv) $default,) {final _that = this;
  switch (_that) {
  case _CardData():
  return $default(_that.cardNumber,_that.expiryDate,_that.cvv);case _:
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

  @optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? cardNumber, String? expiryDate, String? cvv)? $default,) {final _that = this;
  switch (_that) {
  case _CardData() when $default != null:
  return $default(_that.cardNumber,_that.expiryDate,_that.cvv);case _:
  return null;

  }
  }

}

/// @nodoc
@JsonSerializable()
class _CardData extends CardData {
  const _CardData({this.cardNumber, this.expiryDate, this.cvv}) : super._();

  factory _CardData.fromJson(Map<String, dynamic> json) =>
      _$CardDataFromJson(json);

  @override final String? cardNumber;
  @override final String? expiryDate;
  @override final String? cvv;

  /// Create a copy of CardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CardDataCopyWith<_CardData> get copyWith =>
      __$CardDataCopyWithImpl<_CardData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CardDataToJson(this,);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _CardData &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.cvv, cvv) || other.cvv == cvv));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cardNumber, expiryDate, cvv);

  @override
  String toString() {
    return 'CardData(cardNumber: $cardNumber, expiryDate: $expiryDate, cvv: $cvv)';
  }


}

/// @nodoc
abstract mixin class _$CardDataCopyWith<$Res>
    implements $CardDataCopyWith<$Res> {
  factory _$CardDataCopyWith(_CardData value,
      $Res Function(_CardData) _then) = __$CardDataCopyWithImpl;

  @override
  @useResult
  $Res call({
    String? cardNumber, String? expiryDate, String? cvv
  });


}

/// @nodoc
class __$CardDataCopyWithImpl<$Res>
    implements _$CardDataCopyWith<$Res> {
  __$CardDataCopyWithImpl(this._self, this._then);

  final _CardData _self;
  final $Res Function(_CardData) _then;

  /// Create a copy of CardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call(
      {Object? cardNumber = freezed, Object? expiryDate = freezed, Object? cvv = freezed,}) {
    return _then(_CardData(
      cardNumber: freezed == cardNumber
          ? _self.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
      as String?,
      expiryDate: freezed == expiryDate
          ? _self.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
      as String?,
      cvv: freezed == cvv
          ? _self.cvv
          : cvv // ignore: cast_nullable_to_non_nullable
      as String?,
    ));
  }


}

// dart format on
