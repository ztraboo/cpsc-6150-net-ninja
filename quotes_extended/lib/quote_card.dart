import 'package:flutter/material.dart';
import 'package:quotes/category_chip.dart';
import 'quote.dart';
import 'date_chip.dart';
import 'historical_date_chip.dart';
import 'reaction_list.dart';
import 'category.dart';

class QuoteCard extends StatelessWidget {
  // const QuoteCard({
  //   super.key,
  // });

  // Because of StatelessWidget we're saying that we're not changing this
  // value once set. StatefulWidgets allow for change.
  final Quote quote;

  // Callback to notify the parent to delete this QuoteCard from the ListView.
  final VoidCallback onDelete;

  QuoteCard({ required this.quote, required this.onDelete });
  
  // Get background Card color based on Quote category.
  Color _cardColor(CategoryGenre categoryGenre) {
    switch (categoryGenre) {
      case CategoryGenre.general:
        return Colors.blueAccent.shade100.withValues(alpha: 0.50);
      case CategoryGenre.humor:
        return Colors.amber.shade100;
      case CategoryGenre.inspiration:
        return Colors.grey.shade100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      color: _cardColor(quote.category.genre),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start, // Puts the delete icon at same level as quote.
              children: [
                // Allow quote text to be expanded the full width and the trash icon button to be what's left.
                Expanded(
                  child: Text(
                    '"${quote.text}"',
                    style: TextStyle(
                        fontFamily: "IndieFlower",
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: Colors.grey[800]
                    ),
                    softWrap: true, // Explicit defined to avoid truncating the text.
                  )
                ),
                IconButton(
                  icon: Icon(Icons.delete_outline_sharp, color: Colors.black54),
                  onPressed: onDelete, // Call the passed-in onDelete callback
                  tooltip: 'Delete Quote',
                  iconSize: 25.0,
                  padding: EdgeInsets.all(0.0),
                ),
              ],
            ),
            // Using padding to align the author text to be at the end of the quote and a little bit larger.
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 25.0, 0.0),
              child: Text(
                "– ${quote.author}",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                ),
                textAlign: TextAlign.right,
              ),
            ),
            SizedBox(height: 6),
            Wrap(
              spacing: 8,
              children: [
                (quote.category.origin != CategoryOrigin.none) ? CategoryChip(category: quote.category) : Container(),
                quote.createdAtExists
                    ? DateChip(date: quote.createdAt)
                    : const SizedBox.shrink(), // empty widget if false
                quote.historicalDateExists
                    ? HistoricalDateChip(date: quote.historicalDate as String)
                    : const SizedBox.shrink(), // empty widget if false
              ],
            ),
            ReactionList()
          ],
        ),
      ),
    );
  }
}


