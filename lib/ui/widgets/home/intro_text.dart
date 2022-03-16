import 'package:spot/core/utils/exports.dart';

class IntroText extends StatelessWidget {
  const IntroText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Lookup details',
            style: TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'for any website.',
            style: TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.w900,
              foreground: Paint()..shader = kTextLinearGradient,
            ),
          ),
        ],
      ),
    );
  }
}
