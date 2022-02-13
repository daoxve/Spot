import 'package:spot/core/utils/exports.dart';
import 'package:spot/ui/shared/home/detail_tile.dart';
import 'package:spot/ui/shared/home/status_tile.dart';

class PhoneNumberResults extends StatelessWidget {
  const PhoneNumberResults({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600.h,
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap().mediumH,
          const StatusTile(
            tileColor: kcLightGreen,
            statusBoxColor: kcGreen,
            trailingText: 'Real',
          ),
          Gap().mediumH,
          Flexible(
            child: GridView(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 8,
                childAspectRatio: 9 / 6,
              ),
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                DetailTile(
                  title: 'Local Format',
                  content: '1270090',
                ),
                DetailTile(
                  title: 'International Format',
                  content: '+102479302',
                ),
                DetailTile(
                  title: 'Country Prefix',
                  content: '+1',
                ),
                DetailTile(
                  title: 'Country Code',
                  content: 'US',
                ),
                DetailTile(
                  title: 'Country Name',
                  content: 'United States of America',
                ),
                DetailTile(
                  title: 'Location',
                  content: 'Novato',
                ),
                DetailTile(
                  title: 'Mobile Carrier',
                  content: 'AT&T Mobility LLC',
                ),
                DetailTile(
                  title: 'Line Type',
                  content: 'Mobile',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
