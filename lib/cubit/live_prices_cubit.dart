import 'package:bloc/bloc.dart';
import 'dart:async';
import '../service/crypto_ws_client.dart';
import '../model/live_price.dart';
import 'package:meta/meta.dart';

part 'live_prices_state.dart';

/// Cubit for managing live crypto prices.
/// Can use real WebSocket or mock data for easy testing.
class LivePricesCubit extends Cubit<LivePricesState> {
  final CryptoWsClient wsClient;
  StreamSubscription? _subscription;

  LivePricesCubit(this.wsClient) : super(LivePricesInitial());

  void start() {
    _subscription = wsClient.connect().listen((livePrice) {
      // You can emit a new state here if you want to use Bloc state for updates
      // For now, this is just a placeholder for your logic
    });
  }

  Stream<LivePrice> getRealTrade() {
    return wsClient.connect();
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    await wsClient.close();
    return super.close();
  }
}
