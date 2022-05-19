// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchAdapter extends TypeAdapter<Search> {
  @override
  final int typeId = 1;

  @override
  Search read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Search(
      searchedURL: fields[0] as String,
      timeOfSearch: fields[1] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Search obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.searchedURL)
      ..writeByte(1)
      ..write(obj.timeOfSearch);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
