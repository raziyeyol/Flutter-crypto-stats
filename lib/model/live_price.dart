class LivePrice {
  String title1;
  String title2;
  String symbolId;
  String? price;
  String takerSide;
  String? iconUrl;

  LivePrice(this.title1, this.title2, this.symbolId, this.price, this.takerSide,
      [this.iconUrl]);

  LivePrice.fromJson(Map<String, dynamic> json)
      : title1 = json['symbol_id']!.toString().split('_')[2],
        title2 = '/' + json['symbol_id']!.toString().split('_')[3],
        symbolId = json['symbol_id']!,
        price = json['price']!.toString(),
        takerSide = json['taker_side']!;
}

final List<LivePrice> tradeList = [
  LivePrice('BTC', '/USD', 'COINBASE_SPOT_BTC_USD', '', '',
      'http://s3.eu-central-1.amazonaws.com/bbxt-static-icons/type-id/png_512/4caf2b16a0174e26a3482cea69c34cba.png'),
  LivePrice('ETH', '/USD', 'COINBASE_SPOT_ETH_USD', '', '',
      'http://s3.eu-central-1.amazonaws.com/bbxt-static-icons/type-id/png_16/04836ff3bc4d4d95820e0155594dca86.png'),
  LivePrice('ADA', '/USD', 'COINBASE_SPOT_ADA_USD', '', '',
      'https://s3.eu-central-1.amazonaws.com/bbxt-static-icons/type-id/png_512/2701173b1b7740f286939659359e225c.png'),
];
