import 'package:spot/core/utils/exports.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LabelledAvatar extends StatelessWidget {
  const LabelledAvatar({
    Key? key,
    required this.theme,
    required this.textTheme,
    required this.isImageDark,
    required this.imagePath,
    required this.label,
    this.labelSize,
    this.borderRadius,
  }) : super(key: key);

  final ThemeData theme;
  final TextTheme textTheme;
  final bool isImageDark;
  final String imagePath;
  final String label;
  final double? labelSize;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    final logoImage = ClipRRect(
      borderRadius: BorderRadius.circular(
        getValueForScreenType<double>(
          context: context,
          mobile: 100,
          tablet: 30,
          desktop: 10,
        ),
      ),
      child: Image.asset(
        imagePath,
        fit: BoxFit.fill,
      ),
    );

    return Column(
      children: [
        Container(
          width: getValueForScreenType<double>(
            context: context,
            mobile: 95.0,
            tablet: 120.0,
            desktop: 180.0,
          ),
          height: getValueForScreenType<double>(
            context: context,
            mobile: 95.0,
            tablet: 120.0,
            desktop: 190.0,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: theme.colorScheme.background,
              width: 1.8,
            ),
            borderRadius: borderRadius ?? BorderRadius.circular(100),
          ),
          child: isImageDark ? logoImage : ColorInverter(child: logoImage),
        ),
        Gap.smallH,
        Text(
          label,
          style: textTheme.headline6!.copyWith(
            fontSize: labelSize ?? textTheme.headline6!.fontSize,
          ),
        ),
      ],
    );
  }
}
