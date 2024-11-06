import 'package:flutter/material.dart';
import 'package:sharing/shared/scaffold_builder.dart';
import 'package:sharing/shared/title_builder.dart';

class AlignPage extends StatelessWidget with ScaffoldBuilder, TitleBuilder {
  const AlignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return scaffold(
      appBarTitle: 'Align',
      context: context,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 座標中心點為矩形中心點
            title(context, 'Alignment'),
            _alignment(Alignment.centerRight),
            const SizedBox(height: 20),
            _alignment(Alignment.centerLeft),

            /// 子小部件會依據數值撐大
            title(context, 'Size Factor'),
            _alignmentWithFactor(Alignment.centerRight, 3),

            /// 座標中心點為矩形中心點
            title(context, 'Size Factor, Alignment(x, y)'),

            _alignmentWithFactor(const Alignment(-1, -1), 3),
            const SizedBox(height: 20),
            _alignmentWithFactor(const Alignment(1, -1), 3),
            const SizedBox(height: 20),
            Row(
              children: [
                _alignmentWithFactor(const Alignment(2, -1), 3),
                Container(
                  color: Colors.blue,
                  width: 20,
                  height: 20,
                )
              ],
            ),

            /// 座標中心點為矩形最左上點
            title(context, 'FractionalOffset'),

            _alignmentWithFactor(const FractionalOffset(0, 0), 3),
            const SizedBox(height: 20),
            _alignmentWithFactor(const FractionalOffset(1, 0), 3),
            const SizedBox(height: 20),
            Row(
              children: [
                _alignmentWithFactor(const FractionalOffset(1.5, 0), 3),
                Container(
                  color: Colors.blue,
                  width: 20,
                  height: 20,
                )
              ],
            ),

            title(context, 'Center'),

            /// widthFactor, heightFactor is null (default)
            /// 代表會盡量往對應方向擴展
            center(widthFactor: null),
            const SizedBox(height: 20),

            /// 1 代表會以子小部件做為寬度最大值
            center(widthFactor: 1),
          ],
        ),
      ),
    );
  }

  Widget _alignment(Alignment alignment) {
    return Container(
      height: 200,
      width: 200,
      color: Colors.green,
      child: Align(
        alignment: alignment,
        child: Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
      ),
    );
  }

  Widget _alignmentWithFactor(Alignment alignment, double factor) {
    return Container(
      color: Colors.green,
      child: Align(
        alignment: alignment,
        widthFactor: factor,
        heightFactor: factor,
        child: Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
      ),
    );
  }

  Widget center({required double? widthFactor}) {
    return Center(
      widthFactor: widthFactor,
      child: Container(
        color: Colors.green,
        width: 100,
        height: 100,
      ),
    );
  }
}
