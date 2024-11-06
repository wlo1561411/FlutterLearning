import 'package:flutter/material.dart';
import 'package:sharing/shared/scaffold_builder.dart';
import 'package:sharing/shared/title_builder.dart';

/// Source
/// https://api.flutter.dev/flutter/widgets/Stack-class.html
class StackPage extends StatelessWidget with ScaffoldBuilder, TitleBuilder {
  const StackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return scaffold(
      appBarTitle: 'Stack',
      context: context,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            title(context, 'AlignmentDirectional'),

            /// (default)
            _stackAlignment(AlignmentDirectional.topStart),
            _stackAlignment(AlignmentDirectional.topCenter),
            _stackAlignment(AlignmentDirectional.topEnd),
            _stackAlignment(AlignmentDirectional.centerStart),
            _stackAlignment(AlignmentDirectional.center),
            _stackAlignment(AlignmentDirectional.centerEnd),
            _stackAlignment(AlignmentDirectional.bottomStart),
            _stackAlignment(AlignmentDirectional.bottomCenter),
            _stackAlignment(AlignmentDirectional.bottomEnd),

            title(context, 'StackFit'),

            /// 子小部件會根據其本身的大小來顯示, 不會擴展到填滿父容器 (default)
            _stackStackFit(StackFit.loose),

            /// 子小部件會填滿父容器的大小
            _stackStackFit(StackFit.expand),

            /// 子小部件如果有使用定位 Widget (Align, etc.) 會根據其本身大小顯示
            /// 但如果沒有, 並且有設置大小則會失效, 因為它們會遵循父容器的約束
            _stackStackFit(StackFit.passthrough),
          ],
        ),
      ),
    );
  }

  Widget _stackAlignment(AlignmentDirectional alignment) {
    return Stack(
      alignment: alignment,
      children: [
        Container(
          width: 50,
          height: 50,
          color: Colors.green,
        ),
      ],
    ).wrapped();
  }

  Widget _stackStackFit(StackFit fit) {
    return Stack(
      fit: fit,
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.blue.withOpacity(0.2),
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.green,
        ),
        Positioned(
          top: 20,
          left: 20,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
        ),
      ],
    ).wrapped();
  }
}

extension _Wrap on Widget {
  Widget wrapped({Color color = Colors.black26}) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        // borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      child: this,
    );
  }
}
