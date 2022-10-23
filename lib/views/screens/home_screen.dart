import 'package:e_manazel/core/responsive/ui_components/info_widget.dart';
import 'package:e_manazel/generated/assets.dart';
import 'package:e_manazel/views/components/home_drawer_body.dart';
import 'package:e_manazel/views/widgets/resuable_tab_bar_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  List<String> tabBarTitles = [
    'Dashboard',
    'External Services',
    'Contract',
    'Maintenance',
    'Complaint',
    'Ads',
    'Phone Book',
    'Visitor',
    'Violation',
    'Payment',
    'Panic Alerts',
    'Events',
  ];

  List<String> tabBarImages = [
    Assets.imagesDashboard,
    Assets.imagesExternalServices,
    Assets.imagesContract,
    Assets.imagesMaintenance,
    Assets.imagesComplaint,
    Assets.imagesAds,
    Assets.imagesPhoneBook,
    Assets.imagesVisitors,
    Assets.imagesViolation,
    Assets.imagesPayment,
    Assets.imagesPanic,
    Assets.imagesEvents,
  ];

  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabBarTitles.length,
      child: InfoWidget(
        builder: (context, info) {
          return Scaffold(
            drawer: const Drawer(
              backgroundColor: Colors.white,
              child: HomeDrawerBody(),
            ),
            appBar: AppBar(
                title: Text(
                  tabBarTitles[currentIndex],
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                toolbarHeight: info.screenHeight * .1,
                bottom: TabBar(
                  indicatorColor: Colors.transparent,
                  physics: const BouncingScrollPhysics(),
                  onTap: (int index) {
                    currentIndex = index;
                    print(currentIndex);
                    print(index);
                  },
                  tabs: List.generate(
                    tabBarTitles.length,
                    (index) => ReusableTabBarItem(
                      image: tabBarImages[index],
                      title: tabBarTitles[index],
                    ),
                  ),
                  isScrollable: true,
                )),
            body: const Center(
              child: Text(
                'Home Screen',
              ),
            ),
          );
        },
      ),
    );
  }
}
