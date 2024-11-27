import 'package:flutter/material.dart';
import 'package:sharing/shared/scaffold_builder.dart';

/// Source
/// https://api.flutter.dev/flutter/widgets/PageView-class.html
class PageViewPage extends StatelessWidget with ScaffoldBuilder {
  const PageViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return scaffold(
      appBarTitle: 'Page',
      context: context,
      body: Column(
        children: [
          _pageView(allowImplicitScrolling: false),
          const SizedBox(height: 30),
          _pageView(allowImplicitScrolling: true),
        ],
      ),
    );
  }

  Widget _pageView({required bool allowImplicitScrolling}) {
    return SizedBox(
      height: 100,
      child: PageView.builder(
        allowImplicitScrolling: allowImplicitScrolling,
        itemCount: 5,
        itemBuilder: (context, index) {
          return _Page(index: index);
        },
      ),
    );
  }
}

class _Page extends StatelessWidget {
  const _Page({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    print('page $index build');

    return Container(
      color: Colors.primaries[index % Colors.primaries.length],
      child: Center(
        child: Text(
          'Page $index',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
