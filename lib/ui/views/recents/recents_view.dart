import 'package:spot/core/utils/exports.dart';
import 'package:spot/ui/widgets/recents/app_bar.dart';
import 'package:spot/ui/widgets/setup_dialog_ui.dart';

import 'recents_viewmodel.dart';

class RecentsView extends StatelessWidget {
  const RecentsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

    return ViewModelBuilder<RecentsViewModel>.reactive(
      onModelReady: (model) {
        setupDialogUI();
        return model.initHiveBox();
      },
      viewModelBuilder: () => RecentsViewModel(),
      builder: (context, model, child) => ValueListenableBuilder(
        valueListenable: model.box.listenable(),
        builder: (BuildContext context, Box box, Widget? _) => Hero(
          tag: 'recents',
          child: Scaffold(
            backgroundColor: theme.backgroundColor,
            appBar: RecentsAppBar(
              theme: theme,
              textTheme: textTheme,
              backButtonFunction: model.navigateBack,
              deleteButtonFuction: model.showConfirmationDialog,
              isBoxEmpty: box.isNotEmpty,
            ),
            body: box.isEmpty
                ? const Center(
                    child: Text('Empty'),
                  )
                : Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 2.h, 16.w, 20.h),
                    child: ListView.separated(
                      itemCount: box.length,
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (ctx, i) => const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        model.insertAtIndex(index);
                        var boxIndex = box.getAt((box.length - 1) - index);
                        var dateFormat = DateFormat('dd-MM-yyyy h:mma');

                        return SizedBox(
                          height: 70.h,
                          child: Card(
                            elevation: 2,
                            color: theme.colorScheme.background,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ListTile(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                              title: Text(
                                boxIndex.searchedURL,
                                style: textTheme.headline1!.copyWith(fontSize: 15.sp),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              trailing: Text(
                                TimeHelper.formatDateTime(
                                  dateFormat.format(boxIndex.timeOfSearch),
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
                  ),
          ),
        ),
      ),
    );
  }
}
