import 'package:spot/core/utils/exports.dart';
import 'package:spot/ui/widgets/home/detail_tile.dart';
import 'package:spot/ui/widgets/home/domain_name_tile.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import 'package:spot/ui/views/home/home_viewmodel.dart';

class ResultCard extends HookViewModelWidget<HomeViewModel> {
  const ResultCard({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget buildViewModelWidget(BuildContext context, HomeViewModel viewModel) {
    final apiData = viewModel.searchResult;
    final apiGroup = apiData?.groups;

    final frameworkIndex = apiGroup?.indexWhere(
      (group) => group.name.startsWith('framework'),
    );

    final sslIndex = apiGroup?.indexWhere((group) => group.name.startsWith('ssl'));

    // Finds the group with the largest number of live technologies
    final findLargestGroup = apiGroup?.reduce(
      (curr, next) => curr.live > next.live ? curr : next,
    );

    final placeholderEpoch = DateTime.now().millisecondsSinceEpoch;

    final firstDateRaw =
        DateTime.fromMillisecondsSinceEpoch((apiData?.first ?? placeholderEpoch) * 1000);

    final lastDateRaw =
        DateTime.fromMillisecondsSinceEpoch((apiData?.last ?? placeholderEpoch) * 1000);

    final epochTimeNowRaw = DateTime.fromMillisecondsSinceEpoch(placeholderEpoch * 1000);

    final DateFormat dateFormat = DateFormat('yMMMd');

    final firstDate = dateFormat.format(firstDateRaw);
    final lastDate = dateFormat.format(lastDateRaw);
    final epochTimeNow = dateFormat.format(epochTimeNowRaw);

    final latestDate =
        TimeHelper.formatTimeInEpoch((findLargestGroup?.latest ?? placeholderEpoch) * 1000);

    final oldestDate =
        TimeHelper.formatTimeInEpoch((findLargestGroup?.oldest ?? placeholderEpoch) * 1000);

    List<String> tileTitle = [
      'First Time of Detection',
      'Last Time of Detection',
      'Latest tech was added',
      'Oldest tech was added',
      'Total live technologies detected',
      'Total deprecated technologies detected',
      'Most detected technology',
      'Live technologies for ${findLargestGroup?.name ?? "most detected"}',
      'Total frameworks detected',
      'Uses SSL',
    ];

    List<dynamic> tileContent = [
      firstDate == epochTimeNow ? 'unknown' : firstDate,
      lastDate == epochTimeNow ? 'unknown' : lastDate,
      latestDate == 'Just now' ? 'unknown' : latestDate,
      oldestDate == 'Just now' ? 'unknown' : oldestDate,
      viewModel.totalLiveTech.toString(),
      viewModel.totalDeadTech.toString(),
      findLargestGroup?.name.capitalizeFirst ?? 'unknown',
      findLargestGroup?.live.toString() ?? 'unknown',
      apiGroup?[frameworkIndex ?? -1].live.toString() ?? 'unknown',
      apiGroup?[sslIndex ?? -1].live == null
          ? 'unknown'
          : apiGroup?[sslIndex ?? -1].live == 0
              ? 'No'
              : 'Yes.',
    ];

    return viewModel.isLoading
        ? SizedBox(
            height: 720.0,
            child: Shimmer.fromColors(
              baseColor: theme.colorScheme.primaryVariant,
              highlightColor: theme.colorScheme.secondaryVariant,
              enabled: viewModel.isLoading,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: EdgeInsets.zero,
              ),
            ),
          )
        : LimitedBox(
            maxHeight: tileContent.length * 115.0,
            maxWidth: 720.0,
            child: Card(
              color: theme.colorScheme.background,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: EdgeInsets.zero,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Gap.mediumH,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: DomainNameTile(
                      backgroundColor: theme.backgroundColor,
                      label: 'Domain Name:',
                      statusText: apiData?.domain ?? 'none yet',
                    ),
                  ),
                  Gap.smallH,
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3.0),
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 2,
                        alignment: WrapAlignment.center,
                        children: List.generate(
                          tileContent.length,
                          (i) => SizedBox(
                            width: getValueForScreenType<double>(
                              context: context,
                              mobile: 200,
                              desktop: 250,
                            ),
                            height: 180,
                            child: DetailTile(
                              title: tileTitle[i],
                              content: tileContent[i],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gap.mediumH,
                ],
              ),
            ),
          );
  }
}
