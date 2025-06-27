// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LivePriceImpl _$$LivePriceImplFromJson(Map<String, dynamic> json) =>
    _$LivePriceImpl(
      title1: json['title1'] as String,
      title2: json['title2'] as String,
      symbolId: json['symbolId'] as String,
      price: json['price'] as String?,
      takerSide: json['takerSide'] as String,
      iconUrl: json['iconUrl'] as String?,
    );

Map<String, dynamic> _$$LivePriceImplToJson(_$LivePriceImpl instance) =>
    <String, dynamic>{
      'title1': instance.title1,
      'title2': instance.title2,
      'symbolId': instance.symbolId,
      'price': instance.price,
      'takerSide': instance.takerSide,
      'iconUrl': instance.iconUrl,
    };
