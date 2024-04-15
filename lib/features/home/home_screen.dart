import 'package:flutter/material.dart';
import 'package:jala/features/shrimp_news/shrimp_news_widget.dart';
import 'package:jala/features/shrimp_price/shrimp_price_widget.dart';
import 'package:jala/shared/colors.dart';
import 'package:jala/shared/widgets/decorated_tabbar.dart';

import '../shrimp_diseases/shrimp_diseases_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final _tabbar = const DecoratedTabBar(
    tabBar: TabBar(
        labelColor: primaryColor,
        unselectedLabelColor: unselectedColor,
        tabs: [
          Tab(
            text: 'Harga Udang',
          ),
          Tab(
            text: 'Kabar Udang',
          ),
          Tab(
            text: 'Penyakit',
          ),
        ]),
    decoration: BoxDecoration(
        border: Border(
      bottom: BorderSide(color: dividerColor),
    )),
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          title: const Text('Jala Media'),
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: _tabbar.preferredSize,
            child: ColoredBox(
              color: Colors.white,
              child: _tabbar,
            ),
          ),
        ),
        body: const TabBarView(children: [
          ShrimpPriceWidget(),
          ShrimpNewsWidget(),
          ShrimpDiseasesWidget(),
        ]),
      ),
    );
  }
}
