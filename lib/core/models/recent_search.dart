import 'package:spot/core/utils/exports.dart';

part 'recent_search.g.dart';

@HiveType(typeId: 1)
class RecentSearch {
  @HiveField(0)
  String phoneNumber;

  @HiveField(1)
  DateTime? timeOfSearch;

  RecentSearch({
    required this.phoneNumber,
    required this.timeOfSearch,
  }) : assert(timeOfSearch != null);
}
