part of ui.library;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: _buildBody(context)));
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Profile(
              message: profilMessage,
              name: profilName,
              imageUrl: profileImageUrl),
          const SizedBox(height: 20.0),
          BalanceCard(
            balance: dummyBalance,
            monthlyProfit: dummyMonthlyProfit,
            profitPer: dummyPercent,
          ),
          const SizedBox(height: 20.0),
          LivePrices(),
          const SizedBox(height: 20.0),
          CryptoAsset(),
          const SizedBox(height: 10.0),
        ],
      ),
    ));
  }
}
