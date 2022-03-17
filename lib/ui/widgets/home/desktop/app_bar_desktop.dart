import 'package:spot/core/utils/exports.dart';

class HomeAppBarDesktop extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarDesktop({
    Key? key,
    required this.theme,
    required this.toggleThemeFunction,
    required this.helpIconFunction,
    required this.isDarkMode,
  }) : super(key: key);

  final ThemeData theme;
  final void Function()? toggleThemeFunction;
  final void Function()? helpIconFunction;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
        const SizedBox(width: 10.0),
        IconButton(
          onPressed: helpIconFunction,
          icon: const Icon(Icons.help),
        ),
        const SizedBox(width: 10.0),
      ],
      elevation: 0,
      backgroundColor: theme.backgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
