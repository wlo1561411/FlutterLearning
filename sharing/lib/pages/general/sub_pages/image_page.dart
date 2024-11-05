import 'package:flutter/material.dart';
import 'package:sharing/shared/scaffold_builder.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBuilder.title(
      appBarTitle: 'Image',
      context: context,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              // networkImage(),
              _imageBoxFit(BoxFit.none), // 不縮放，保持原始大小
              _imageBoxFit(BoxFit.contain), // 縮放以適應容器，保持寬高比
              _imageBoxFit(BoxFit.cover), // 縮放以填滿容器，可能會裁剪圖像
              _imageBoxFit(BoxFit.fill), // 拉伸以完全填滿容器，不保持寬高比
              _imageBoxFit(BoxFit.fitWidth), // 縮放以適應容器的寬度，保持寬高比
              _imageBoxFit(BoxFit.fitHeight), // 縮放以適應容器的高度，保持寬高比
              _imageBoxFit(BoxFit.scaleDown), // 在小於容器時不縮放，大於容器時縮小以適應容器
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
      width: 200,
      height: 150,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.asset(
        'assets/screen.png',
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _clipRRect() {
    return Container(
      width: 200,
      height: 150,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'assets/screen.png',
          fit: BoxFit.fill,
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
