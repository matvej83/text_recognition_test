// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardDetailsImpl _$$CardDetailsImplFromJson(Map<String, dynamic> json) =>
    _$CardDetailsImpl(
      cardNumber: json['cardNumber'] as String?,
      expiryDate: json['expiryDate'] as String?,
      cardIssuer: json['cardIssuer'] as String?,
      cardHolderName: json['cardHolderName'] as String?,
    );

Map<String, dynamic> _$$CardDetailsImplToJson(_$CardDetailsImpl instance) =>
    <String, dynamic>{
      'cardNumber': instance.cardNumber,
      'expiryDate': instance.expiryDate,
      'cardIssuer': instance.cardIssuer,
      'cardHolderName': instance.cardHolderName,
    };
