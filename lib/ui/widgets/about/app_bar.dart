import 'package:spot/core/utils/exports.dart';
import 'package:spot/ui/views/about/about_viewmodel.dart';

class AboutAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AboutAppBar({
    Key? key,
    required this.theme,
    required this.textTheme,
    required this.model,
  }) : super(key: key);

  final ThemeData theme;
  final TextTheme textTheme;
  //! Fix non-ethical model passing.
  final AboutViewModel model;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: theme.backgroundColor,
      iconTheme: theme.iconTheme,
      elevation: 0,
      leading: InkWell(
        onTap: model.navigateBack,
        borderRadius: BorderRadius.circular(100),
        child: const Icon(CupertinoIcons.back),
      ),
      title: Text(
        'About',
        style: textTheme.headline1!.copyWith(fontSize: 18.sp),
      ),
      centerTitle: true,
      // actions: [],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
