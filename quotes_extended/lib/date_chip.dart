import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateChip extends StatelessWidget {
  /*
  Material Chip that puts a date icon to the left of a formatted date.
   */
  final DateTime date;
  final String pattern;

  const DateChip({
    required this.date,
    this.pattern = 'MMM d, yyyy', // e.g. Jan 15, 1882
  });

  @override
  Widget build(BuildContext context) {
    final label = DateFormat(pattern).format(date);

    return Chip(
      // Left icon inside the chip
      avatar: const Icon(
          Icons.create,
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
            label,
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
