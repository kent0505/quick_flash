import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/offer.dart';
import '../../../core/widgets/texts/text_r.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({
    super.key,
    required this.offer,
  });

  final Offer offer;

  int getId(String data) {
    if (data == 'Passenger car') return 1;
    if (data == 'Truck') return 2;
    return 3;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 118,
      margin: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        color: const Color(0xff333333),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: [
          const SizedBox(width: 8),
          SvgPicture.asset(
            'assets/car${getId(offer.transportType)}.svg',
          ),
          const Spacer(),
          Container(
            height: 100,
            width: 150,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              border: Border.all(
                color: AppColors.main,
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextR(offer.who, fontSize: 12),
                TextR(offer.note, fontSize: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextB(
                      '\$${offer.cost} ',
                      fontSize: 20,
                      color: AppColors.main,
                    ),
                    const Expanded(
                      child: TextM(
                        '/per day',
                        fontSize: 12,
                        color: AppColors.main,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
