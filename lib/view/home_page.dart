import 'package:flutter/material.dart';
import 'package:getx_1009/services/books_service.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BooksNy _BooksNy = BooksNy();

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possível abrir $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: Text(
          'Livros Mais Lidos do The New York Times',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: FutureBuilder(
        future: _BooksNy.fetchBooksInformation(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Erro ao acessar API!'),
            );
          } else if (snapshot.hasData) {
            final books = snapshot.data!;
            return ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];
                return ListTile(
                  leading: book.bookImage.isNotEmpty
                      ? Image.network(
                          book.bookImage,
                          width: 50,
                          height: 75,
                          fit: BoxFit.cover,
                        )
                      : SizedBox(width: 50, height: 75),
                  title: Text(book.title),
                  subtitle: Text('Autor: ${book.author}'),
                  onTap: () {
                    var amazonUrl = book.amazonUrl;
                    _launchURL(amazonUrl);
                  },
                );
              },
            );
          } else {
            return Center(child: Text('Nenhum dado disponível'));
          }
        },
      ),
    );
  }
}
