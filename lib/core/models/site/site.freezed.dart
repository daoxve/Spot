// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'site.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Site _$SiteFromJson(Map<String, dynamic> json) {
  return _Site.fromJson(json);
}

/// @nodoc
class _$SiteTearOff {
  const _$SiteTearOff();

  _Site call(
      {int first = 0,
      int last = 1,
      required String? domain,
      List<Group>? groups}) {
    return _Site(
      first: first,
      last: last,
      domain: domain,
      groups: groups,
    );
  }

  Site fromJson(Map<String, Object?> json) {
    return Site.fromJson(json);
  }
}

/// @nodoc
const $Site = _$SiteTearOff();

/// @nodoc
mixin _$Site {
  /// Presumable first date of detection/creation
  int get first => throw _privateConstructorUsedError;

  /// Presumable date of domain expiration
  int get last => throw _privateConstructorUsedError;

  /// The top level of the domain that was entered.
  String? get domain => throw _privateConstructorUsedError;

  /// Grouped data extracted from the API
  List<Group>? get groups => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SiteCopyWith<Site> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiteCopyWith<$Res> {
  factory $SiteCopyWith(Site value, $Res Function(Site) then) =
      _$SiteCopyWithImpl<$Res>;
  $Res call({int first, int last, String? domain, List<Group>? groups});
}

/// @nodoc
class _$SiteCopyWithImpl<$Res> implements $SiteCopyWith<$Res> {
  _$SiteCopyWithImpl(this._value, this._then);

  final Site _value;
  // ignore: unused_field
  final $Res Function(Site) _then;

  @override
  $Res call({
    Object? first = freezed,
    Object? last = freezed,
    Object? domain = freezed,
    Object? groups = freezed,
  }) {
    return _then(_value.copyWith(
      first: first == freezed
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as int,
      last: last == freezed
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as int,
      domain: domain == freezed
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String?,
      groups: groups == freezed
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<Group>?,
    ));
  }
}

/// @nodoc
abstract class _$SiteCopyWith<$Res> implements $SiteCopyWith<$Res> {
  factory _$SiteCopyWith(_Site value, $Res Function(_Site) then) =
      __$SiteCopyWithImpl<$Res>;
  @override
  $Res call({int first, int last, String? domain, List<Group>? groups});
}

/// @nodoc
class __$SiteCopyWithImpl<$Res> extends _$SiteCopyWithImpl<$Res>
    implements _$SiteCopyWith<$Res> {
  __$SiteCopyWithImpl(_Site _value, $Res Function(_Site) _then)
      : super(_value, (v) => _then(v as _Site));

  @override
  _Site get _value => super._value as _Site;

  @override
  $Res call({
    Object? first = freezed,
    Object? last = freezed,
    Object? domain = freezed,
    Object? groups = freezed,
  }) {
    return _then(_Site(
      first: first == freezed
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as int,
      last: last == freezed
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as int,
      domain: domain == freezed
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String?,
      groups: groups == freezed
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<Group>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Site extends _Site {
  const _$_Site(
      {this.first = 0, this.last = 1, required this.domain, this.groups})
      : assert(first <= last,
            'First index time must be less than Last Index time. Are you parsing this correctly?'),
        super._();

  factory _$_Site.fromJson(Map<String, dynamic> json) => _$$_SiteFromJson(json);

  @JsonKey()
  @override

  /// Presumable first date of detection/creation
  final int first;
  @JsonKey()
  @override

  /// Presumable date of domain expiration
  final int last;
  @override

  /// The top level of the domain that was entered.
  final String? domain;
  @override

  /// Grouped data extracted from the API
  final List<Group>? groups;

  @override
  String toString() {
    return 'Site(first: $first, last: $last, domain: $domain, groups: $groups)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Site &&
            const DeepCollectionEquality().equals(other.first, first) &&
            const DeepCollectionEquality().equals(other.last, last) &&
            const DeepCollectionEquality().equals(other.domain, domain) &&
            const DeepCollectionEquality().equals(other.groups, groups));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(first),
      const DeepCollectionEquality().hash(last),
      const DeepCollectionEquality().hash(domain),
      const DeepCollectionEquality().hash(groups));

  @JsonKey(ignore: true)
  @override
  _$SiteCopyWith<_Site> get copyWith =>
      __$SiteCopyWithImpl<_Site>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SiteToJson(this);
  }
}

abstract class _Site extends Site {
  const factory _Site(
      {int first,
      int last,
      required String? domain,
      List<Group>? groups}) = _$_Site;
  const _Site._() : super._();

  factory _Site.fromJson(Map<String, dynamic> json) = _$_Site.fromJson;

  @override

  /// Presumable first date of detection/creation
  int get first;
  @override

  /// Presumable date of domain expiration
  int get last;
  @override

  /// The top level of the domain that was entered.
  String? get domain;
  @override

  /// Grouped data extracted from the API
  List<Group>? get groups;
  @override
  @JsonKey(ignore: true)
  _$SiteCopyWith<_Site> get copyWith => throw _privateConstructorUsedError;
}

Group _$GroupFromJson(Map<String, dynamic> json) {
  return _Group.fromJson(json);
}

/// @nodoc
class _$GroupTearOff {
  const _$GroupTearOff();

  _Group call(
      {required String name,
      required int live,
      required int dead,
      required int latest,
      required int oldest,
      List<Group>? categories}) {
    return _Group(
      name: name,
      live: live,
      dead: dead,
      latest: latest,
      oldest: oldest,
      categories: categories,
    );
  }

  Group fromJson(Map<String, Object?> json) {
    return Group.fromJson(json);
  }
}

/// @nodoc
const $Group = _$GroupTearOff();

/// @nodoc
mixin _$Group {
  /// Each group has a named technology tag
  String get name => throw _privateConstructorUsedError;

  /// Technologies considered live in a particular group
  int get live => throw _privateConstructorUsedError;

  /// Technologies considered deprecated or no longer used in a particular group
  int get dead => throw _privateConstructorUsedError;

  /// The most recent date a technology indexed in this group was found on the API
  int get latest => throw _privateConstructorUsedError;

  /// The earliest date a technology indexed in this group was found on the API
  int get oldest => throw _privateConstructorUsedError;

  /// Each group's named technology tag contains categories for that group.
  ///
  /// Each category contains it's own "Group" except that it's internal group doesn't have
  /// it's internal categories.
  List<Group>? get categories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroupCopyWith<Group> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupCopyWith<$Res> {
  factory $GroupCopyWith(Group value, $Res Function(Group) then) =
      _$GroupCopyWithImpl<$Res>;
  $Res call(
      {String name,
      int live,
      int dead,
      int latest,
      int oldest,
      List<Group>? categories});
}

/// @nodoc
class _$GroupCopyWithImpl<$Res> implements $GroupCopyWith<$Res> {
  _$GroupCopyWithImpl(this._value, this._then);

  final Group _value;
  // ignore: unused_field
  final $Res Function(Group) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? live = freezed,
    Object? dead = freezed,
    Object? latest = freezed,
    Object? oldest = freezed,
    Object? categories = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      live: live == freezed
          ? _value.live
          : live // ignore: cast_nullable_to_non_nullable
              as int,
      dead: dead == freezed
          ? _value.dead
          : dead // ignore: cast_nullable_to_non_nullable
              as int,
      latest: latest == freezed
          ? _value.latest
          : latest // ignore: cast_nullable_to_non_nullable
              as int,
      oldest: oldest == freezed
          ? _value.oldest
          : oldest // ignore: cast_nullable_to_non_nullable
              as int,
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Group>?,
    ));
  }
}

/// @nodoc
abstract class _$GroupCopyWith<$Res> implements $GroupCopyWith<$Res> {
  factory _$GroupCopyWith(_Group value, $Res Function(_Group) then) =
      __$GroupCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      int live,
      int dead,
      int latest,
      int oldest,
      List<Group>? categories});
}

