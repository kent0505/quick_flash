import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../widgets/field_title.dart';

class OfferAddPage2 extends StatefulWidget {
  const OfferAddPage2({super.key});

  @override
  State<OfferAddPage2> createState() => _OfferAddPage2State();
}

class _OfferAddPage2State extends State<OfferAddPage2> {
  final controller1 = TextEditingController();

  bool active = false;

  void checkActive() {
    setState(() {
      active = getButtonActive([
        controller1,
      ]);
    });
  }

  void onContinue() {
    context.push('/home/offer-add-2');
  }

  @override
  void dispose() {
    controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppbar(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                const SizedBox(height: 26),
                const FieldTitle('Note to Owner:'),
                const SizedBox(height: 16),
                TxtField(
                  controller: controller1,
                  onChanged: checkActive,
                ),
                const SizedBox(height: 16),
                PrimaryButton(
                  title: 'Continue',
                  active: active,
                  onPressed: onContinue,
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
