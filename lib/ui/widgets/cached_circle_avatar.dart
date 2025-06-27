part of ui.library;

class CachedCircleAvatar extends StatelessWidget {
  final String url;
  const CachedCircleAvatar({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 20.0, backgroundImage: CachedNetworkImageProvider(url));
  }
}
