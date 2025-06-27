import 'package:freezed_annotation/freezed_annotation.dart';

part 'live_price.freezed.dart';
part 'live_price.g.dart';

@freezed
class LivePrice with _$LivePrice {
  const factory LivePrice({
    required String title1,
    required String title2,
    required String symbolId,
    String? price,
    required String takerSide,
    String? iconUrl,
  }) = _LivePrice;

  factory LivePrice.fromJson(Map<String, dynamic> json) =>
      _$LivePriceFromJson(json);
}

final List<LivePrice> tradeList = [
  LivePrice(
    title1: 'BTC',
    title2: '/USD',
    symbolId: 'COINBASE_SPOT_BTC_USD',
    price: '',
    takerSide: '',
    iconUrl:
        'http://s3.eu-central-1.amazonaws.com/bbxt-static-icons/type-id/png_512/4caf2b16a0174e26a3482cea69c34cba.png',
  ),
  LivePrice(
    title1: 'ETH',
    title2: '/USD',
    symbolId: 'COINBASE_SPOT_ETH_USD',
    price: '',
    takerSide: '',
    iconUrl:
        'http://s3.eu-central-1.amazonaws.com/bbxt-static-icons/type-id/png_16/04836ff3bc4d4d95820e0155594dca86.png',
  ),
  LivePrice(
    title1: 'ADA',
    title2: '/USD',
    symbolId: 'COINBASE_SPOT_ADA_USD',
    price: '',
    takerSide: '',
    iconUrl:
        'https://s3.eu-central-1.amazonaws.com/bbxt-static-icons/type-id/png_512/2701173b1b7740f286939659359e225c.png',
  ),
];
