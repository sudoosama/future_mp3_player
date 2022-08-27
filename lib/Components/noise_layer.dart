import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/layers.dart';

import 'magic_flame.dart';

class NoiseLayer extends PreRenderedLayer {
  NoiseLayer(this.size);

  final Vector2 size;

  @override
  void drawLayer() {
    final off1 = <Offset>[];
    for (int y = 0; y < size.y; y++) {
      for (int x = 0; x < size.x; x++) {
        if (random.nextDouble() > 0.06) continue;
        off1.add(Offset(x.toDouble(), y.toDouble()));
      }
    }
    final p = Paint()..strokeWidth = 0.5;
    canvas
      ..saveLayer(Rect.largest, Paint()..blendMode = BlendMode.overlay)
      ..drawPoints(
        PointMode.points,
        off1,
        p..color = const Color(0xFFFFFFFF),
      )
      ..restore();
  }
}
