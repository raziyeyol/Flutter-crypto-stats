// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_price.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LivePrice _$LivePriceFromJson(Map<String, dynamic> json) {
  return _LivePrice.fromJson(json);
}

/// @nodoc
mixin _$LivePrice {
  String get title1 => throw _privateConstructorUsedError;
  String get title2 => throw _privateConstructorUsedError;
  String get symbolId => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  String get takerSide => throw _privateConstructorUsedError;
  String? get iconUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LivePriceCopyWith<LivePrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LivePriceCopyWith<$Res> {
  factory $LivePriceCopyWith(LivePrice value, $Res Function(LivePrice) then) =
      _$LivePriceCopyWithImpl<$Res, LivePrice>;
  @useResult
  $Res call(
      {String title1,
      String title2,
      String symbolId,
      String? price,
      String takerSide,
      String? iconUrl});
}

/// @nodoc
class _$LivePriceCopyWithImpl<$Res, $Val extends LivePrice>
    implements $LivePriceCopyWith<$Res> {
  _$LivePriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title1 = null,
    Object? title2 = null,
    Object? symbolId = null,
    Object? price = freezed,
    Object? takerSide = null,
    Object? iconUrl = freezed,
  }) {
    return _then(_value.copyWith(
      title1: null == title1
          ? _value.title1
          : title1 // ignore: cast_nullable_to_non_nullable
              as String,
      title2: null == title2
          ? _value.title2
          : title2 // ignore: cast_nullable_to_non_nullable
              as String,
      symbolId: null == symbolId
          ? _value.symbolId
          : symbolId // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      takerSide: null == takerSide
          ? _value.takerSide
          : takerSide // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LivePriceImplCopyWith<$Res>
    implements $LivePriceCopyWith<$Res> {
  factory _$$LivePriceImplCopyWith(
          _$LivePriceImpl value, $Res Function(_$LivePriceImpl) then) =
      __$$LivePriceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title1,
      String title2,
      String symbolId,
      String? price,
      String takerSide,
      String? iconUrl});
}

/// @nodoc
class __$$LivePriceImplCopyWithImpl<$Res>
    extends _$LivePriceCopyWithImpl<$Res, _$LivePriceImpl>
    implements _$$LivePriceImplCopyWith<$Res> {
  __$$LivePriceImplCopyWithImpl(
      _$LivePriceImpl _value, $Res Function(_$LivePriceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title1 = null,
    Object? title2 = null,
    Object? symbolId = null,
    Object? price = freezed,
    Object? takerSide = null,
    Object? iconUrl = freezed,
  }) {
    return _then(_$LivePriceImpl(
      title1: null == title1
          ? _value.title1
          : title1 // ignore: cast_nullable_to_non_nullable
              as String,
      title2: null == title2
          ? _value.title2
          : title2 // ignore: cast_nullable_to_non_nullable
              as String,
      symbolId: null == symbolId
          ? _value.symbolId
          : symbolId // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      takerSide: null == takerSide
          ? _value.takerSide
          : takerSide // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LivePriceImpl implements _LivePrice {
  const _$LivePriceImpl(
      {required this.title1,
      required this.title2,
      required this.symbolId,
      this.price,
      required this.takerSide,
      this.iconUrl});

  factory _$LivePriceImpl.fromJson(Map<String, dynamic> json) =>
      _$$LivePriceImplFromJson(json);

  @override
  final String title1;
  @override
  final String title2;
  @override
  final String symbolId;
  @override
  final String? price;
  @override
  final String takerSide;
  @override
  final String? iconUrl;

  @override
  String toString() {
    return 'LivePrice(title1: $title1, title2: $title2, symbolId: $symbolId, price: $price, takerSide: $takerSide, iconUrl: $iconUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LivePriceImpl &&
            (identical(other.title1, title1) || other.title1 == title1) &&
            (identical(other.title2, title2) || other.title2 == title2) &&
            (identical(other.symbolId, symbolId) ||
                other.symbolId == symbolId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.takerSide, takerSide) ||
                other.takerSide == takerSide) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, title1, title2, symbolId, price, takerSide, iconUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LivePriceImplCopyWith<_$LivePriceImpl> get copyWith =>
      __$$LivePriceImplCopyWithImpl<_$LivePriceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LivePriceImplToJson(
      this,
    );
  }
}

abstract class _LivePrice implements LivePrice {
  const factory _LivePrice(
      {required final String title1,
      required final String title2,
      required final String symbolId,
      final String? price,
      required final String takerSide,
      final String? iconUrl}) = _$LivePriceImpl;

  factory _LivePrice.fromJson(Map<String, dynamic> json) =
      _$LivePriceImpl.fromJson;

  @override
  String get title1;
  @override
  String get title2;
  @override
  String get symbolId;
  @override
  String? get price;
  @override
  String get takerSide;
  @override
  String? get iconUrl;
  @override
  @JsonKey(ignore: true)
  _$$LivePriceImplCopyWith<_$LivePriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
