import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'about_viewmodel.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AboutViewModel>.reactive(
      viewModelBuilder: () => AboutViewModel(),
      builder: (context, model, child) => const Scaffold(
        body: Center(
          child: Text('About View'),
        ),
      ),
    );
  }
}
