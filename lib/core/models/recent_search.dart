import 'package:spot/core/utils/exports.dart';

part 'recent_search.g.dart';

@HiveType(typeId: 1)
class RecentSearch {
  @HiveField(0)
  final String phoneNumber;

  RecentSearch({
    required this.phoneNumber,
  });
}
