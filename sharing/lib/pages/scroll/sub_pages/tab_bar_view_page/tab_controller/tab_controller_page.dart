import 'package:flutter/material.dart';
import 'package:sharing/shared/scaffold_builder.dart';

/// Source
/// https://api.flutter.dev/flutter/material/TabController-class.html
class TabControllerPage extends StatefulWidget {
  const TabControllerPage({super.key});

  @override
  State<TabControllerPage> createState() => _TabControllerPageState();
}

class _TabControllerPageState extends State<TabControllerPage>
    with ScaffoldBuilder, SingleTickerProviderStateMixin {
  final _tabs = const [
    'Apple',
    'Ball',
    'Car',
  ];

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      initialIndex: 1,
      length: _tabs.length,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return scaffold(
      appBarTitle: 'TabController',
      context: context,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _button(
                  'previous',
                  () {
                    int index = _tabController.index - 1 < 0
                        ? 0
                        : _tabController.index - 1;
                    _tabController.animateTo(index);
                  },
                ),
                RoundedTabBar(
                  tabs: _tabs,
                  tabController: _tabController,
                ),
                _button(
                  'next',
                  () {
                    int index = _tabController.index + 1 > _tabs.length - 1
                        ? _tabs.length - 1
                        : _tabController.index + 1;
                    _tabController.animateTo(index);
                  },
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: _tabs.map((tab) => Center(child: Text(tab))).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _button(String text, void Function()? onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
            padding: const WidgetStatePropertyAll(EdgeInsets.all(4)),
          ),
      child: Text(text),
    );
  }
}

class RoundedTabBar extends StatelessWidget {
  const RoundedTabBar({
    super.key,
    required this.tabs,
    required this.tabController,
  });

  final List<String> tabs;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = this.tabs.map((tab) {
      return Tab(
        child: Text(tab),
      );
    }).toList();

    return Ink(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: BorderRadius.circular(25),
      ),
      child: TabBar(
        controller: tabController,
        tabAlignment: TabAlignment.center,
        dividerHeight: 0,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.black26,
        indicatorSize: TabBarIndicatorSize.tab,
        overlayColor: WidgetStatePropertyAll(Colors.red.withValues(alpha: 0.5)),
        splashBorderRadius: BorderRadius.circular(25),
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.red,
        ),
        labelPadding: const EdgeInsets.symmetric(horizontal: 20),
        tabs: tabs,
      ),
    );
  }
}
