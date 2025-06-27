// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crypto_asset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CryptoAsset _$CryptoAssetFromJson(Map<String, dynamic> json) {
  return _CryptoAsset.fromJson(json);
}

/// @nodoc
mixin _$CryptoAsset {
  String get assetId => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CryptoAssetCopyWith<CryptoAsset> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CryptoAssetCopyWith<$Res> {
  factory $CryptoAssetCopyWith(
          CryptoAsset value, $Res Function(CryptoAsset) then) =
      _$CryptoAssetCopyWithImpl<$Res, CryptoAsset>;
  @useResult
  $Res call({String assetId, String url});
}

/// @nodoc
class _$CryptoAssetCopyWithImpl<$Res, $Val extends CryptoAsset>
    implements $CryptoAssetCopyWith<$Res> {
  _$CryptoAssetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assetId = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      assetId: null == assetId
          ? _value.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CryptoAssetImplCopyWith<$Res>
    implements $CryptoAssetCopyWith<$Res> {
  factory _$$CryptoAssetImplCopyWith(
          _$CryptoAssetImpl value, $Res Function(_$CryptoAssetImpl) then) =
      __$$CryptoAssetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String assetId, String url});
}

/// @nodoc
class __$$CryptoAssetImplCopyWithImpl<$Res>
    extends _$CryptoAssetCopyWithImpl<$Res, _$CryptoAssetImpl>
    implements _$$CryptoAssetImplCopyWith<$Res> {
  __$$CryptoAssetImplCopyWithImpl(
      _$CryptoAssetImpl _value, $Res Function(_$CryptoAssetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assetId = null,
    Object? url = null,
  }) {
    return _then(_$CryptoAssetImpl(
      assetId: null == assetId
          ? _value.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CryptoAssetImpl implements _CryptoAsset {
  const _$CryptoAssetImpl({required this.assetId, required this.url});

  factory _$CryptoAssetImpl.fromJson(Map<String, dynamic> json) =>
      _$$CryptoAssetImplFromJson(json);

  @override
  final String assetId;
  @override
  final String url;

  @override
  String toString() {
    return 'CryptoAsset(assetId: $assetId, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CryptoAssetImpl &&
            (identical(other.assetId, assetId) || other.assetId == assetId) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, assetId, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CryptoAssetImplCopyWith<_$CryptoAssetImpl> get copyWith =>
      __$$CryptoAssetImplCopyWithImpl<_$CryptoAssetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CryptoAssetImplToJson(
      this,
    );
  }
}

abstract class _CryptoAsset implements CryptoAsset {
  const factory _CryptoAsset(
      {required final String assetId,
      required final String url}) = _$CryptoAssetImpl;

  factory _CryptoAsset.fromJson(Map<String, dynamic> json) =
      _$CryptoAssetImpl.fromJson;

  @override
  String get assetId;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$CryptoAssetImplCopyWith<_$CryptoAssetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
