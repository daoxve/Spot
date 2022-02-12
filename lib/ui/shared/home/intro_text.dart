import 'package:spot/core/utils/exports.dart';

class IntroText extends StatelessWidget {
  const IntroText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 40.0),
      child: Text.rich(
        TextSpan(
          text: 'Verify any \n',
          children: [
            TextSpan(
              text: 'phone number.',
              style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
        style: TextStyle(
          fontSize: 36.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}