import 'package:flutter/material.dart';
import 'package:sharing/shared/scaffold_builder.dart';
import 'package:sharing/shared/title_builder.dart';

/// Source
/// https://main-api.flutter.dev/flutter/material/CarouselView-class.html
class CarouselViewPage extends StatefulWidget {
  const CarouselViewPage({super.key});

  @override
  State<CarouselViewPage> createState() => _CarouselViewPageState();
}

class _CarouselViewPageState extends State<CarouselViewPage>
    with ScaffoldBuilder, TitleBuilder {
  final colors = [
    Colors.yellow,
    Colors.green,
    Colors.red,
    Colors.pink,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.brown,
  ];

  final _carouselController = CarouselController(initialItem: 1);

  @override
  void dispose() {
    _carouselController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return scaffold(
      appBarTitle: 'CarouselView',
      context: context,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            title(context, 'Uncontained'),
            _uncontained(context, itemSnapping: false),
            _uncontained(
              context,
              controller: _carouselController,
              itemSnapping: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    final offset = _carouselController.offset;

                    if (offset > 0) {
                      // _carouselController.jumpTo(offset - 200);
                      _carouselController.animateTo(
                        offset - 200,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeOut,
                      );
                    }
                  },
                  child: const Text('back'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final offset = _carouselController.offset;

                    if (offset < colors.length * 200) {
                      _carouselController.animateTo(
                        offset + 200,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  child: const Text('next'),
                ),
              ],
            ),
            title(context, 'Weighted'),
            _weighted(
              context,
              flexWeights: [1, 7, 1],
              consumeMaxWeight: false,
            ),
            _weighted(
              context,
              flexWeights: [1, 2, 3, 2, 1],
              consumeMaxWeight: false,
            ),
            _weighted(
              context,
              flexWeights: [1, 7, 1],
              consumeMaxWeight: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _uncontained(BuildContext context,
      {CarouselController? controller, required bool itemSnapping}) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 200),
      child: CarouselView(
        /// 是否允許 item 不完整顯示
        itemSnapping: itemSnapping,
        controller: controller,

        /// item 的寬度
        itemExtent: MediaQuery.sizeOf(context).width,

        /// 最小縮小程度
        shrinkExtent: 200,
        padding: const EdgeInsets.symmetric(vertical: 10),
        children: List.generate(
          colors.length,
          (index) => Container(
            color: colors[index],
          ),
        ),
      ),
    );
  }

  Widget _weighted(BuildContext context,
      {required List<int> flexWeights, required bool consumeMaxWeight}) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 200),
      child: CarouselView.weighted(
        /// item 的權重
        /// ex: [1, 7, 1]
        /// 則每個 item 寬度為
        /// CarouselView 本身寬度 / (1 + 7 + 1) * 當前 item 權重
        flexWeights: flexWeights,

        /// 使否允許邊界的 item 拉伸到最大寬度
        consumeMaxWeight: consumeMaxWeight,
        itemSnapping: true,
        padding: const EdgeInsets.all(5.0),
        children: List.generate(
          colors.length,
          (index) => Container(
            color: colors[index],
          ),
        ),
      ),
    );
  }
}
