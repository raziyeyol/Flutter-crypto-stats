part of ui.library;

// import 'package:intl/intl.dart';

class LivePrices extends StatefulWidget {
  const LivePrices({Key? key}) : super(key: key);

  @override
  _LivePricesState createState() => _LivePricesState();
}

class _LivePricesState extends State<LivePrices> {
  DateTime? lastUpdated;

  @override
  Widget build(BuildContext context) {
    final realTradeStream =
        BlocProvider.of<LivePricesCubit>(context).getRealTrade();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text('Live Prices', style: _titleStyle),
        const SizedBox(height: 12),
        SizedBox(
          height: 270.0,
          child: StreamBuilder(
            stream: realTradeStream,
            builder: (context, snapshot) {
              final hasRealData = tradeList.any(
                  (item) => (item.price != null && item.price!.isNotEmpty));
              if (snapshot.hasData) {
                lastUpdated = DateTime.now();
                final realTrade =
                    LivePrice.fromJson(jsonDecode(snapshot.data.toString()));
                for (var item in tradeList) {
                  if (item.symbolId == realTrade.symbolId) {
                    item.price = realTrade.price;
                    item.takerSide = realTrade.takerSide;
                  }
                }
              }
              return hasRealData
                  ? _buildLivePriceList()
                  : _buildSampleLivePriceList();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildLivePriceList() {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: tradeList.length,
      separatorBuilder: (context, index) => const SizedBox(width: 20),
      itemBuilder: (context, index) => _LivePriceCard(
        iconUrl: tradeList[index].iconUrl!,
        title: tradeList[index].title1 + tradeList[index].title2,
        price: tradeList[index].price ?? '-',
        takerSide: tradeList[index].takerSide,
        lastUpdated: lastUpdated,
      ),
    );
  }

  Widget _buildSampleLivePriceList() {
    const sample = [
      {
        'title': 'BTC/USD',
        'iconUrl':
            'http://s3.eu-central-1.amazonaws.com/bbxt-static-icons/type-id/png_512/4caf2b16a0174e26a3482cea69c34cba.png',
        'price': '31,200',
        'takerSide': 'buy',
      },
      {
        'title': 'ETH/USD',
        'iconUrl':
            'http://s3.eu-central-1.amazonaws.com/bbxt-static-icons/type-id/png_16/04836ff3bc4d4d95820e0155594dca86.png',
        'price': '2,150',
        'takerSide': 'sell',
      },
      {
        'title': 'ADA/USD',
        'iconUrl':
            'https://s3.eu-central-1.amazonaws.com/bbxt-static-icons/type-id/png_512/2701173b1b7740f286939659359e225c.png',
        'price': '0.45',
        'takerSide': 'buy',
      },
    ];
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: sample.length,
      separatorBuilder: (context, index) => const SizedBox(width: 20),
      itemBuilder: (context, index) => _LivePriceCard(
        iconUrl: sample[index]['iconUrl']!,
        title: sample[index]['title']!,
        price: sample[index]['price']!,
        takerSide: sample[index]['takerSide']!,
        lastUpdated: null,
      ),
    );
  }
}

class _LivePriceCard extends StatelessWidget {
  final String iconUrl;
  final String title;
  final String price;
  final String takerSide;
  final DateTime? lastUpdated;

  const _LivePriceCard({
    required this.iconUrl,
    required this.title,
    required this.price,
    required this.takerSide,
    this.lastUpdated,
  });

  @override
  Widget build(BuildContext context) {
    final isBuy = takerSide.toLowerCase() == 'buy';
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Container(
        width: 280,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blue.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                CachedCircleAvatar(url: iconUrl),
                const SizedBox(width: 18),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: isBuy ? Colors.green.shade100 : Colors.red.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isBuy ? Icons.arrow_upward : Icons.arrow_downward,
                        color: isBuy ? Colors.green : Colors.red,
                        size: 18,
                      ),
                      Text(
                        takerSide.toUpperCase(),
                        style: TextStyle(
                          color: isBuy ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Text(
                price,
                key: ValueKey(price),
                style: _priceStyle,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              lastUpdated != null
                  ? 'Updated: ${DateFormat("HH:mm:ss.SSS").format(lastUpdated!)} (${_formatTimeAgo(lastUpdated!)})'
                  : 'Updated: -',
              style: _updatedStyle,
            ),
          ],
        ),
      ),
    );
  }

  String _formatTimeAgo(DateTime lastUpdated) {
    final diff = DateTime.now().difference(lastUpdated).inMilliseconds;
    if (diff < 1000) return 'just now';
    return '${(diff / 1000).toStringAsFixed(2)}s ago';
  }
}

// --- Styles ---
const _titleStyle = TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold);
const _cardTitleStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
const _priceStyle = TextStyle(
    fontSize: 36, fontWeight: FontWeight.bold, color: Colors.blueAccent);
const _updatedStyle = TextStyle(fontSize: 12, color: Colors.grey);
