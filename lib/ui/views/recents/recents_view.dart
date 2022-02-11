import 'package:spot/core/utils/exports.dart';

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
      // onDispose: (model) => model.disposeAll(),
      builder: (context, model, child) => ValueListenableBuilder(
        valueListenable: model.box.listenable(),
        builder: (BuildContext context, Box box, Widget? widget) => Scaffold(
          backgroundColor: theme.backgroundColor,
          body: box.isEmpty
              ? const Center(
                  child: Text('Empty'),
                )
              : SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Recents',
                              style: TextStyle(
                                fontSize: 36.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: model.deleteAll,
                              icon: const Icon(
                                Icons.delete,
                                size: 25,
                              ),
                              color: Colors.red,
                            )
                          ],
                        ),
                        const SizedBox(height: 21.0),
                        Flexible(
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
                                  elevation: 0,
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
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
