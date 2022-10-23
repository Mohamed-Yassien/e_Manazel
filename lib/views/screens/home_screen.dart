import 'package:e_manazel/controller/cubits/home_cubit/home_cubit.dart';
import 'package:e_manazel/controller/cubits/home_cubit/home_states.dart';
import 'package:e_manazel/core/responsive/ui_components/info_widget.dart';
import 'package:e_manazel/views/components/home_drawer_body.dart';
import 'package:e_manazel/views/widgets/resuable_tab_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);

          return DefaultTabController(
            length: cubit.tabBarTitles.length,
            child: InfoWidget(
              builder: (context, info) {
                return Scaffold(
                  drawer: const Drawer(
                    backgroundColor: Colors.white,
                    child: HomeDrawerBody(),
                  ),
                  appBar: AppBar(
                    actions: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_none_outlined,
                          size: 25,
                        ),
                      ),
                    ],
                    title: Text(
                      cubit.tabBarTitles[cubit.currentIndex],
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    toolbarHeight: info.screenHeight * .1,
                    bottom: TabBar(
                      indicatorColor: Colors.transparent,
                      physics: const BouncingScrollPhysics(),
                      onTap: (int index) {
                        cubit.changeTabBarIndex(index: index);
                      },
                      tabs: List.generate(
                        cubit.tabBarTitles.length,
                        (index) => ReusableTabBarItem(
                          image: cubit.tabBarImages[index],
                          title: cubit.tabBarTitles[index],
                        ),
                      ),
                      isScrollable: true,
                    ),
                  ),
                  body: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: cubit.tabBarScreens,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
