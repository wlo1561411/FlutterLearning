import 'package:flutter/material.dart';
import 'package:sharing/shared/scaffold_builder.dart';
import 'package:sharing/shared/title_builder.dart';

/// Source
/// https://api.flutter.dev/flutter/widgets/Column-class.html
class ColumnPage extends StatelessWidget with ScaffoldBuilder, TitleBuilder {
  const ColumnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return scaffold(
      appBarTitle: 'Column',
      context: context,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            title(context, 'MainAxisAlignment'),

            /// (default)
            _columnMainAxisAlignment(MainAxisAlignment.start),
            _columnMainAxisAlignment(MainAxisAlignment.center),
            _columnMainAxisAlignment(MainAxisAlignment.end),

            /// 第一個和最後一個子小部件貼近主軸的兩端, 其餘的子小部件之間有均等的間距
            _columnMainAxisAlignment(MainAxisAlignment.spaceBetween),

            /// 所有子小部件在主軸上均勻排列, 每個子小部件之間的間距相等, 包括兩端的空間
            _columnMainAxisAlignment(MainAxisAlignment.spaceEvenly),

            /// 子小部件在主軸上均勻排列, 每個子小部件之間有相等的間距, 兩端的空間是子小部件間距的一半
            _columnMainAxisAlignment(MainAxisAlignment.spaceAround),

            title(context, 'MainAxisSize'),

            /// (default)
            ElevatedButton(
              onPressed: () {
                _columnMainAxisSize(context, MainAxisSize.max);
              },
              child: const Text('MainAxisSize.max'),
            ).wrapped(),
            ElevatedButton(
              onPressed: () {
                _columnMainAxisSize(context, MainAxisSize.min);
              },
              child: const Text('MainAxisSize.min'),
            ).wrapped(),

            title(context, 'CrossAxisAlignment'),

            /// (default)
            _columnCrossAxisAlignment(CrossAxisAlignment.center),
            _columnCrossAxisAlignment(CrossAxisAlignment.start),
            _columnCrossAxisAlignment(CrossAxisAlignment.end),
            _columnCrossAxisAlignment(CrossAxisAlignment.stretch),
          ],
        ),
      ),
    );
  }

  Widget _columnMainAxisAlignment(MainAxisAlignment mainAxisAlignment) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      children: const [
        Icon(
          Icons.two_k_outlined,
          color: Colors.white70,
        ),
        Icon(
          Icons.three_k_outlined,
          color: Colors.white70,
        ),
        Icon(
          Icons.four_k_outlined,
          color: Colors.white70,
        ),
      ],
    ).wrapped(height: 200);
  }

  Widget _columnCrossAxisAlignment(CrossAxisAlignment crossAxisAlignment) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Container(
          color: Colors.red,
          width: 50,
          height: 30,
        ),
        Container(
          color: Colors.green,
          width: 100,
          height: 30,
        ),
        Container(
          color: Colors.blue,
          width: 150,
          height: 30,
        ),
      ],
    ).wrapped();
  }

  void _columnMainAxisSize(BuildContext context, MainAxisSize mainAxisSize) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return Center(
          widthFactor: 1,
          child: Container(
            color: Colors.red,
            child: Column(
              mainAxisSize: mainAxisSize,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.yellow.withOpacity(0.5),
                  height: 100,
                  width: 100,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

extension _Wrap on Widget {
  Widget wrapped({Color color = Colors.black26, double? height}) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      child: this,
    );
  }
}
