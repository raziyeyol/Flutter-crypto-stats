part of ui.library;

class BalanceCard extends StatelessWidget {
  const BalanceCard(
      {Key? key,
      required this.balance,
      required this.monthlyProfit,
      required this.profitPer})
      : super(key: key);

  final String balance;
  final String monthlyProfit;
  final String profitPer;

  @override
  Widget build(BuildContext context) {
    TextStyle whiteText = const TextStyle(color: Colors.white);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.blueAccent,
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Balance', style: whiteText.copyWith(fontSize: 17.0)),
              Text(
                balance,
                style: whiteText.copyWith(
                    fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Monthly Profit',
                              style: whiteText.copyWith(fontSize: 17.0)),
                          Text(monthlyProfit,
                              style: whiteText.copyWith(
                                  fontSize: 18.0, fontWeight: FontWeight.bold))
                        ]),
                    Container(
                        padding: const EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 5.0),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.15),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15.0))),
                        child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.arrow_drop_up,
                                size: 20.0,
                                color: Colors.greenAccent,
                              ),
                              Text(profitPer,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13.0)),
                            ]))
                  ])
            ]));
  }
}
