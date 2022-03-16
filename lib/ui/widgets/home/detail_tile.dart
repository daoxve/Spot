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
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title + ':',
                style: textTheme.subtitle2!.copyWith(
                  fontSize: 12.sp,
                  letterSpacing: 0.4,
                ),
                textAlign: TextAlign.center,
              ),
              Flexible(
                flex: 2,
                child: FittedBox(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 200.w),
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
