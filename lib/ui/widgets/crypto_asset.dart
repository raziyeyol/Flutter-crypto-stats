part of ui.library;

class CryptoAsset extends StatelessWidget {
  const CryptoAsset({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CryptoAssetCubit>(context).getCryptoAssets();
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("Crypto assets", style: TextStyle(fontSize: 18.0)),
          Container(
              height: 400,
              padding: const EdgeInsets.only(top: 20.0),
              child: BlocBuilder<CryptoAssetCubit, CryptoAssetState>(
                  builder: (context, state) {
                if (state is! CryptoLoaded) {
                  return const Center(child: CircularProgressIndicator());
                }
                final cryptoAssets = state.cryptoAssets;
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: cryptoAssets.length,
                    itemBuilder: (context, index) {
                      return Card(
                          child: ListTile(
                              leading: CachedCircleAvatar(
                                  url: cryptoAssets[index].url),
                              title: Center(
                                  child: Text(cryptoAssets[index].assetId,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)))));
                    });
              }))
        ]);
  }
}
