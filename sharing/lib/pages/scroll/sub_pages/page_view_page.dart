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
          const SizedBox(height: 30),
          _pageView(allowImplicitScrolling: false, isKeepAlive: true),
        ],
      ),
    );
  }

  Widget _pageView({
    required bool allowImplicitScrolling,
    bool isKeepAlive = false,
  }) {
    return SizedBox(
      height: 100,
      child: PageView.builder(
        /// 預設緩存當前頁面前一頁跟後一頁
        allowImplicitScrolling: allowImplicitScrolling,
        itemCount: 5,
        itemBuilder: (context, index) {
          if (isKeepAlive) {
            return KeepAliveExamplePage(index: index.toString());
          } else {
            return ExamplePage(index: index.toString());
          }
        },
      ),
    );
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({
    super.key,
    required this.index,
  });

  final String index;

  @override
  Widget build(BuildContext context) {
    print('page $index build');

    return Container(
      color: Colors
          .primaries[(int.tryParse(index) ?? 0) % Colors.primaries.length],
      child: Center(
        child: Text(
          'Page $index',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class KeepAliveExamplePage extends StatefulWidget {
  const KeepAliveExamplePage({
    super.key,
    required this.index,
  });

  final String index;

  @override
  State<KeepAliveExamplePage> createState() => _KeepAliveExamplePageState();
}

class _KeepAliveExamplePageState extends State<KeepAliveExamplePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    print('page ${widget.index} disposed');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// 必須執行
    /// 告訴上層 widget 此頁要保存在內存中
    super.build(context);
    return ExamplePage(index: widget.index);
  }
}
