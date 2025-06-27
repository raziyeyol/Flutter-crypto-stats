import 'package:bloc/bloc.dart';
import 'dart:async';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../helpers/constants.dart';
import 'package:meta/meta.dart';

part 'live_prices_state.dart';

/// Cubit for managing live crypto prices.
/// Can use real WebSocket or mock data for easy testing.
class LivePricesCubit extends Cubit<LivePricesState> {
  final bool mock;
  WebSocketChannel? _channel;
  StreamController<String>? _mockController;

  LivePricesCubit({this.mock = false}) : super(LivePricesInitial()) {
    if (mock) {
      _mockController = StreamController<String>.broadcast();
      _startMockStream();
    } else {
      _channel = WebSocketChannel.connect(Uri.parse(webSocketUrl));
    }
  }

  /// Starts emitting mock price data for BTC, ETH, ADA.
  void _startMockStream() {
    final symbols = [
      'COINBASE_SPOT_BTC_USD',
      'COINBASE_SPOT_ETH_USD',
      'COINBASE_SPOT_ADA_USD',
    ];
    final sides = ['buy', 'sell'];
    // Emit initial data for all symbols
    Future.microtask(() {
      for (int i = 0; i < symbols.length; i++) {
        final jsonData = json.encode({
          'symbol_id': symbols[i],
          'price': (30000 + i * 1000).toString(),
          'taker_side': sides[i % sides.length],
        });
        _mockController?.add(jsonData);
      }
    });
    // Emit a new event every second, cycling through symbols
    int tick = 0;
    Timer.periodic(Duration(seconds: 1), (timer) {
      final jsonData = json.encode({
        'symbol_id': symbols[tick % symbols.length],
        'price': (30000 + tick * 10).toString(),
        'taker_side': sides[tick % sides.length],
      });
      _mockController?.add(jsonData);
      tick++;
    });
  }

  @override
  Future<void> close() {
    _channel?.sink.close();
    _mockController?.close();
    return super.close();
  }

  /// Returns a stream of price updates (real or mock).
  Stream getRealTrade() {
    if (mock) {
      return _mockController!.stream;
    }
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
    return _channel!.stream;
  }
}
