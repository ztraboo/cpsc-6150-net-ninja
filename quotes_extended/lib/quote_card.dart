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

  QuoteCard({ required this.quote });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '"${quote.text}"',
              style: TextStyle(
                  fontFamily: "IndieFlower",
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: Colors.grey[600]
              ),
            ),
            SizedBox(height: 6.0),
            Text(
              "--${quote.author}",
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800]
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


