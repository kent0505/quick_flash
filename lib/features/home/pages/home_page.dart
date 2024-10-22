import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../../news/pages/news_page.dart';
import '../bloc/home_bloc.dart';
import '../widgets/nav_bar.dart';
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
        const Row(
          children: [
            SizedBox(width: 26),
            TextH(
              'Home',
              fontSize: 28,
            ),
          ],
        ),
        const SizedBox(height: 36),
        const TextM('Cars', fontSize: 18),
        const SizedBox(height: 20),
      ],
    );
  }
}
