import 'package:spot/core/utils/exports.dart';

class IntroTextDesktop extends StatelessWidget {
  const IntroTextDesktop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Lookup details',
            style: TextStyle(
              fontSize: 46.0,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            '  for any website.',
            style: TextStyle(
              fontSize: 48.0,
              fontWeight: FontWeight.w900,
              foreground: Paint()..shader = kTextLinearGradient,
            ),
          ),
        ],
      ),
    );
  }
}
