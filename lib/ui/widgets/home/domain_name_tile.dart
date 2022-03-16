import 'package:spot/core/utils/exports.dart';

class DomainNameTile extends StatelessWidget {
  const DomainNameTile({
    Key? key,
    required this.label,
    required this.statusText,
    required this.backgroundColor,
  }) : super(key: key);

  final String label;
  final String statusText;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return SizedBox(
      height: 85.h,
      child: Card(
        elevation: 2,
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.w),
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Label
              Flexible(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 12.h),
                    child: Text(
                      label,
                      style: textTheme.subtitle2!.copyWith(
                        fontSize: 14.sp,
                        color: textTheme.subtitle2!.color,
                      ),
                    ),
                  ),
                ),
              ),

              // Status Text
              Flexible(
                flex: 2,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(18.w, 0, 3.w, 12.h),
                    child: FittedBox(
                      child: Text(
                        statusText,
                        style: textTheme.headline1,
                      ),
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
