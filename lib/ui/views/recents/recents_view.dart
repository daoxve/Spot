import 'package:spot/core/utils/exports.dart';

import 'recents_viewmodel.dart';

class RecentsView extends StatelessWidget {
  const RecentsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return ViewModelBuilder<RecentsViewModel>.reactive(
      onModelReady: (model) => model.initHiveBox(),
      viewModelBuilder: () => RecentsViewModel(),
      // onDispose: (model) => model.disposeAll(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: AppBar(
          title: Text(
            'Recent Lookups',
            style: textTheme.headline1,
          ),
          centerTitle: false,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () => model.deleteAllItems(),
              icon: const Icon(
                Icons.delete,
                size: 25,
              ),
              color: Colors.red,
            ),
          ],
          backgroundColor: theme.backgroundColor,
        ),
        body: ValueListenableBuilder(
          valueListenable: model.box.listenable(),
          builder: (context, Box box, widget) {
            return box.isEmpty
                ? const Center(
                    child: Text('Empty'),
                  )
                : ListView.separated(
                    itemCount: box.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 10);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      var currentBox = box;
                      var searchData = currentBox.getAt(index);

                      print('Building');
                      print(currentBox);
                      print(searchData);

                      return ListTile(
                        title: Text(
                          searchData.toString(),
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 25,
                          ),
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
