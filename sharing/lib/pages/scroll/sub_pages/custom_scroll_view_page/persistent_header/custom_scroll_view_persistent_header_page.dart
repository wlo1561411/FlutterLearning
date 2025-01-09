import 'package:flutter/material.dart';
import 'package:sharing/shared/scaffold_builder.dart';

class Section {
  const Section({
    required this.title,
    required this.items,
  });

  final String title;
  final List<String> items;
}

/// Source
/// https://api.flutter.dev/flutter/widgets/SliverPersistentHeader-class.html
class CustomScrollViewPersistentHeaderPage extends StatelessWidget
    with ScaffoldBuilder {
  const CustomScrollViewPersistentHeaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Section> sections = [
      Section(
        title: 'A',
        items: List.generate(5, (i) => '$i'),
      ),
      Section(
        title: 'B',
        items: List.generate(5, (i) => '$i'),
      ),
      Section(
        title: 'C',
        items: List.generate(5, (i) => '$i'),
      ),
      Section(
        title: 'D',
        items: List.generate(5, (i) => '$i'),
      ),
    ];

    return scaffold(
      appBarTitle: 'SliverPersistentHeader',
      context: context,
      body: CustomScrollView(
        slivers: [
          /// 讓 bouncing 是在最頂部
          const SliverToBoxAdapter(),
          ...sections
            .asMap()
            .entries
            .expand((entry) => _sliver(entry.value, entry.key)),
        ],
      ),
    );
  }

  List<Widget> _sliver(Section section, int index) {
    return [
      SliverPersistentHeader(
        pinned: true,
        delegate: PersistentHeaderDelegate(
          minHeight: 60,
          maxHeight: 60,
          child: Container(
            color: Colors.primaries[index % Colors.primaries.length],
            child: Center(
                child: Text(
              section.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            )),
          ),
        ),
      ),
      SliverFixedExtentList.builder(
        itemCount: section.items.length,
        itemExtent: 60,
        itemBuilder: (BuildContext ctx, int index) {
          return Text(section.items[index]);
        },
      ),
    ];
  }
}

class PersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  PersistentHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required Widget child,
  })  : builder = ((context, shrinkOffset, overlapsContent) => child),
        assert(minHeight <= maxHeight && minHeight >= 0);

  final double minHeight;
  final double maxHeight;
  final Widget Function(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) builder;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    Widget child = builder(context, shrinkOffset, overlapsContent);
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(PersistentHeaderDelegate oldDelegate) {
    return oldDelegate.maxExtent != maxExtent ||
        oldDelegate.minExtent != minExtent;
  }
}
