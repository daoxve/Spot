import 'package:freezed_annotation/freezed_annotation.dart';

part 'site.freezed.dart';
part 'site.g.dart';

@freezed
class Site with _$Site {
  const Site._();

  @Assert(
    'first <= last',
    'First index time must be less than Last Index time. Are you parsing this correctly?',
  )
  const factory Site({
    /// Presumable first date of detection/creation
    @Default(0) int first,

    /// Presumable date of domain expiration
    @Default(1) int last,

    /// The top level of the domain that was entered.
    required String? domain,

    /// Grouped data extracted from the API
    List<Group>? groups,
  }) = _Site;

  factory Site.fromJson(Map<String, dynamic> json) => _$SiteFromJson(json);
}

@freezed
class Group with _$Group {

  const factory Group({
    /// Each group has a named technology tag
    required String name,

    /// Technologies considered live in a particular group
    required int live,

    /// Technologies considered deprecated or no longer used in a particular group
    required int dead,

    /// The most recent date a technology indexed in this group was found on the API
    required int latest,

    /// The earliest date a technology indexed in this group was found on the API
    required int oldest,

    /// Each group's named technology tag contains categories for that group.
    ///
    /// Each category contains it's own "Group" except that it's internal group doesn't have
    /// it's internal categories.
    List<Group>? categories,
  }) = _Group;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}
