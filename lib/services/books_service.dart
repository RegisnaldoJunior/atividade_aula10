import 'package:dio/dio.dart';
import 'package:getx_1009/models/booksAPI.dart';

class BooksNy {
  final Dio _dio = Dio();

  static const apiKey = 't3SG4LiNvZWPFOGriGjg0Mt4vO0a0BgU';
  static const apiUrl = 'https://api.nytimes.com/svc/books/v3/';

  Future<List<BooksModel>> fetchBooksInformation() async {
    const String allBooksUrl =
        '$apiUrl/lists/full-overview.json?api-key=$apiKey';

    try {
      final response = await _dio.get(allBooksUrl);
      if (response.statusCode == 200) {
        List<dynamic> booksList = [];

        var lists = response.data['results']['lists'] as List;
        for (var list in lists) {
          var books = list['books'] as List;
          booksList.addAll(books);
        }

        // Mapeia cada livro para o modelo BookModel
        return booksList.map((book) => BooksModel.fromJson(book)).toList();
      } else {
        throw Exception('Erro ao tentar pegar informações do livro!');
      }
    } catch (e) {
      throw Exception('Erro ao acessar api ${e}!');
    }
  }
}