import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed; // Add this line

  const CategoryButton({
    Key? key,
    required this.label,
    this.isSelected = false,
    required this.onPressed, // Make this required
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: FilledButton(
        onPressed: onPressed, // Use the passed onPressed function
        style: FilledButton.styleFrom(
          backgroundColor: isSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.surface,
        ),
        child: Text(label),
      ),
    );
  }
}