/// @nodoc
class __$GroupCopyWithImpl<$Res> extends _$GroupCopyWithImpl<$Res>
    implements _$GroupCopyWith<$Res> {
  __$GroupCopyWithImpl(_Group _value, $Res Function(_Group) _then)
      : super(_value, (v) => _then(v as _Group));

  @override
  _Group get _value => super._value as _Group;

  @override
  $Res call({
    Object? name = freezed,
    Object? live = freezed,
    Object? dead = freezed,
    Object? latest = freezed,
    Object? oldest = freezed,
    Object? categories = freezed,
  }) {
    return _then(_Group(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      live: live == freezed
          ? _value.live
          : live // ignore: cast_nullable_to_non_nullable
              as int,
      dead: dead == freezed
          ? _value.dead
          : dead // ignore: cast_nullable_to_non_nullable
              as int,
      latest: latest == freezed
          ? _value.latest
          : latest // ignore: cast_nullable_to_non_nullable
              as int,
      oldest: oldest == freezed
          ? _value.oldest
          : oldest // ignore: cast_nullable_to_non_nullable
              as int,
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Group>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Group implements _Group {
  const _$_Group(
      {required this.name,
      required this.live,
      required this.dead,
      required this.latest,
      required this.oldest,
      this.categories});

  factory _$_Group.fromJson(Map<String, dynamic> json) =>
      _$$_GroupFromJson(json);

  @override

  /// Each group has a named technology tag
  final String name;
  @override

  /// Technologies considered live in a particular group
  final int live;
  @override

  /// Technologies considered deprecated or no longer used in a particular group
  final int dead;
  @override

  /// The most recent date a technology indexed in this group was found on the API
  final int latest;
  @override

  /// The earliest date a technology indexed in this group was found on the API
  final int oldest;
  @override

  /// Each group's named technology tag contains categories for that group.
  ///
  /// Each category contains it's own "Group" except that it's internal group doesn't have
  /// it's internal categories.
  final List<Group>? categories;

  @override
  String toString() {
    return 'Group(name: $name, live: $live, dead: $dead, latest: $latest, oldest: $oldest, categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Group &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.live, live) &&
            const DeepCollectionEquality().equals(other.dead, dead) &&
            const DeepCollectionEquality().equals(other.latest, latest) &&
            const DeepCollectionEquality().equals(other.oldest, oldest) &&
            const DeepCollectionEquality()
                .equals(other.categories, categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(live),
      const DeepCollectionEquality().hash(dead),
      const DeepCollectionEquality().hash(latest),
      const DeepCollectionEquality().hash(oldest),
      const DeepCollectionEquality().hash(categories));

  @JsonKey(ignore: true)
  @override
  _$GroupCopyWith<_Group> get copyWith =>
      __$GroupCopyWithImpl<_Group>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GroupToJson(this);
  }
}

abstract class _Group implements Group {
  const factory _Group(
      {required String name,
      required int live,
      required int dead,
      required int latest,
      required int oldest,
      List<Group>? categories}) = _$_Group;

  factory _Group.fromJson(Map<String, dynamic> json) = _$_Group.fromJson;

  @override

  /// Each group has a named technology tag
  String get name;
  @override

  /// Technologies considered live in a particular group
  int get live;
  @override

  /// Technologies considered deprecated or no longer used in a particular group
  int get dead;
  @override

  /// The most recent date a technology indexed in this group was found on the API
  int get latest;
  @override

  /// The earliest date a technology indexed in this group was found on the API
  int get oldest;
  @override

  /// Each group's named technology tag contains categories for that group.
  ///
  /// Each category contains it's own "Group" except that it's internal group doesn't have
  /// it's internal categories.
  List<Group>? get categories;
  @override
  @JsonKey(ignore: true)
  _$GroupCopyWith<_Group> get copyWith => throw _privateConstructorUsedError;
}
