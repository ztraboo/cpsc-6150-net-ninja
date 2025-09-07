import 'package:flutter/material.dart';
import 'category.dart';
import 'quote.dart';
import 'quote_card.dart';

void main() {
  runApp(MaterialApp(
    home: QuoteList(),
  ));
}

class QuoteList extends StatefulWidget {
  const QuoteList({super.key});

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {

  // List<String> quotes = [
  //   'Be yourself; everyone else is already taken',
  //   'I have nothing to declare except my genius',
  //   'The truth is rarely pure and never simple'
  // ];
  List<Quote> quotes = [
    // Recorded in The Analects (Book II, Chapter 17), a collection of sayings attributed to Confucius, compiled by his disciples.
    Quote(
      author: 'Confucius',
      text: 'Real knowledge is to know the extent of one’s ignorance.',
      category: Category(genre: CategoryGenre.general, origin: CategoryOrigin.publication, description: 'The Analects (Book II, Chapter 17)'),
      historicalDate: "circa 5th century BCE",
    ),
    // 1965 (Commencement address at Oberlin College, Ohio)
    Quote(
      author: 'Martin Luther King Jr.',
      text: 'The time is always right to do what is right.',
      category: Category(genre: CategoryGenre.inspiration, origin: CategoryOrigin.location, description: 'Oberlin College'),
      createdAt: DateTime(1965, 6, 23),
    ),
    // 1882 (United States, New York Harbor)
    // Reportedly spoken by Wilde to a customs officer when arriving in New York
    // for his American lecture tour (January 1882).
    Quote(
        author: 'Oscar Wilde',
        text: 'I have nothing to declare except my genius.',
        category: Category(genre: CategoryGenre.humor, origin: CategoryOrigin.location, description: 'New York Harbor'),
        createdAt: DateTime(1882, 01, 15),
    ),
    // Misattributed, no evidence from Wilde’s lifetime.
    Quote(
        author: 'Oscar Wilde',
        text: 'Be yourself; everyone else is already taken.',
        category: Category(genre: CategoryGenre.inspiration)
    ),
    // 1895
    // From Wilde’s play The Importance of Being Earnest, Act I.
    Quote(
        author: 'Oscar Wilde',
        text: 'The truth is rarely pure and never simple.',
        category: Category(genre: CategoryGenre.general, origin: CategoryOrigin.publication, description: 'The Importance of Being Earnest, Act I'),
        createdAt: DateTime(1985),
    ),
    // Often appears in speeches and interviews where Einstein reflected on perseverance during scientific struggles.
    Quote(
        author: 'Albert Einstein',
        text: "In the middle of every difficulty lies opportunity.",
        category: Category(genre: CategoryGenre.inspiration, origin: CategoryOrigin.speech, description: 'Speeches and Interviews')
    ),
    // From Twain’s lecture notes and later included in More Maxims of Mark Twain (published posthumously in 1927).
    Quote(
      author: 'Mark Twain',
      text: 'Clothes make the man. Naked people have little or no influence on society.',
      category: Category(genre: CategoryGenre.humor, origin: CategoryOrigin.publication, description: 'More Maxims of Mark Twain'),
      createdAt: DateTime(1927),
    ),
    // 1748 Advice to a Young Tradesman
    // A practical observation about economics and daily life.
    Quote(
      author: 'Benjamin Franklin',
      text: 'Time is money.',
      category: Category(genre: CategoryGenre.general, origin: CategoryOrigin.publication, description: 'Advice to a Young Tradesman'),
      createdAt: DateTime(1748),
    ),
  ];

  // Handles deleting of the QuoteCard from the ListView.
  // Prompts the user to confirm the deletion.
  void handleQuoteCardDelete(Quote quote) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Delete quote?'),
        content: const Text('This cannot be undone.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          ElevatedButton(onPressed: () => Navigator.pop(context, true), child: const Text('Delete')),
        ],
      ),
    ) ?? false;

    if (ok) {
      setState(() {
        quotes.remove(quote);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Awesome Quotes"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: ListView.builder(
          itemCount: quotes.length,
          itemBuilder: (context, index) {
            Quote quote = quotes[index];
            return QuoteCard(
                quote: quote,
                onDelete: () => handleQuoteCardDelete(quote),
            );
          })
    );
  }
}

