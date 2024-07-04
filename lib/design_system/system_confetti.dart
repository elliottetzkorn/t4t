import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/providers/confetti_provider.dart';
import 'package:t4t/utils/device_utils.dart';

enum DwellingConfettiSource { setup, supporter }

class SystemConfetti extends ConsumerStatefulWidget {
  const SystemConfetti({super.key, required this.child});

  final Widget child;

  @override
  ConsumerState<SystemConfetti> createState() => _SystemConfettiState();
}

class _SystemConfettiState extends ConsumerState<SystemConfetti> {
  late ConfettiController controllerTopLeftSetup;
  late ConfettiController controllerTopRightSetup;

  late ConfettiController controllerTopLeftSupporter;
  late ConfettiController controllerTopRightSupporter;

  final Size minimumSize = const Size(18, 18);
  final Size maximumSize = const Size(42, 42);
  final Duration confettiDuration = const Duration(seconds: 3);

  @override
  void initState() {
    super.initState();

    controllerTopLeftSetup = ConfettiController(duration: confettiDuration);
    controllerTopRightSetup = ConfettiController(duration: confettiDuration);
    controllerTopLeftSupporter = ConfettiController(duration: confettiDuration);
    controllerTopRightSupporter =
        ConfettiController(duration: confettiDuration);
  }

  @override
  void dispose() {
    controllerTopLeftSetup.dispose();
    controllerTopRightSetup.dispose();
    controllerTopLeftSupporter.dispose();
    controllerTopRightSupporter.dispose();

    super.dispose();
  }

  double blastDirection(Alignment align) {
    return align == Alignment.topLeft ? 0.698132 : 2.44346;
  }

  ConfettiController controller(
      DwellingConfettiSource source, Alignment align) {
    switch (source) {
      case DwellingConfettiSource.setup:
        return align == Alignment.topLeft
            ? controllerTopLeftSetup
            : controllerTopRightSetup;
      case DwellingConfettiSource.supporter:
        return align == Alignment.topLeft
            ? controllerTopLeftSupporter
            : controllerTopRightSupporter;
    }
  }

  List<Color> colors(DwellingConfettiSource source) {
    switch (source) {
      case DwellingConfettiSource.setup:
        return transColors;
      case DwellingConfettiSource.supporter:
        return [Theme.of(context).colorScheme.error];
    }
  }

  Path drawShape(Size size, DwellingConfettiSource source) {
    switch (source) {
      case DwellingConfettiSource.setup:
        return drawStar(size);
      case DwellingConfettiSource.supporter:
        return drawHeart(size);
    }
  }

  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  Path drawHeart(Size size) {
    double width = size.width;
    double height = size.height;

    Path path = Path();
    path.moveTo(0.5 * width, height * 0.35);
    path.cubicTo(0.2 * width, height * 0.1, -0.25 * width, height * 0.6,
        0.5 * width, height);
    path.moveTo(0.5 * width, height * 0.35);
    path.cubicTo(0.8 * width, height * 0.1, 1.25 * width, height * 0.6,
        0.5 * width, height);

    path.close();
    return path;
  }

  void showConfetti(
      ConfettiController controllerOne, ConfettiController controllerTwo) {
    HapticFeedback.vibrate();
    controllerOne.play();
    controllerTwo.play();

    Future.delayed(const Duration(milliseconds: 1), () {
      ref.read(confettiProvider.notifier).resetConfetti();
    });
  }

  Widget confetti(Alignment alignment, DwellingConfettiSource source) {
    return Align(
      alignment: alignment,
      child: ConfettiWidget(
          canvas: Size.infinite,
          confettiController: controller(source, alignment),
          blastDirection: blastDirection(alignment),
          emissionFrequency: .1,
          maxBlastForce: DeviceUtils.isTablet(context) ? 64 : 32,
          createParticlePath: (size) => drawShape(size, source),
          colors: colors(source),
          minimumSize: minimumSize,
          maximumSize: maximumSize,
          numberOfParticles: 1,
          gravity: 0.066),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (ref.read(confettiProvider) != null) {
      switch (ref.read(confettiProvider)!.source) {
        case DwellingConfettiSource.setup:
          showConfetti(controllerTopLeftSetup, controllerTopRightSetup);
          break;
        case DwellingConfettiSource.supporter:
          showConfetti(controllerTopLeftSupporter, controllerTopRightSupporter);
          break;
      }
    }

    ref.listen(confettiProvider, (prev, next) {
      if (next != null) {
        switch (next.source) {
          case DwellingConfettiSource.setup:
            showConfetti(controllerTopLeftSetup, controllerTopRightSetup);
            break;
          case DwellingConfettiSource.supporter:
            showConfetti(
                controllerTopLeftSupporter, controllerTopRightSupporter);
            break;
        }
      }
    });

    return Stack(children: [
      widget.child,
      confetti(Alignment.topLeft, DwellingConfettiSource.setup),
      confetti(Alignment.topRight, DwellingConfettiSource.setup),
      confetti(Alignment.topLeft, DwellingConfettiSource.supporter),
      confetti(Alignment.topRight, DwellingConfettiSource.supporter),
    ]);
  }
}
