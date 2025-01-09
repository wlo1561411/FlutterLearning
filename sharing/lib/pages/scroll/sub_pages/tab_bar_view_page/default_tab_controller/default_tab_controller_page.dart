import 'package:flutter/material.dart';
import 'package:sharing/shared/keep_alive_wrapper.dart';
import 'package:sharing/shared/scaffold_builder.dart';

/// Source
/// https://api.flutter.dev/flutter/material/TabBar-class.html
/// https://api.flutter.dev/flutter/material/TabBarView-class.html
/// https://api.flutter.dev/flutter/material/DefaultTabController-class.html
class DefaultTabControllerPage extends StatelessWidget
    with ScaffoldBuilder {
  const DefaultTabControllerPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> short = ['A', 'B', 'CCC', 'E'];
    List<String> long = [
      'A',
      'B',
      'CCC',
      'E',
      'F',
      'G',
      'H',
      'I',
      'J',
      'K',
      'L'
    ];

    return scaffold(
      appBarTitle: 'DefaultTabBarController',
      context: context,
      body:
      // _defaultTabBarControllerWithFullAlignment(short),
      // _defaultTabBarControllerWithCenterAlignment(short),
      _scrollableDefaultTabBarController(long),
    );
  }

  Widget _defaultTabBarControllerWithFullAlignment(List<String> tabs) {
    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Column(
        children: [
          Container(
            color: Colors.black,
            child: TabBar(

              /// 是否可以滑動
              /// 會影響到 tabAlignment
              isScrollable: false,

              /// isScrollable is false
              /// only TabAlignment.fill and TabAlignment.center are supported
              /// isScrollable is true
              /// only TabAlignment.start, TabAlignment.startOffset, and TabAlignment.center are supported.
              tabAlignment: TabAlignment.fill,

              /// 每個 tab 的 padding
              /// 預設為 EdgeInsets.symmetric(horizontal: 16)
              labelPadding: EdgeInsets.zero,

              /// tab label 選擇的顏色
              labelStyle: const TextStyle(color: Colors.red),

              /// tab label 未選擇的顏色
              unselectedLabelStyle: const TextStyle(color: Colors.white24),

              /// 點擊時的背景顏色
              overlayColor: WidgetStateProperty.all(Colors.red),

              /// 下方指標的高度
              indicatorWeight: 2,

              /// 下方指標的顏色
              indicatorColor: Colors.red,

              /// 下方指標的 style
              /// label: follow content
              /// tab: follow tab
              indicatorSize: TabBarIndicatorSize.label,

              /// 分隔線高度
              dividerHeight: 0,
              tabs: tabs.map((tab) {
                return Tab(child: Text(tab));
              }).toList(),
            ),
          ),
          Expanded(
            child:
            /// 必須要提供 TabController 或是在 DefaultTabController 下層
            TabBarView(
              children: tabs.map(
                    (tab) {
                  // return _list();
                  return KeepAliveWrapper(child: _list());
                },
              ).toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget _defaultTabBarControllerWithCenterAlignment(List<String> tabs) {
    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Column(
        children: [
          Ink(
            color: Colors.black,
            child: Center(
              child: TabBar(
                isScrollable: false,
                tabAlignment: TabAlignment.center,
                labelPadding: const EdgeInsets.symmetric(horizontal: 16),
                labelStyle: const TextStyle(color: Colors.red),
                unselectedLabelStyle: const TextStyle(color: Colors.white24),
                overlayColor: WidgetStateProperty.all(Colors.red),
                indicatorSize: TabBarIndicatorSize.tab,

                /// 自定義 indicator
                /// 預設是 UnderlineTabIndicator
                /// 大小會依據 indicatorSize 而影響
                indicator: UnderlineTabIndicator(
                  borderRadius: BorderRadius.circular(1),
                  borderSide: const BorderSide(width: 2, color: Colors.red),
                ),
                dividerHeight: 0,
                tabs: tabs.map((tab) {
                  return Tab(child: Text(tab));
                }).toList(),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: tabs.map((tab) {
                return _list();
              }).toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget _scrollableDefaultTabBarController(List<String> tabs) {
    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Column(
        children: [
          Ink(
            color: Colors.black,
            child: SizedBox(
              width: double.infinity,
              child: TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                labelStyle: const TextStyle(color: Colors.red),
                unselectedLabelStyle: const TextStyle(color: Colors.white24),
                overlayColor: WidgetStateProperty.all(Colors.green),
                indicatorSize: TabBarIndicatorSize.label,
                indicator: UnderlineTabIndicator(
                  borderRadius: BorderRadius.circular(1),
                  borderSide: const BorderSide(width: 2, color: Colors.red),
                ),
                dividerHeight: 0,
                tabs: tabs.map((tab) {
                  return Tab(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(tab),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: tabs.map((tab) {
                return _list();
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _list() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 20,
      itemExtent: 50,
      itemBuilder: (context, index) => Text(index.toString()),
    );
  }
}
