import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardBackGround extends StatelessWidget {
  const CardBackGround({
    super.key,
    required this.child,
    this.color,
    this.padding,
    this.margin,
    this.borderRadius,
    this.shadowSpread,
    this.shadowBlur,
    this.shadowColor,
  });

  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final double? shadowSpread;
  final double? shadowBlur;
  final Color? shadowColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        color: color ?? Colors.white,
        boxShadow: [
          BoxShadow(
            color:
                shadowColor?.withOpacity(0.5) ?? Colors.grey.withOpacity(0.5),
            spreadRadius: shadowSpread ?? 2,
            blurRadius: shadowBlur ?? 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }
}
