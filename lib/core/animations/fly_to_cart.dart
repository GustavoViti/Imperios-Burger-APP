import 'package:flutter/material.dart';

class FlyToCart extends StatefulWidget {
  final Widget child;
  final Offset start;
  final Offset end;
  final Duration duration;

  const FlyToCart({
    super.key,
    required this.child,
    required this.start,
    required this.end,
    this.duration = const Duration(milliseconds: 700),
  });

  @override
  State<FlyToCart> createState() => _FlyToCartState();
}

class _FlyToCartState extends State<FlyToCart>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _position;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _position = Tween<Offset>(
      begin: widget.start,
      end: widget.end,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic),
    );

    _scale = Tween<double>(
      begin: 1,
      end: 0.2,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Positioned(
          left: _position.value.dx,
          top: _position.value.dy,
          child: Transform.scale(
            scale: _scale.value,
            child: widget.child,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
