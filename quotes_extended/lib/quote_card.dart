import 'package:flutter/material.dart';
import 'package:quotes/category_chip.dart';
import 'quote.dart';
import 'date_chip.dart';
import 'reaction_list.dart';

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

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start, // Puts the delete icon at same level as quote.
              children: [
                // Allow quote text to be smaller than available Row width
                // and wrap text if it's too long.
                // Using Flexible to portion the amount of horizontal space that the quote and delete icon take up for the Row.
                Flexible(
                  flex: 18,
                  child: Text(
                    '"${quote.text}"',
                    style: TextStyle(
                        fontFamily: "IndieFlower",
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: Colors.grey[600]
                    ),
                    softWrap: true, // Explicit defined to avoid truncating the text.
                  )
                ),
                Flexible(
                  flex: 1,
                  child: IconButton(
                    icon: Icon(Icons.delete_outline, color: Colors.redAccent),
                    onPressed: onDelete, // Call the passed-in onDelete callback
                    tooltip: 'Delete Quote',
                    iconSize: 25.0,
                    padding: EdgeInsets.all(0.0),
                  ),
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
                CategoryChip(category: quote.category),
                quote.attributed
                    ? DateChip(date: quote.createdAt)
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


