import 'package:spot/core/utils/exports.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
    required this.theme,
    required this.popupItemBuilder,
    required this.onPopupSelected,
    required this.toggleThemeFunction,
    required this.isDarkMode,
  }) : super(key: key);

  final ThemeData theme;
  final List<PopupMenuEntry<String>> Function(BuildContext) popupItemBuilder;
  final void Function(String)? onPopupSelected;
  final void Function()? toggleThemeFunction;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: EdgeInsets.only(left: 8.w),
        child: Icon(
          Icons.align_horizontal_left,
          size: 24.sp,
        ),
      ),
      iconTheme: theme.iconTheme,
      actions: [
        IconButton(
          onPressed: toggleThemeFunction,
          icon: Icon(
            isDarkMode ? Icons.light_mode : Icons.dark_mode,
            size: 25.sp,
            color: theme.iconTheme.color,
          ),
        ),
        PopupMenuButton(
          icon: const Icon(Icons.more_vert),
          iconSize: 25.sp,
          onSelected: onPopupSelected,
          itemBuilder: popupItemBuilder,
          offset: const Offset(0, 50),
        )
      ],
      elevation: 0,
      backgroundColor: theme.backgroundColor,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
