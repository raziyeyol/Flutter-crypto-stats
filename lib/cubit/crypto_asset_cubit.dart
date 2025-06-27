import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '/model/crypto_asset.dart';
import '/service/repository.dart';

part 'crypto_asset_state.dart';

class CryptoAssetCubit extends Cubit<CryptoAssetState> {
  final IRepository _repository;

  CryptoAssetCubit(this._repository) : super(CryptoInitial());

  void getCryptoAssets() {
    _repository.getCryptoAssets().then((cryptoAssets) {
      emit(CryptoLoaded(cryptoAssets: cryptoAssets));
    });
  }
}
