import 'dart:math';
import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' hide Gradient;

import 'create_circle_blob.dart';
import 'noise_layer.dart';

final random = Random();

class MagicFlame extends FlameGame {
  MagicFlame(int page)
      : super(children: [
          if (page == 0) ...[
            PrimaryBlob.r(),
            SecondaryBlob.r()
            // PrimaryBlob.r(),
          ] else if (page == 1) ...[
            SecondaryBlob.g(),
            PrimaryBlob.r(),
          ] else ...[
            PrimaryBlob.g(),
          ]
          // SecondaryBlob.r(),
          // SecondaryBlob.b(),
          // SecondaryBlob.g()
        ]);
  late NoiseLayer noise;

  @override
  Future<void> onLoad() async {
    camera.followVector2(Vector2.zero());
    noise = NoiseLayer(size);
  }

  @override
  Color backgroundColor() => const Color(0xFF0A0815);

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    noise.render(canvas);
  }
}
