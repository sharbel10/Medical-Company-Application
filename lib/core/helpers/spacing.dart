import 'package:flutter/cupertino.dart';
import 'package:untitled11/core/helpers/styles.dart';

class Space extends StatelessWidget {
  final double width;
  final double height;

  Space(this.width, this.height);

  @override
  Widget build(BuildContext context) => SizedBox(width: width, height: height);
}

class VSpace extends StatelessWidget {
  final double size;

  const VSpace(this.size, {Key? key}) : super(key: key);
  static VSpace get xs => VSpace(Insets.xs);
  static VSpace get sm => VSpace(Insets.sm);
  static VSpace get med => VSpace(Insets.med);
  static VSpace get lg => VSpace(Insets.lg);
  static VSpace get xl => VSpace(Insets.xl);
  @override
  Widget build(BuildContext context) => Space(0, size);
}

class HSpace extends StatelessWidget {
  final double size;
  static HSpace get xs => HSpace(Insets.xs);
  static HSpace get sm => HSpace(Insets.sm);
  static HSpace get med => HSpace(Insets.med);
  static HSpace get lg => HSpace(Insets.lg);
  static HSpace get xl => HSpace(Insets.xl);
  const HSpace(this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Space(size, 0);
}
