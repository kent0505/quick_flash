import 'package:flutter/material.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/texts/text_r.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: getStatusBar(context) + 20),
        const Row(
          children: [
            SizedBox(width: 26),
            TextH(
              'News',
              fontSize: 28,
            ),
          ],
        ),
        const SizedBox(height: 36),
        const TextM('Popular news', fontSize: 18),
        const SizedBox(height: 20),
      ],
    );
  }
}
