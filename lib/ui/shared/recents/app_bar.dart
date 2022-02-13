import 'package:spot/core/utils/exports.dart';
import 'package:spot/ui/views/recents/recents_viewmodel.dart';

class RecentsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RecentsAppBar({
    Key? key,
    required this.theme,
    required this.textTheme,
    required this.model,
  }) : super(key: key);

  final ThemeData theme;
  final TextTheme textTheme;
  final RecentsViewModel model;

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
        'Recents',
        style: textTheme.headline1!.copyWith(fontSize: 18),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: model.deleteAll,
          icon: const Icon(
            Icons.delete,
            size: 25,
          ),
          color: Colors.red,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}