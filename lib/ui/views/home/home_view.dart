import 'package:spot/core/utils/exports.dart';
import 'package:spot/ui/widgets/detail_chip.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => GestureDetector(
        onTap: () => model.initFocusHelper(context),
        child: Scaffold(
          backgroundColor: theme.backgroundColor,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: AppBar(
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
                )
              ],
              elevation: 0,
              backgroundColor: theme.backgroundColor,
            ),
          ),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: Text.rich(
                  TextSpan(
                    text: 'Identify that ',
                    children: [
                      TextSpan(
                        text: 'suspicious caller.',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 21.0),
              TextFormField(
                controller: model.textController,
                onSaved: (value) {},
                keyboardAppearance: theme.brightness,
                onFieldSubmitted: (value) => model.saveSearch(context),
                // textAlign: TextAlign.center,
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 3, 8, 2),
                    child: Container(
                      // width: 36.0,
                      // height: 36.0,
                      // margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        color: theme.backgroundColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: GestureDetector(
                        onTap: () => model.saveSearch(context),
                        child: Icon(
                          CupertinoIcons.search,
                          size: 20,
                          color: theme.iconTheme.color,
                        ),
                      ),
                    ),
                  ),
                  suffixIconColor: theme.iconTheme.color,
                  focusColor: theme.iconTheme.color,
                  hintText: 'Add a phone number...',
                  hintStyle: textTheme.subtitle1!.copyWith(color: const Color(0xFF6B6F7A)),
                  contentPadding: const EdgeInsets.fromLTRB(15, 24, 15, 18),
                  filled: true,
                  fillColor: theme.colorScheme.background,
                  border: kTextInputBorder,
                  enabledBorder: kTextInputBorder,
                  disabledBorder: kTextInputBorder,
                  focusedBorder: kTextInputBorder,
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 38.0),
              const Text(
                'Caller Details',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                height: 460.0,
                decoration: BoxDecoration(
                  color: theme.colorScheme.background,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: GridView.count(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 2,
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 2,
                        physics: const NeverScrollableScrollPhysics(),
                        children: const [
                          DetailChip(
                            title: 'Local Format',
                            content: '1270090',
                          ),
                          DetailChip(
                            title: 'International Format',
                            content: '+102479302',
                          ),
                          DetailChip(
                            title: 'Country Prefix',
                            content: '+1',
                          ),
                          DetailChip(
                            title: 'Country Code',
                            content: 'US',
                          ),
                          DetailChip(
                            title: 'Country Name',
                            content: 'United States of America',
                          ),
                          DetailChip(
                            title: 'Location',
                            content: 'Novato',
                          ),
                          DetailChip(
                            title: 'User Carrier',
                            content: 'AT&T Mobility LLC',
                          ),
                          DetailChip(
                            title: 'Line Type',
                            content: 'Mobile',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
