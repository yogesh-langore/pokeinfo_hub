// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonAdapter extends TypeAdapter<Pokemon> {
  @override
  final int typeId = 1;

  @override
  Pokemon read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pokemon(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as String?,
      fields[5] as String?,
      fields[6] as String?,
      fields[7] as String?,
      (fields[8] as List?)?.cast<String>(),
      (fields[9] as List?)?.cast<String>(),
      (fields[10] as List?)?.cast<String>(),
      (fields[11] as List?)?.cast<String>(),
      fields[12] as num?,
      fields[13] as num?,
      fields[14] as num?,
      fields[15] as num?,
      fields[16] as num?,
      fields[17] as int?,
      fields[18] as int?,
      fields[19] as String?,
      fields[20] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Pokemon obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.imageurl)
      ..writeByte(3)
      ..write(obj.xdescription)
      ..writeByte(4)
      ..write(obj.ydescription)
      ..writeByte(5)
      ..write(obj.height)
      ..writeByte(6)
      ..write(obj.category)
      ..writeByte(7)
      ..write(obj.weight)
      ..writeByte(8)
      ..write(obj.typeofpokemon)
      ..writeByte(9)
      ..write(obj.weaknesses)
      ..writeByte(10)
      ..write(obj.evolutions)
      ..writeByte(11)
      ..write(obj.abilities)
      ..writeByte(12)
      ..write(obj.hp)
      ..writeByte(13)
      ..write(obj.attack)
      ..writeByte(14)
      ..write(obj.defense)
      ..writeByte(15)
      ..write(obj.special_attack)
      ..writeByte(16)
      ..write(obj.special_defense)
      ..writeByte(17)
      ..write(obj.speed)
      ..writeByte(18)
      ..write(obj.total)
      ..writeByte(19)
      ..write(obj.male_percentage)
      ..writeByte(20)
      ..write(obj.female_percentage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      json['name'] as String?,
      json['id'] as String?,
      json['imageurl'] as String?,
      json['xdescription'] as String?,
      json['ydescription'] as String?,
      json['height'] as String?,
      json['category'] as String?,
      json['weight'] as String?,
      (json['typeofpokemon'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      (json['weaknesses'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['evolutions'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['abilities'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['hp'] as num?,
      json['attack'] as num?,
      json['defense'] as num?,
      json['special_attack'] as num?,
      json['special_defense'] as num?,
      (json['speed'] as num?)?.toInt(),
      (json['total'] as num?)?.toInt(),
      json['male_percentage'] as String?,
      json['female_percentage'] as String?,
    );

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'imageurl': instance.imageurl,
      'xdescription': instance.xdescription,
      'ydescription': instance.ydescription,
      'height': instance.height,
      'category': instance.category,
      'weight': instance.weight,
      'typeofpokemon': instance.typeofpokemon,
      'weaknesses': instance.weaknesses,
      'evolutions': instance.evolutions,
      'abilities': instance.abilities,
      'hp': instance.hp,
      'attack': instance.attack,
      'defense': instance.defense,
      'special_attack': instance.special_attack,
      'special_defense': instance.special_defense,
      'speed': instance.speed,
      'total': instance.total,
      'male_percentage': instance.male_percentage,
      'female_percentage': instance.female_percentage,
    };
