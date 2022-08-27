import 'dart:math';
import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame_mp3/Components/magic_flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' hide Gradient;

class SecondaryBlob extends CircleComponent {
  SecondaryBlob.r() : super(const Color(0xFFFFA500), 90.0, 150);

  SecondaryBlob.g() : super(const Color(0xFFFFFFFF), 130.0, 150);

  SecondaryBlob.b() : super(const Color(0xFF6600FF), 90.0, 150);

  @override
  late final Paint p = super.p
    ..blendMode = BlendMode.screen
    ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20.0);
}

class PrimaryBlob extends CircleComponent {
  // 1) Color 2) Size 3) Speed
  PrimaryBlob.r() : super(const Color(0xFFFF0000), 150.0, 200);

  PrimaryBlob.g() : super(const Color(0xFF17FF00), 72.0, 50);

  PrimaryBlob.b() : super(const Color(0xFF6600FF), 72.0, 50);

  @override
  late final Paint p = super.p
    ..blendMode = BlendMode.screen
    ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 17.1);
}

//Making Circle Component with Blobs
abstract class CircleComponent extends PositionComponent {
  CircleComponent(this._color, this.rad, this.variation);

  EffectController lec(double d) => LinearEffectController(d);
  final Color _color;
  final double rad;
  final int variation;

  Paint get p => Paint()..color = _color;

  double get _amF => (pow(2, random.nextInt(8)) / 256);

  double get _cmV => random.nextDouble() * variation - variation / 2;

  Vector2 get nPos => Vector2(_amF, _amF)..multiply(Vector2(_cmV, _cmV));

  Vector2 get nScl => Vector2(_amF * 2, _amF * 2)..add(Vector2(1, 1));

  void addMove() => add(MoveEffect.to(nPos, lec(0.2), onComplete: addMove));

  void addScale() => add(ScaleEffect.to(nScl, lec(0.5), onComplete: addScale));

  @override
  Anchor get anchor => Anchor.center;

  @override
  Future<void> onLoad() async {
    addMove();
    addScale();
  }

  @override
  void render(Canvas c) => c.drawPath(
      Path()
        ..addOval(
          Rect.fromCircle(center: center.toOffset(), radius: rad),
        ),
      p);
}
