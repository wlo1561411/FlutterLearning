import 'package:flutter/material.dart';
import 'package:sharing/shared/scaffold_builder.dart';

import 'package:sharing/shared/title_builder.dart';

/// Source
/// https://api.flutter.dev/flutter/widgets/Row-class.html
class RowPage extends StatelessWidget with ScaffoldBuilder, TitleBuilder {
  const RowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return scaffold(
      appBarTitle: 'Row',
      context: context,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title(context, 'MainAxisAlignment'),

            /// (default)
            _rowMainAxisAlignment(MainAxisAlignment.start),
            _rowMainAxisAlignment(MainAxisAlignment.center),
            _rowMainAxisAlignment(MainAxisAlignment.end),

            /// 第一個和最後一個子小部件貼近主軸的兩端, 其餘的子小部件之間有均等的間距
            _rowMainAxisAlignment(MainAxisAlignment.spaceBetween),

            /// 所有子小部件在主軸上均勻排列, 每個子小部件之間的間距相等, 包括兩端的空間
            _rowMainAxisAlignment(MainAxisAlignment.spaceEvenly),

            /// 子小部件在主軸上均勻排列, 每個子小部件之間有相等的間距, 兩端的空間是子小部件間距的一半
            _rowMainAxisAlignment(MainAxisAlignment.spaceAround),

            title(context, 'MainAxisSize'),

            /// 會填滿剩餘空間 (default)
            _rowMainAxisSize(MainAxisSize.max, MainAxisAlignment.center),
            _rowMainAxisSize(MainAxisSize.max, MainAxisAlignment.spaceBetween),

            /// 以最小寬度做約束
            _rowMainAxisSize(MainAxisSize.min, MainAxisAlignment.center),
            _rowMainAxisSize(MainAxisSize.min, MainAxisAlignment.spaceBetween),

            title(context, 'CrossAxisAlignment'),

            /// (default)
            _rowCrossAxisAlignment(CrossAxisAlignment.center),
            _rowCrossAxisAlignment(CrossAxisAlignment.start),
            _rowCrossAxisAlignment(CrossAxisAlignment.end),
            _rowCrossAxisAlignment(CrossAxisAlignment.stretch),

            title(context, 'Real case'),

            _listRow('Settings'),
            // _listRow('SettingsSettingsSettingsSettingsSettingsSettingsSettings'),
            // _listRowWithExpand('SettingsSettingsSettingsSettingsSettingsSettingsSettings'),
          ],
        ),
      ),
    );
  }

  Widget _rowMainAxisAlignment(MainAxisAlignment mainAxisAlignment) {
    return Row(
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
    ).wrapped();
  }

  Widget _rowCrossAxisAlignment(CrossAxisAlignment crossAxisAlignment) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Container(
          color: Colors.red,
          width: 30,
          height: 30,
        ),
      ],
    ).wrapped(height: 100);
  }

  Widget _rowMainAxisSize(
      MainAxisSize mainAxisSize, MainAxisAlignment mainAxisAlignment) {
    return Row(
      mainAxisSize: mainAxisSize,
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
    ).wrapped();
  }

  Widget _listRow(String text) {
    return Row(
      children: [
        const Icon(Icons.settings, color: Colors.grey),
        const SizedBox(width: 10),
        // Container(color: Colors.yellow, child: Text(text)),
        Text(text),
        const Spacer(),
        const Icon(Icons.arrow_right, color: Colors.grey),
      ],
    ).wrapped();
  }

  Widget _listRowWithExpand(String text) {
    return Row(
      children: [
        const Icon(Icons.settings, color: Colors.grey),
        const SizedBox(width: 10),
        Expanded(child: Text(text)),
        const Icon(Icons.arrow_right, color: Colors.grey),
      ],
    ).wrapped();
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
