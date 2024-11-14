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
        itemSnapping: itemSnapping,
        controller: controller,
        itemExtent: MediaQuery.sizeOf(context).width,
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
        flexWeights: flexWeights,
        itemSnapping: true,
        consumeMaxWeight: consumeMaxWeight,
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
