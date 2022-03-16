import 'package:spot/core/utils/exports.dart';
import 'package:spot/ui/widgets/home/detail_tile.dart';
import 'package:spot/ui/widgets/home/domain_name_tile.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../views/home/home_viewmodel.dart';

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

    return viewModel.isLoading
        ? SizedBox(
            height: 720.h,
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
        : SizedBox(
            height: 730.0,
            child: Card(
              color: theme.colorScheme.background,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Gap.mediumH,
                  DomainNameTile(
                    backgroundColor: theme.backgroundColor,
                    label: 'Domain Name:',
                    statusText: apiData?.domain ?? 'none yet',
                  ),
                  Gap.smallH,
                  Flexible(
                    child: GridView.count(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 8,
                      childAspectRatio: 9 / 6,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        DetailTile(
                          title: 'First Time of Detection',
                          content: firstDate == epochTimeNow ? 'unknown' : firstDate,
                        ),
                        DetailTile(
                          title: 'Last Time of Detection',
                          content: lastDate == epochTimeNow ? 'unknown' : lastDate,
                        ),
                        DetailTile(
                          title: 'Latest tech was added',
                          content: latestDate == 'Just now' ? 'unknown' : latestDate,
                        ),
                        DetailTile(
                          title: 'Oldest tech was added',
                          content: oldestDate == 'Just now' ? 'unknown' : oldestDate,
                        ),
                        DetailTile(
                          title: 'Total live technologies detected',
                          content: viewModel.totalLiveTech.toString(),
                        ),
                        DetailTile(
                          title: 'Total deprecated technologies detected',
                          content: viewModel.totalDeadTech.toString(),
                        ),
                        DetailTile(
                          title: 'Most detected technology',
                          content: findLargestGroup?.name.capitalizeFirst ?? 'unknown',
                        ),
                        DetailTile(
                          title: 'Live technologies for '
                              '${findLargestGroup?.name ?? "most detected"}',
                          content: findLargestGroup?.live.toString() ?? 'unknown',
                        ),
                        DetailTile(
                          title: 'Total frameworks detected',
                          content:
                              apiGroup?[frameworkIndex ?? -1].live.toString() ?? 'unknown',
                        ),
                        DetailTile(
                          title: 'Uses SSL',
                          content: apiGroup?[sslIndex ?? -1].live == null
                              ? 'unknown'
                              : apiGroup?[sslIndex ?? -1].live == 0
                                  ? 'No'
                                  : 'Yes.',
                        ),
                        Gap.mediumH,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
