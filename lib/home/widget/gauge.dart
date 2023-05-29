import 'dart:math';

import 'package:flutter/material.dart';
import '../../common/const/app_theme.dart';

class CustomGauge extends StatefulWidget {
  final double progress; // 진행 상태

  CustomGauge({
    required this.progress,
  });

  @override
  _CustomGaugeState createState() => _CustomGaugeState();
}

class _CustomGaugeState extends State<CustomGauge> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CustomGaugePainter(
        progress: widget.progress,
        strokeWidth: 35,
        backgroundColor: AppTheme.primaryDisabled,
        progressColor: AppTheme.red,
      ),
      child: Container(),
    );
  }
}

class _CustomGaugePainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final Color backgroundColor;
  final Color progressColor;

  _CustomGaugePainter({
    required this.progress,
    required this.strokeWidth,
    required this.backgroundColor,
    required this.progressColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2.0;
    final center = Offset(size.width / 2.0, size.height / 1.2);

    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi,
      pi,
      false,
      backgroundPaint,
    );

    final progressPaint = Paint()
      ..color = progressColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final progressAngle = pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi,
      progressAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(_CustomGaugePainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.progressColor != progressColor;
  }
}
