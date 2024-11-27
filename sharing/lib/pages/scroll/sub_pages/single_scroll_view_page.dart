import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sharing/shared/scaffold_builder.dart';

/// Source
/// https://api.flutter.dev/flutter/widgets/SingleChildScrollView-class.html
class SingleScrollViewPage extends StatefulWidget {
  const SingleScrollViewPage({super.key});

  @override
  State<SingleScrollViewPage> createState() => _SingleScrollViewPageState();
}

class _SingleScrollViewPageState extends State<SingleScrollViewPage>
    with ScaffoldBuilder {
  final _scrollController = ScrollController();
  bool _isScrollToTopButtonHidden = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_observeScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return scaffold(
      appBarTitle: 'SingleScrollView',
      context: context,
      body: Stack(
        children: [
          _verticalScroll(),
          // Center(child: _horizontalScroll()),

          Positioned(
            right: 20,
            top: 20,
            child: ElevatedButton(
              onPressed: () {
                _scrollController.animateTo(
                  0,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.linear,
                );
              },
              child: const Text('animate'),
            ),
          ),

          Positioned(
            left: 20,
            top: 20,
            child: ElevatedButton(
              onPressed: () {
                _scrollController.jumpTo(200);
              },
              child: const Text('jump'),
            ),
          ),

          if (!_isScrollToTopButtonHidden)
            Positioned(
              left: 20,
              bottom: 20,
              child: ElevatedButton(
                onPressed: () {
                  _scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear,
                  );
                },
                child: const Text('Top'),
              ),
            ),
        ],
      ),
    );
  }

  Widget _verticalScroll() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      controller: _scrollController,
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(20, (index) {
          return Container(
            color: Colors.black26,
            margin: const EdgeInsets.only(bottom: 20),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'item $index',
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _horizontalScroll() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      scrollDirection: Axis.horizontal,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: List.generate(20, (index) {
            return Container(
              color: Colors.black26,
              margin: const EdgeInsets.only(bottom: 20),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'item $index',
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  void _observeScroll() {
    final isScrollToTopButtonHidden = _scrollController.offset < 200;

    if (_isScrollToTopButtonHidden == isScrollToTopButtonHidden) return;

    setState(() {
      _isScrollToTopButtonHidden = isScrollToTopButtonHidden;
    });
  }
}
