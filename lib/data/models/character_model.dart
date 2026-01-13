import 'package:isar/isar.dart';
import '../../domain/entities/character.dart';

part 'character_model.g.dart';

@collection
class CharacterModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  int? characterId;

  late String name;
  late String status;
  late String species;
  late String type;
  late String gender;
  late String image;
  late String origin;
  late String location;

  static CharacterModel fromEntity(Character character) {
    return CharacterModel()
      ..characterId = character.id
      ..name = character.name
      ..status = character.status
      ..species = character.species
      ..type = character.type
      ..gender = character.gender
      ..image = character.image
      ..origin = character.origin
      ..location = character.location;
  }

  Character toEntity() {
    return Character(
      id: characterId ?? 0,
      name: name,
      status: status,
      species: species,
      type: type,
      gender: gender,
      image: image,
      origin: origin,
      location: location,
    );
  }
}
