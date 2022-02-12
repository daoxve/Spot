import 'package:spot/core/utils/exports.dart';

class StatusTile extends StatelessWidget {
  const StatusTile({
    Key? key,
    required this.trailingText,
    required this.statusBoxColor,
    required this.tileColor,
  }) : super(key: key);

  final String trailingText;
  final Color statusBoxColor;
  final Color tileColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return SizedBox(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Card(
          elevation: 2,
          color: tileColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      trailingText,
                      style: textTheme.headline6!.copyWith(
                        fontSize: 18,
                        color: kcGreen,
                      ),
                    ),
                  ),
                ),
                Gap().whiteSpaceW,
                // Checkbox
                CircleAvatar(
                  radius: 20,
                  backgroundColor: statusBoxColor,
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
