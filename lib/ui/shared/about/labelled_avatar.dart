import 'package:spot/core/utils/exports.dart';

class LabelledAvatar extends StatelessWidget {
  const LabelledAvatar({
    Key? key,
    required this.theme,
    required this.textTheme,
    required this.isImageDark,
    required this.imagePath,
    required this.label,
  }) : super(key: key);

  final ThemeData theme;
  final TextTheme textTheme;
  final bool isImageDark;
  final String imagePath;
  final String label;

  @override
  Widget build(BuildContext context) {
    final logoImage = ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );

    return Column(
      children: [
        Container(
          width: 80.w,
          height: 85.h,
          decoration: BoxDecoration(
            border: Border.all(
              color: theme.colorScheme.background,
              width: 1.8.w,
            ),
            shape: BoxShape.circle,
          ),
          child: isImageDark ? logoImage : ColorInverter(child: logoImage),
        ),
        Gap().smallH,
        Text(
          label,
          style: textTheme.headline6,
        ),
      ],
    );
  }
}