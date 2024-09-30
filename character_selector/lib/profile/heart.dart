import 'package:character_selector/models/character.dart';
import 'package:character_selector/theme.dart';
import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  const Heart({super.key, required this.character});

  final Character character;

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _sizeAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _sizeAnimation = TweenSequence([
      TweenSequenceItem<double>(
        tween: Tween(begin: 25, end: 40),
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: Tween(begin: 40, end: 25),
        weight: 50,
      ),
    ]).animate(_animationController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return IconButton(
            onPressed: () {
              setState(() {
                widget.character.toggleIsFav();
              });

              _animationController.reset();
              _animationController.forward();
            },
            icon: Icon(
              Icons.favorite,
              color: widget.character.isFav ? AppColors.primaryAccent : Colors.grey[800],
              size: _sizeAnimation.value,
            ),
          );
        });
  }
}
