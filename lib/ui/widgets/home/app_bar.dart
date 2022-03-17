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
      leading: const Padding(
        padding: EdgeInsets.only(left: 8.0),
        child: Icon(
          Icons.align_horizontal_left,
          size: 24.0,
        ),
      ),
      iconTheme: theme.iconTheme,
      actions: [
        IconButton(
          onPressed: toggleThemeFunction,
          icon: Icon(
            isDarkMode ? Icons.light_mode : Icons.dark_mode,
            size: 25.0,
            color: theme.iconTheme.color,
          ),
        ),
        PopupMenuButton(
          icon: const Icon(Icons.more_vert),
          iconSize: 25.0,
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
  Size get preferredSize => const Size.fromHeight(56.0);
}
