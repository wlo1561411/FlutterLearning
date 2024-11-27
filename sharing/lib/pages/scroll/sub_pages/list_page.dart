import 'package:flutter/material.dart';
import 'package:sharing/shared/scaffold_builder.dart';

/// Source
/// https://api.flutter.dev/flutter/widgets/ListView-class.html
class ListPage extends StatelessWidget with ScaffoldBuilder {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return scaffold(
      appBarTitle: 'List',
      context: context,
      body:
          _listWithItemExtent(),
          // _listWithPrototypeItem(),
          // _listWithSeparator(),
    );
  }

  Widget _listWithItemExtent() {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: 20,
      itemExtent: 63,
      itemBuilder: (context, index) {
        return _item('item $index');
      },
    );
  }

  Widget _listWithPrototypeItem() {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: 20,
      prototypeItem: _item('prototype'),
      itemBuilder: (context, index) {
        return _item('item $index');
      },
    );
  }

  Widget _listWithSeparator() {
    return ListView.separated(
      padding: const EdgeInsets.all(8.0),
      itemCount: 20,
      itemBuilder: (context, index) {
        return _item('item $index');
      },
      separatorBuilder: (context, index) => const Divider(height: 1),
    );
  }

  Widget _item(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      padding: const EdgeInsets.all(16.0),
      color: Colors.black26,
      child: Text(
        text,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
