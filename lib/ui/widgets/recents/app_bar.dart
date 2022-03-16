import 'package:spot/core/utils/exports.dart';

class RecentsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RecentsAppBar({
    Key? key,
    required this.theme,
    required this.textTheme,
    required this.backButtonFunction,
    required this.deleteButtonFuction,
    required this.isBoxEmpty,
  }) : super(key: key);

  final ThemeData theme;
  final TextTheme textTheme;
  final void Function()? backButtonFunction;
  final void Function()? deleteButtonFuction;
  final bool isBoxEmpty;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: theme.backgroundColor,
      iconTheme: theme.iconTheme,
      elevation: 0,
      leading: InkWell(
        onTap: backButtonFunction,
        borderRadius: BorderRadius.circular(100),
        child: const Icon(CupertinoIcons.back),
      ),
      title: Text(
        'Recents',
        style: textTheme.headline1!.copyWith(fontSize: 18.0),
      ),
      centerTitle: true,
      actions: [
        isBoxEmpty
            ? IconButton(
                onPressed: deleteButtonFuction,
                icon: const Icon(
                  Icons.delete,
                  size: 25.0,
                ),
                color: Colors.red,
              )
            : const SizedBox(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
