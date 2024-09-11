class BooksModel {
  final String title;
  final String author;
  final String bookImage;
  final String amazonProductUrl;
  final String publisher;
  final String description;

  BooksModel({
    required this.title,
    required this.author,
    required this.bookImage,
    required this.amazonProductUrl,
    required this.publisher,
    required this.description,
  });

  factory BooksModel.fromJson(Map<String, dynamic> json) {
    return BooksModel(
      title: json['title'] ?? '',
      author: json['author'] ?? '',
      bookImage: json['book_image'] ?? '',
      amazonProductUrl: json['amazon_product_url'] ?? '',
      publisher: json['publisher'] ?? '',
      description: json['description'] ?? '',
    );
  }

  Null get amazonUrl => null;
}