import 'dart:async';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../model/live_price.dart';
import '../helpers/constants.dart';

abstract class CryptoWsClient {
  Stream<LivePrice> connect();
  Future<void> close();
}

// Real implementation using CoinAPI WebSocket
class CoinApiWsClient implements CryptoWsClient {
  final String apiKey;
  WebSocketChannel? _channel;

  CoinApiWsClient({required this.apiKey});

  @override
  Stream<LivePrice> connect() {
    _channel = WebSocketChannel.connect(Uri.parse(webSocketUrl));
    _channel!.sink.add(json.encode({
      "type": "hello",
      "apikey": apiKey,
      "heartbeat": false,
      "subscribe_data_type": ["trade"],
      "subscribe_filter_symbol_id": [
        r"COINBASE_SPOT_BTC_USD$",
        r"COINBASE_SPOT_ETH_USD$",
        r"COINBASE_SPOT_ADA_USD$"
      ]
    }));
    return _channel!.stream
        .map((event) => LivePrice.fromJson(jsonDecode(event)));
  }

  @override
  Future<void> close() async {
    await _channel?.sink.close();
  }
}

// Mock implementation for testing or offline mode
class MockWsClient implements CryptoWsClient {
  StreamController<LivePrice>? _controller;
  Timer? _timer;

  @override
  Stream<LivePrice> connect() {
    _controller = StreamController<LivePrice>.broadcast();
    int tick = 0;
    final symbols = [
      'COINBASE_SPOT_BTC_USD',
      'COINBASE_SPOT_ETH_USD',
      'COINBASE_SPOT_ADA_USD',
    ];
    final sides = ['buy', 'sell'];
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      final symbol = symbols[tick % symbols.length];
      final price = (30000 + tick * 10).toString();
      final takerSide = sides[tick % sides.length];
      _controller?.add(LivePrice.fromJson({
        'symbol_id': symbol,
        'price': price,
        'taker_side': takerSide,
      }));
      tick++;
    });
    return _controller!.stream;
  }

  @override
  Future<void> close() async {
    await _controller?.close();
    _timer?.cancel();
  }
}
