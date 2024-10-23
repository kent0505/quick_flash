import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../utils.dart';
import 'buttons/cuper_button.dart';
import 'texts/text_r.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: getStatusBar(context) + 20),
        Row(
          children: [
            const SizedBox(width: 30),
            CuperButton(
              onPressed: () {
                context.pop();
              },
              child: SvgPicture.asset('assets/arrow.svg'),
            ),
            const SizedBox(width: 16),
            const TextH('New Offer', fontSize: 18),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
