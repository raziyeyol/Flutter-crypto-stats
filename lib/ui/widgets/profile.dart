part of ui.library;

class Profile extends StatelessWidget {
  Profile(
      {Key? key,
      required this.message,
      required this.name,
      required this.imageUrl})
      : super(key: key);

  final String message;
  final String name;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
        Widget>[
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Text(message, style: TextStyle(fontSize: 17.0)),
        Text(name,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
      ]),
      CachedCircleAvatar(url: imageUrl),
    ]);
  }
}
