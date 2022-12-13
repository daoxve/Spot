import 'package:spot/core/utils/exports.dart';

class DetailTile extends StatelessWidget {
  const DetailTile({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return SizedBox(
      height: 70,
      child: Card(
        elevation: 4,
        color: theme.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$title:',
                style: textTheme.subtitle2!.copyWith(
                  fontSize: 12.0,
                  letterSpacing: 0.4,
                ),
                textAlign: TextAlign.center,
              ),
              Flexible(
                flex: 2,
                child: FittedBox(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 200.0),
                    child: Text(
                      content,
                      style: textTheme.headline2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
