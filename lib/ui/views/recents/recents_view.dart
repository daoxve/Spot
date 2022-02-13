import 'package:spot/core/utils/exports.dart';
import 'package:spot/ui/shared/recents/app_bar.dart';
import 'package:spot/ui/shared/recents/recents_list.dart';

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
        builder: (BuildContext context, Box box, Widget? widget) => Scaffold(
          backgroundColor: theme.backgroundColor,
          appBar: RecentsAppBar(
            theme: theme,
            textTheme: textTheme,
            model: model,
          ),
          body: box.isEmpty
              ? const Center(
                  child: Text('Empty'),
                )
              : SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RecentsList(
                          theme: theme,
                          textTheme: textTheme,
                          box: box,
                          model: model,
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
