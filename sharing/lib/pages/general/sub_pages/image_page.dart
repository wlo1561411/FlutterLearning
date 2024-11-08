import 'package:flutter/material.dart';
import 'package:sharing/shared/scaffold_builder.dart';
import 'package:sharing/shared/title_builder.dart';

/// Source
/// https://api.flutter.dev/flutter/widgets/Image-class.html
class ImagePage extends StatelessWidget with ScaffoldBuilder, TitleBuilder {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return scaffold(
      appBarTitle: 'Image',
      context: context,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              title(context, 'Image.network'),
              _networkImage(),

              title(context, 'BoxFit'),

              /// 不縮放, 保持原始大小
              _imageBoxFit(BoxFit.none),

              /// 縮放以適應容器, 保持寬高比
              _imageBoxFit(BoxFit.contain),

              /// 縮放以填滿容器, 可能會裁剪圖像
              _imageBoxFit(BoxFit.cover),

              /// 拉伸以完全填滿容器, 不保持寬高比
              _imageBoxFit(BoxFit.fill),

              /// 拉伸以完全填滿容器, 不保持寬高比
              _imageBoxFit(BoxFit.fitWidth),

              /// 縮放以適應容器的高度, 保持寬高比
              _imageBoxFit(BoxFit.fitHeight),

              /// 在小於容器時不縮放, 大於容器時縮小以適應容器
              _imageBoxFit(BoxFit.scaleDown),

              title(context, 'ClipRRect'),
              _withoutClipRRect(),
              _clipRRect(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _imageBoxFit(BoxFit fit) {
    return Container(
      color: Colors.grey,
      width: 200,
      height: 150,
      margin: const EdgeInsets.only(bottom: 16),
      child: Image.asset(
        'assets/banner.png',
        fit: fit,
      ),
    );
  }

  Widget _withoutClipRRect() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      // clipBehavior: Clip.hardEdge,
      child: Image.asset(
        'assets/screen.png',
        fit: BoxFit.fill,
        width: 200,
        height: 150,
      ),
    );
  }

  Widget _clipRRect() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'assets/screen.png',
          fit: BoxFit.fill,
          width: 200,
          height: 150,
        ),
      ),
    );
  }

  Widget _networkImage() {
    return Container(
      width: 300,
      height: 150,
      margin: const EdgeInsets.only(bottom: 16),
      child: Image.network(
        'https://www.daily.co/blog/content/images/2023/07/Flutter-feature.png',
        loadingBuilder: (ctx, child, progress) {
          if (progress == null) {
            return child;
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
