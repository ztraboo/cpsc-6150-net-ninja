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
    // Misattributed, no evidence from Wilde’s lifetime.
    Quote(
        author: 'Oscar Wilde',
        text: 'Be yourself; everyone else is already taken.',
    ),
    // 1882 (United States, New York Harbor)
    // Reportedly spoken by Wilde to a customs officer when arriving in New York
    // for his American lecture tour (January 1882).
    Quote(
        author: 'Oscar Wilde',
        text: 'I have nothing to declare except my genius.',
        category: Category(type: Category.location, description: 'New York Harbor'),
        createdAt: DateTime(1882, 01, 15),
    ),
    // 1895
    // From Wilde’s play The Importance of Being Earnest, Act I.
    Quote(
        author: 'Oscar Wilde',
        text: 'The truth is rarely pure and never simple.',
        category: Category(type: Category.play, description: 'The Importance of Being Earnest, Act I'),
        createdAt: DateTime(1985),
    )
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

