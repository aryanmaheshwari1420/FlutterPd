import 'package:dio/dio.dart';
import '../models/character_dto.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'));

  Future<List<CharacterDto>> fetchCharacters({int page = 1}) async {
    try {
      final response = await _dio.get('/character', queryParameters: {'page': page});
      final List results = response.data['results'];
      return results.map((e) => CharacterDto.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<CharacterDto> fetchCharacterById(int id) async {
    try {
      final response = await _dio.get('/character/$id');
      return CharacterDto.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
