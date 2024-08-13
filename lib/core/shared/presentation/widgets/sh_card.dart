import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/theme/sh_colors.dart'; // Asegúrate de importar correctamente tu archivo de colores
import 'package:flutter_application_3/core/shared/presentation/widgets/sh_divider.dart'; // Importa SHDivider si está definido en otro lugar

class SHCard extends StatelessWidget {
  const SHCard({
    super.key,
    this.height,
    this.children = const [],
    this.childrenPadding = EdgeInsets.zero,
  });

  final double? height;
  final List<Widget> children;
  final EdgeInsets childrenPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: SHColors.cardColors,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 20,
              offset: Offset(-10, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int index = 0; index < children.length; index++) ...[
              Padding(
                padding: childrenPadding,
                child: children[index],
              ),
              if (index < children.length - 1) const SHDivider(),
            ],
          ],
        ),
      ),
    );
  }
}
