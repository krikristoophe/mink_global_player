import 'package:flutter/material.dart';

class SliderWithTitle extends StatelessWidget {
  final double value;
  final void Function(double) onChanged;
  final String title;

  const SliderWithTitle({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(title),
            Slider(
              value: value,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
