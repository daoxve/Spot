import 'package:spot/core/utils/exports.dart';

class DetailChip extends StatelessWidget {
  const DetailChip({
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

    return Column(
      children: [
        Text(
          title,
          style: textTheme.subtitle2!.copyWith(
            fontSize: 14,
            letterSpacing: 0.4,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          content,
          style: textTheme.headline6!.copyWith(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
