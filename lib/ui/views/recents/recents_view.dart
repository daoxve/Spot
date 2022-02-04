import 'package:spot/core/utils/exports.dart';

import 'package:spot/ui/views/home/home_viewmodel.dart';

class RecentsView extends StatelessWidget {
  const RecentsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
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
          backgroundColor: theme.backgroundColor,
        ),
        body: ListView.separated(
          itemCount: model.recentSearches.length,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 10);
          },
          itemBuilder: (BuildContext context, int index) {
            print('Building');
            print(model.recentSearches);
            print(model.recentSearches.length);
            return ListTile(
              title: Text(
                model.recentSearches[index],
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 25,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
