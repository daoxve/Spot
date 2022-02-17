import 'package:spot/core/utils/exports.dart';
import 'package:spot/ui/views/home/home_viewmodel.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
    required this.theme,
    required this.model,
  }) : super(key: key);

  final ThemeData theme;
  final HomeViewModel model;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Padding(
        padding: EdgeInsets.only(left: 8.0),
        child: Icon(
          Icons.align_horizontal_left,
          size: 24,
        ),
      ),
      iconTheme: theme.iconTheme,
      actions: [
        IconButton(
          onPressed: () => model.toggleTheme(context),
          icon: Icon(
            model.isDarkMode(context) ? Icons.light_mode : Icons.dark_mode,
            size: 25,
            color: theme.iconTheme.color,
          ),
        ),
        PopupMenuButton(
          icon: const Icon(Icons.more_vert),
          iconSize: 25.0,
          onSelected: model.popupValueActions,
          itemBuilder: (context) => model.popupItems,
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
