

import 'package:flutter/cupertino.dart';

class CustomAnimationWidget extends StatefulWidget {
  final Widget child; // The widget to animate
  final Duration duration; // Animation duration
  final Offset beginOffset; // Starting offset for SlideTransition
  final Offset endOffset; // Ending offset for SlideTransition

  const CustomAnimationWidget({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 1), // Default duration
    this.beginOffset = const Offset(1.0, 0.0), // Default start offset
    this.endOffset = Offset.zero, // Default end offset
  });

  @override
  CustomAnimationWidgetState createState() => CustomAnimationWidgetState();
}

class CustomAnimationWidgetState extends State<CustomAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _offsetAnimation = Tween<Offset>(
      begin: widget.beginOffset,
      end: widget.endOffset,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward(); // Start the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: widget.child,
    );
  }
}
