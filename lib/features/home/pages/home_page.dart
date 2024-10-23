import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../../news/pages/news_page.dart';
import '../../offer/bloc/offer_bloc.dart';
import '../bloc/home_bloc.dart';
import '../widgets/nav_bar.dart';
import '../widgets/offer_card.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeSettings) return const SettingsPage();

              if (state is HomeNews) return const NewsPage();

              return const _Home();
            },
          ),
          const NavBar(),
        ],
      ),
    );
  }
}

class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: getStatusBar(context) + 20),
        Row(
          children: [
            const SizedBox(width: 26),
            const TextH(
              'Home',
              fontSize: 28,
            ),
            const Spacer(),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeInitial) {
                  return TextB(
                    state.coins.toString(),
                    fontSize: 20,
                  );
                }

                return Container();
              },
            ),
            const SizedBox(width: 4),
            SvgPicture.asset(
              'assets/coin.svg',
              height: 40,
            ),
            const SizedBox(width: 26),
          ],
        ),
        const SizedBox(height: 20),
        BlocBuilder<OfferBloc, OfferState>(
          builder: (context, state) {
            if (state is OfferLoadedState) {
              return Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    const SizedBox(height: 16),
                    const Center(
                      child: TextM('Cars', fontSize: 18),
                    ),
                    const SizedBox(height: 26),
                    ...List.generate(
                      state.offers.length,
                      (index) {
                        return OfferCard(offer: state.offers[index]);
                      },
                    ),
                    const SizedBox(height: 96 + 32 + 50 + 30),
                  ],
                ),
              );
            }

            return Container();
          },
        ),
      ],
    );
  }
}
