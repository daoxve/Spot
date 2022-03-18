import 'package:spot/core/utils/exports.dart';
import 'package:spot/ui/widgets/recents/app_bar.dart';

import 'recents_viewmodel.dart';

class RecentsView extends StatelessWidget {
  const RecentsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

    return ViewModelBuilder<RecentsViewModel>.reactive(
      onModelReady: (model) => model.initHiveBox(),
      viewModelBuilder: () => RecentsViewModel(),
      builder: (context, model, child) => ValueListenableBuilder(
        valueListenable: model.box.listenable(),
        builder: (BuildContext context, Box box, Widget? _) => Hero(
          tag: HeroTags.recents,
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
                ? Column(
                    children: [
                      Expanded(
                        child: Flex(
                          direction: Axis.vertical,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Flexible(
                              child: SizedBox(
                                height: 250.0,
                                width: 250.0,
                                child: RiveAnimation.asset('assets/animations/cubic.riv'),
                              ),
                            ),
                            Align(
                              child: Text(
                                'Your recent searches go here',
                                style: textTheme.headline6,
                              ),
                            ),
                            // const Spacer(),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: Text(
                            '© David Coker.  2022.',
                            style: textTheme.headline6,
                          ),
                        ),
                      ),
                    ],
                  )
                : Padding(
                    padding: getValueForScreenType<EdgeInsetsGeometry>(
                      context: context,
                      mobile: const EdgeInsets.fromLTRB(16.0, 2.0, 16.0, 20.0),
                      desktop: const EdgeInsets.fromLTRB(360.0, 2.0, 360.0, 20.0),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            itemCount: box.length,
                            physics: const BouncingScrollPhysics(),
                            separatorBuilder: (ctx, i) => const SizedBox(height: 10),
                            itemBuilder: (context, index) {
                              model.insertAtIndex(index);
                              var boxIndex = box.getAt((box.length - 1) - index);
                              var dateFormat = DateFormat('dd-MM-yyyy h:mma');

                              return SizedBox(
                                height: 70.0,
                                child: Card(
                                  elevation: 2,
                                  color: theme.colorScheme.background,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 8.0),
                                    title: Text(
                                      boxIndex.searchedURL,
                                      style: textTheme.headline1!.copyWith(fontSize: 15.0),
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
                        Gap.mediumH,
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            '© David Coker.  2022.',
                            style: textTheme.headline6,
                          ),
                        ),
                        Gap.smallH,
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
