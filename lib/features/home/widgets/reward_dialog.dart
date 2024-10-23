import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/db/prefs.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/texts/text_r.dart';

class RewardDialog extends StatelessWidget {
  const RewardDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 320,
        child: Column(
          children: [
            const SizedBox(height: 14),
            SvgPicture.asset('assets/coins.svg'),
            const TextH(
              'Daily Reward',
              fontSize: 28,
            ),
            const SizedBox(height: 14),
            const TextR(
              'You earned an additional 100 coins today',
              fontSize: 16,
            ),
            const Spacer(),
            PrimaryButton(
              title: 'Receive',
              onPressed: () async {
                await saveCoins().then((value) {
                  if (context.mounted) context.pop();
                });
              },
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
