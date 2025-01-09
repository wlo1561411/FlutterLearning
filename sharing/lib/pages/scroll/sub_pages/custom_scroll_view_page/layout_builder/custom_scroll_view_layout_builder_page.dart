import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sharing/pages/scroll/sub_pages/custom_scroll_view_page/persistent_header/custom_scroll_view_persistent_header_page.dart';
import 'package:sharing/shared/scaffold_builder.dart';

/// Source
/// https://api.flutter.dev/flutter/widgets/SliverLayoutBuilder-class.html
class CustomScrollViewLayoutBuilderPage extends StatelessWidget
    with ScaffoldBuilder {
  const CustomScrollViewLayoutBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return scaffold(
      appBarTitle: 'SliverLayoutBuilder',
      context: context,
      body: CustomScrollView(
        slivers: [
          SliverLayoutBuilder(
            builder: (context, constraints) {
              double fontSize = max(min(50, constraints.scrollOffset / 5), 20);

              return SliverPersistentHeader(
                pinned: true,
                delegate: PersistentHeaderDelegate(
                  minHeight: 60,
                  maxHeight: 200,
                  child: Container(
                    color: Colors.blueAccent,
                    child: Center(
                      child: Text(
                        'Dynamic Title',
                        style: TextStyle(fontSize: fontSize, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    'Item $index',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}