// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CardData _$CardDataFromJson(Map<String, dynamic> json) => _CardData(
  cardNumber: json['cardNumber'] as String?,
  expiryDate: json['expiryDate'] as String?,
  cvv: json['cvv'] as String?,
);

Map<String, dynamic> _$CardDataToJson(_CardData instance) => <String, dynamic>{
  'cardNumber': instance.cardNumber,
  'expiryDate': instance.expiryDate,
  'cvv': instance.cvv,
};
