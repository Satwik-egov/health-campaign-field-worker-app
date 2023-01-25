import 'package:digit_components/theme/digit_theme.dart';
import 'package:flutter/material.dart';

class DigitTableCard extends StatelessWidget {
  final Map<String, dynamic> element;
  final EdgeInsets? padding;
  final Border? border;
  final Color? color;

  const DigitTableCard({
    super.key,
    required this.element,
    this.padding,
    this.border,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
            border: border),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
          child: Column(
            children: element.keys
                .map((e) => Row(
                      children: [
                        Container(
                          margin: DigitTheme.instance.verticalMargin,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              e,
                              style: theme.textTheme.headline5,
                            ),
                          ),
                        ),
                        Text(element[e].toString())
                      ],
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}