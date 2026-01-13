import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/character.dart';

part 'character_dto.freezed.dart';
part 'character_dto.g.dart';

@freezed
class CharacterDto with _$CharacterDto {
  const factory CharacterDto({
    required int id,
    required String name,
    required String status,
    required String species,
    required String type,
    required String gender,
    required String image,
    required OriginDto origin,
    required LocationDto location,
  }) = _CharacterDto;

  factory CharacterDto.fromJson(Map<String, dynamic> json) =>
      _$CharacterDtoFromJson(json);

  const CharacterDto._();

  Character toEntity() {
    return Character(
      id: id,
      name: name,
      status: status,
      species: species,
      type: type,
      gender: gender,
      image: image,
      origin: origin.name,
      location: location.name,
    );
  }
}

@freezed
class OriginDto with _$OriginDto {
  const factory OriginDto({
    required String name,
    required String url,
  }) = _OriginDto;

  factory OriginDto.fromJson(Map<String, dynamic> json) =>
      _$OriginDtoFromJson(json);
}

@freezed
class LocationDto with _$LocationDto {
  const factory LocationDto({
    required String name,
    required String url,
  }) = _LocationDto;

  factory LocationDto.fromJson(Map<String, dynamic> json) =>
      _$LocationDtoFromJson(json);
}
