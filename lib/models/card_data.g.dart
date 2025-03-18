// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardDataImpl _$$CardDataImplFromJson(Map<String, dynamic> json) =>
    _$CardDataImpl(
      cardNumber: json['cardNumber'] as String?,
      expiryDate: json['expiryDate'] as String?,
      cvv: json['cvv'] as String?,
    );

Map<String, dynamic> _$$CardDataImplToJson(_$CardDataImpl instance) =>
    <String, dynamic>{
      'cardNumber': instance.cardNumber,
      'expiryDate': instance.expiryDate,
      'cvv': instance.cvv,
    };
