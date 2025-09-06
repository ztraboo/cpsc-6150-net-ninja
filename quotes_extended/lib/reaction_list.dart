// IconButton class reference
// https://api.flutter.dev/flutter/material/IconButton-class.html?_gl=1*w65wbu*_gcl_aw*R0NMLjE3NTU3NDgzMjAuQ2owS0NRanc1SlhGQmhDckFSSXNBTDFja1B0UVRGU0xhcEpiMEY3SThza1JJRWxNa29VS3dGRXVuN0U4Rjl1LU5fNVpFc3FPeTFUVGRzUWFBcWF6RUFMd193Y0I.*_gcl_dc*R0NMLjE3NTU3NDgzMjAuQ2owS0NRanc1SlhGQmhDckFSSXNBTDFja1B0UVRGU0xhcEpiMEY3SThza1JJRWxNa29VS3dGRXVuN0U4Rjl1LU5fNVpFc3FPeTFUVGRzUWFBcWF6RUFMd193Y0I.*_ga*NjkyMTE2MzE4LjE3NTU3NDgyMDE.*_ga_04YGWK0175*czE3NTcxNjQ1NzIkbzE5JGcxJHQxNzU3MTY0ODkzJGoyMyRsMCRoMA..

import 'package:flutter/material.dart';

// Holds icon, label, color, and count information for a reaction.
class Reaction {
  final IconData icon;
  final String label;
  final Color color;
  int clicks;

  Reaction({
    required this.icon,
    required this.label,
    required this.color,
    this.clicks = 0
  });
}

class ReactionList extends StatefulWidget {
  const ReactionList({super.key});

  @override
  State<ReactionList> createState() => _ReactionListState();
}

class _ReactionListState extends State<ReactionList> {

  // Create a list that holds all Reaction objects.
  // Limiting this to 5 reactions for now to keep it on one row and avoid wrap.
  final List<Reaction> _reactions = [
    Reaction(icon: Icons.thumb_up, label: "Like", color: Colors.blueAccent),
    Reaction(icon: Icons.favorite, label: "Love", color: Colors.redAccent),
    Reaction(icon: Icons.lightbulb, label: "Insightful", color: Colors.amber.shade700),
    Reaction(icon: Icons.emoji_emotions, label: "Wow", color: Colors.green.shade700),
    Reaction(icon: Icons.sentiment_dissatisfied, label: "Sad", color: Colors.deepPurple),
  ];

  // When user clicks the Icon we want to increment the counter for the
  // clicked Reaction stored within the _reactions dictionary.
  void handleReaction(Reaction reaction) {
    setState(() {
      // Increment the selected reaction one
      reaction.clicks++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Initially had a Row widget but it produced `RenderFlex ... OVERFLOWING` errors.
    // Converted this to a Wrap widget instead to handle overflow.
    return Wrap(
        alignment: WrapAlignment.spaceEvenly,
        spacing: 0,
        // Traverse through all Icons and transforms the output by returning a
        // widget of IconButton and Text for the counters.
        // Using Row widget to keep the counters and Icons horizontally displayed.
        children: _reactions.map((reaction) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton.filledTonal(
                icon: Icon(reaction.icon), // Cast is need, otherwise it thinks its an Object.
                color: reaction.color,
                tooltip: 'Increase ${reaction.label} by 1',
                onPressed: () => handleReaction(reaction),
              ),
              SizedBox(width: 5),
              Text('${reaction.clicks}')
            ],
          );
        }).toList()
    );
  }
}
