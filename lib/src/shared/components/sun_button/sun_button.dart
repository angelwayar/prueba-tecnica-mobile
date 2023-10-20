import 'package:flutter/material.dart';

class SunButton extends StatelessWidget {
  /// Creates a Sun Components button.
  const SunButton({
    super.key,
    required this.title,
    this.colorTitle,
    this.color,
    this.height,
    this.radius,
    this.onPressed
  });

  /// Text that the button will have
  final String title;

  /// Color of the title that the button will have
  final Color? colorTitle;

  /// Color that the button will have
  final Color? color;

  /// Height that the button will have
  final double? height;

  /// Radius that the button will have
  final double? radius;

  /// The callback that is called when the button is tapped
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius ?? 24))
              ),
              height: height ?? 53,
              onPressed: onPressed,
              color: color,
              child: Text(
                title,
                style: TextStyle(
                  color: colorTitle,
                  fontSize: 14
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}