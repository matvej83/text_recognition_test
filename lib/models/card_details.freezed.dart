// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CardDetails _$CardDetailsFromJson(Map<String, dynamic> json) {
  return _CardDetails.fromJson(json);
}

/// @nodoc
mixin _$CardDetails {
  String? get cardNumber => throw _privateConstructorUsedError;
  String? get expiryDate => throw _privateConstructorUsedError;
  String? get cardIssuer => throw _privateConstructorUsedError;
  String? get cardHolderName => throw _privateConstructorUsedError;

  /// Serializes this CardDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CardDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CardDetailsCopyWith<CardDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardDetailsCopyWith<$Res> {
  factory $CardDetailsCopyWith(
          CardDetails value, $Res Function(CardDetails) then) =
      _$CardDetailsCopyWithImpl<$Res, CardDetails>;
  @useResult
  $Res call(
      {String? cardNumber,
      String? expiryDate,
      String? cardIssuer,
      String? cardHolderName});
}

/// @nodoc
class _$CardDetailsCopyWithImpl<$Res, $Val extends CardDetails>
    implements $CardDetailsCopyWith<$Res> {
  _$CardDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CardDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardNumber = freezed,
    Object? expiryDate = freezed,
    Object? cardIssuer = freezed,
    Object? cardHolderName = freezed,
  }) {
    return _then(_value.copyWith(
      cardNumber: freezed == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      cardIssuer: freezed == cardIssuer
          ? _value.cardIssuer
          : cardIssuer // ignore: cast_nullable_to_non_nullable
              as String?,
      cardHolderName: freezed == cardHolderName
          ? _value.cardHolderName
          : cardHolderName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CardDetailsImplCopyWith<$Res>
    implements $CardDetailsCopyWith<$Res> {
  factory _$$CardDetailsImplCopyWith(
          _$CardDetailsImpl value, $Res Function(_$CardDetailsImpl) then) =
      __$$CardDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? cardNumber,
      String? expiryDate,
      String? cardIssuer,
      String? cardHolderName});
}

/// @nodoc
class __$$CardDetailsImplCopyWithImpl<$Res>
    extends _$CardDetailsCopyWithImpl<$Res, _$CardDetailsImpl>
    implements _$$CardDetailsImplCopyWith<$Res> {
  __$$CardDetailsImplCopyWithImpl(
      _$CardDetailsImpl _value, $Res Function(_$CardDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CardDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardNumber = freezed,
    Object? expiryDate = freezed,
    Object? cardIssuer = freezed,
    Object? cardHolderName = freezed,
  }) {
    return _then(_$CardDetailsImpl(
      cardNumber: freezed == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      cardIssuer: freezed == cardIssuer
          ? _value.cardIssuer
          : cardIssuer // ignore: cast_nullable_to_non_nullable
              as String?,
      cardHolderName: freezed == cardHolderName
          ? _value.cardHolderName
          : cardHolderName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CardDetailsImpl extends _CardDetails {
  const _$CardDetailsImpl(
      {this.cardNumber, this.expiryDate, this.cardIssuer, this.cardHolderName})
      : super._();

  factory _$CardDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CardDetailsImplFromJson(json);

  @override
  final String? cardNumber;
  @override
  final String? expiryDate;
  @override
  final String? cardIssuer;
  @override
  final String? cardHolderName;

  @override
  String toString() {
    return 'CardDetails(cardNumber: $cardNumber, expiryDate: $expiryDate, cardIssuer: $cardIssuer, cardHolderName: $cardHolderName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardDetailsImpl &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.cardIssuer, cardIssuer) ||
                other.cardIssuer == cardIssuer) &&
            (identical(other.cardHolderName, cardHolderName) ||
                other.cardHolderName == cardHolderName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, cardNumber, expiryDate, cardIssuer, cardHolderName);

  /// Create a copy of CardDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CardDetailsImplCopyWith<_$CardDetailsImpl> get copyWith =>
      __$$CardDetailsImplCopyWithImpl<_$CardDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CardDetailsImplToJson(
      this,
    );
  }
}

abstract class _CardDetails extends CardDetails {
  const factory _CardDetails(
      {final String? cardNumber,
      final String? expiryDate,
      final String? cardIssuer,
      final String? cardHolderName}) = _$CardDetailsImpl;
  const _CardDetails._() : super._();

  factory _CardDetails.fromJson(Map<String, dynamic> json) =
      _$CardDetailsImpl.fromJson;

  @override
  String? get cardNumber;
  @override
  String? get expiryDate;
  @override
  String? get cardIssuer;
  @override
  String? get cardHolderName;

  /// Create a copy of CardDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CardDetailsImplCopyWith<_$CardDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
