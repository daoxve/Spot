import 'package:spot/core/utils/exports.dart';
import 'package:spot/ui/views/recents/recents_viewmodel.dart';

class RecentsList extends StatelessWidget {
  const RecentsList({
    Key? key,
    required this.theme,
    required this.textTheme,
    required this.model,
    required this.box,
  }) : super(key: key);

  final ThemeData theme;
  final TextTheme textTheme;
  final RecentsViewModel model;
  final Box box;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.separated(
        itemCount: box.length,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (ctx, i) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          model.insertAtIndex(index);
          var boxIndex = box.getAt((box.length - 1) - index);
          var dateFormat = DateFormat('dd-MM-yyyy h:mma');

          return SizedBox(
            height: 70,
            child: Card(
              elevation: 2,
              color: theme.colorScheme.background,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                title: Text(
                  boxIndex.phoneNumber,
                  style: textTheme.headline1!.copyWith(fontSize: 18),
                ),
                trailing: Text(
                  TimeHelper.currentDate(
                    dateFormat.format(boxIndex.timeOfSearch),
                    numericDates: true,
                  ),
                  style: textTheme.subtitle2!.copyWith(
                    color: theme.iconTheme.color!.withOpacity(0.4),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
