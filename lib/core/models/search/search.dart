import 'package:spot/core/utils/exports.dart';

part 'search.g.dart';

@HiveType(typeId: 1)
class Search {
  @HiveField(0)
  String searchedURL;

  //? Hive throws an error when this field isn't nullable (so i made a quick fix)
  @HiveField(1)
  DateTime? timeOfSearch; //? fix part 1/2 (made this nullable)

  Search({
    required this.searchedURL,
    required this.timeOfSearch,
  }) : assert(
          timeOfSearch != null,
          'Time of search cannot be null',
        ); //? fix part 2/2 (made sure this cannot be null in the view)
}
