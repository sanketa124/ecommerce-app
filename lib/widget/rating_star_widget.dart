import 'package:flutter/material.dart';

class RatingStarWidget extends StatelessWidget {
  final int rating;
  const RatingStarWidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (int i = 0; i < 5; i++) {
      children.add(i < rating
          ? const Icon(
              Icons.star,
              color: Colors.orange,
              size: 1,
            )
          : const Icon(
              Icons.star_border,
              color: Colors.orange,
              size: 1,
            ));
    }
    return Row(
      children: children,
    );
  }
}
