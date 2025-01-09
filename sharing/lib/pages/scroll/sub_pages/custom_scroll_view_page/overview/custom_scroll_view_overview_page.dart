import 'package:flutter/material.dart';
import 'package:sharing/shared/scaffold_builder.dart';
import 'package:sharing/theme.dart';

/// Source
/// https://api.flutter.dev/flutter/widgets/CustomScrollView/slivers.html
/// https://api.flutter.dev/flutter/widgets/CustomScrollView-class.html
class CustomScrollViewOverviewPage extends StatelessWidget
    with ScaffoldBuilder {
  const CustomScrollViewOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return scaffold(
      appBarTitle: 'CustomScrollView',
      context: context,
      body:
          // _column(),
          // _singleScrollView(),
          _customScrollView(),
    );
  }

  Widget _column() {
    return Column(
      children: [
        Expanded(
          child: _list(),
        ),
        Container(
          color: AppColors.secondaryAccent,
          height: 20,
        ),
        Expanded(
          child: _list(),
        ),
      ],
    );
  }

  Widget _singleScrollView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _list(shrinkWrap: true),
          const SizedBox(height: 20),
          _list(shrinkWrap: true),
        ],
      ),
    );
  }

  Widget _list({
    bool shrinkWrap = false,
    int itemCount = 10,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(horizontal: 16),
  }) {
    return ListView.builder(
      shrinkWrap: shrinkWrap,
      physics: const ClampingScrollPhysics(),
      padding: padding,
      itemCount: itemCount,
      itemBuilder: (ctx, index) {
        return Column(
          children: [
            ListTile(
              dense: true,
              tileColor: AppColors.secondaryColor,
              splashColor: Colors.transparent,
              title: Text(
                'row $index',
                style: Theme.of(ctx).textTheme.bodyMedium,
              ),
            ),
            Container(
              color: AppColors.secondaryAccent,
              height: 10,
            ),
          ],
        );
      },
    );
  }

  Widget _customScrollView() {
    return CustomScrollView(
      slivers: [
        _sliverToBoxAdapterWithText('SliverAppBar'),
        // _appBarSliver(),
        _sliverToBoxAdapterWithText('SliverList'),
        _sliverToBoxAdapterWithText('SliverChildListDelegate'),
        _sliverListWithSliverChildListDelegate(),
        _sliverToBoxAdapterWithText('SliverChildBuilderDelegate'),
        _listSliverWithSliverChildBuilderDelegate(),
        _sliverToBoxAdapterWithText('SliverGrid'),
        _sliverGrid(),
        _sliverToBoxAdapterWithText('SliverToBoxAdapter'),
        _sliverToBoxAdapterWithHList(),
        _sliverToBoxAdapterWithText('SliverFillRemaining'),
        _sliverFillRemainingWithTabBarView(),
      ],
    );
  }
}

extension _Sliver on CustomScrollViewOverviewPage {
  Widget _sliverToBoxAdapterWithText(String text) {
    return SliverToBoxAdapter(
      child: Container(
        color: AppColors.secondaryAccent,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  Widget _sliverToBoxAdapterWithHList() {
    return SliverToBoxAdapter(
      child: Container(
        height: 120,
        color: AppColors.secondaryAccent,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              width: 120,
              height: 120,
              color: Colors.primaries[index % Colors.primaries.length],
            );
          },
        ),
      ),
    );
  }

  Widget _sliverListWithSliverChildListDelegate() {
    return SliverList(
      /// List 並不會有 lazy loading, 會馬上生成
      delegate: SliverChildListDelegate([
        Container(
          height: 100,
          color: Colors.grey,
        ),
      ]),
    );
  }

  Widget _listSliverWithSliverChildBuilderDelegate() {
    return SliverList(
      /// 有 lazy loading, 隨著滾動自行加載
      delegate: SliverChildBuilderDelegate(
        (BuildContext ctx, int index) {
          return Container(
            height: 50,
            color: Colors.primaries[index % Colors.primaries.length],
          );
        },
        childCount: 10,
      ),
    );
  }

  Widget _sliverGrid() {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 1,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            color: Colors.primaries[index % Colors.primaries.length],
          );
        },
        childCount: 10,
      ),
    );
  }

  Widget _sliverFillRemainingWithTabBarView() {
    List<String> tabs = ['A', 'B', 'C'];
    List<int> itemCounts = [5, 15, 20];

    /// 會自動填充到當前 viewport 的剩餘空間
    return SliverFillRemaining(
      child: DefaultTabController(
        length: tabs.length,
        child: LayoutBuilder(builder: (context, constraints) {
          /// Remove default tabBar cause render flex overflow
          double tabBarHeight =
              constraints.maxHeight >= 48 ? 48 : constraints.maxHeight;

          return Column(
            children: [
              Container(
                height: tabBarHeight,
                color: AppColors.secondaryAccent,
                child: TabBar(
                  tabs: tabs.map((tab) {
                    return Tab(
                      child: Text(tab),
                    );
                  }).toList(),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: itemCounts
                      .map(
                        (e) => _list(
                          itemCount: e,
                          padding: const EdgeInsets.all(16),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _appBarSliver() {
    return SliverAppBar(
      /// 是否顯示系統的 leading button
      /// back button etc...
      automaticallyImplyLeading: false,

      /// 中間的 widget
      title: const Text("AppBar"),

      /// 展開的最高高度
      expandedHeight: 200,

      /// 向上滑動的時候是否固定在上方
      // pinned: true,

      /// 向下滑動時是否馬上顯示在上方
      /// 與 pinned 互斥
      floating: true,

      /// 向下滑動時是否馬上顯示在上方, 並且放開後完整顯示
      /// 為 true 時, floating 一定要為 ture
      snap: true,

      /// AppBar background
      /// 裡面的 title 會貼在 appBar 下面
      flexibleSpace: const FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          "AppBar",
          style: TextStyle(color: Colors.white),
        ),
        background: ColoredBox(color: Colors.brown),

        /// 觸發 stretch 時的動畫效果
        stretchModes: [
          StretchMode.zoomBackground,
          StretchMode.fadeTitle,
          StretchMode.blurBackground,
        ],
      ),

      /// bouncing 的目標是否在 flexibleSpace
      stretch: true,

      /// title 後的 widgets
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite),
        ),
      ],
    );
  }
}
