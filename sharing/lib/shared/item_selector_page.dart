import 'package:flutter/material.dart';
import 'package:sharing/shared/scaffold_builder.dart';

class ItemSelectorPage extends StatelessWidget with ScaffoldBuilder {
  const ItemSelectorPage({
    super.key,
    required this.title,
    required this.items,
    required this.onItemTap,
  });

  final String title;
  final List<String> items;
  final void Function(int) onItemTap;

  @override
  Widget build(BuildContext context) {
    return scaffold(
      appBarTitle: title,
      context: context,
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        itemCount: items.length,
        itemExtent: 60,
        itemBuilder: (ctx, index) {
          final item = items[index];

          return GestureDetector(
            onTap: () => onItemTap(index),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      item,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
