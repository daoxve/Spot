// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Site _$$_SiteFromJson(Map<String, dynamic> json) => _$_Site(
      first: json['first'] as int? ?? 0,
      last: json['last'] as int? ?? 1,
      domain: json['domain'] as String?,
      groups: (json['groups'] as List<dynamic>?)
          ?.map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SiteToJson(_$_Site instance) => <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
      'domain': instance.domain,
      'groups': instance.groups,
    };

_$_Group _$$_GroupFromJson(Map<String, dynamic> json) => _$_Group(
      name: json['name'] as String,
      live: json['live'] as int,
      dead: json['dead'] as int,
      latest: json['latest'] as int,
      oldest: json['oldest'] as int,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_GroupToJson(_$_Group instance) => <String, dynamic>{
      'name': instance.name,
      'live': instance.live,
      'dead': instance.dead,
      'latest': instance.latest,
      'oldest': instance.oldest,
      'categories': instance.categories,
    };
