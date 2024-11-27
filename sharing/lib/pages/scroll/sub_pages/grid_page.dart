import 'package:flutter/material.dart';
import 'package:sharing/shared/scaffold_builder.dart';

/// Source
/// https://api.flutter.dev/flutter/widgets/GridView-class.html
class GridPage extends StatelessWidget with ScaffoldBuilder {
  const GridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return scaffold(
      appBarTitle: 'Grid',
      context: context,
      body:
          _gridWithFixedCrossCount(Axis.vertical),
          // _gridFixedCrossCountHorizontal(context),
          // _gridWithMaxCrossAxisExtent(),
    );
  }

  Widget _gridWithFixedCrossCount(Axis scrollDirection) {
    return GridView.builder(
      scrollDirection: scrollDirection,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        /// 交叉軸向的子 widget 數量
        crossAxisCount: 3,

        /// 主軸的子 widget space
        mainAxisSpacing: 10,

        /// 交叉軸的子 widget space
        crossAxisSpacing: 10,

        /// widget ratio
        childAspectRatio: 1,
      ),
      itemCount: 10,
      itemBuilder: (context, index) => _colorBox(index),
    );
  }

  Widget _gridFixedCrossCountHorizontal(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).width,
      child: _gridWithFixedCrossCount(Axis.horizontal),
    );
  }

  Widget _gridWithMaxCrossAxisExtent() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        /// widget 在 交叉軸上的最大寬度或高度
        /// 實際算法
        /// 列數: grid 整體寬度 / maxCrossAxisExtent + crossAxisSpacing
        /// 子 widget 寬度或高度: grid 整體寬度 - (crossAxisSpacing * (列數 - 1)) / 列數
        maxCrossAxisExtent: 100,

        /// 主軸的子 widget space
        mainAxisSpacing: 10,

        /// 交叉軸的子 widget space
        crossAxisSpacing: 10,

        /// 子 widget ratio
        childAspectRatio: 1,
      ),
      itemCount: 10,
      itemBuilder: (context, index) => _colorBox(index),
    );
  }

  Widget _colorBox(int index) {
    return Container(
      color: Colors.primaries[index % Colors.primaries.length],
    );
  }
}
