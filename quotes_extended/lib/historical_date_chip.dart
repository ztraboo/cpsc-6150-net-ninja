import 'package:flutter/material.dart';

class HistoricalDateChip extends StatelessWidget {
  /*
  Material Chip that puts a date icon to the left of a historical date.
   */
  final String date;

  const HistoricalDateChip({
    required this.date
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      // Left icon inside the chip
      avatar: const Icon(
          Icons.history_outlined,
          size: 18,
          color: Colors.black
      ),
      label: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Cited:",
            style: TextStyle(
              color: Colors.grey.shade900,
              letterSpacing: 1.25,
              fontWeight: FontWeight.w600
            ),
          ),
          SizedBox(width: 6.0),
          Text(
            date,
            style: TextStyle(
                color: Colors.green.shade800,
                fontWeight: FontWeight.w600
            ),
          ),
        ]
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    );
  }
}
