import 'package:flutter/material.dart';
import 'package:sharing/theme.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.gradient,
    this.borderRadius,
  });

  final void Function() onPressed;
  final Widget child;
  final Gradient? gradient;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            gradient: gradient ??
                LinearGradient(
                  colors: [
                    AppColors.primaryColor,
                    AppColors.primaryAccent,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
            borderRadius:
                borderRadius ?? const BorderRadius.all(Radius.circular(5)),
          ),
          child: child,
        ));
  }
}
