import 'package:e_manazel/core/methods.dart';
import 'package:e_manazel/generated/assets.dart';
import 'package:e_manazel/views/screens/community_details_screen.dart';
import 'package:e_manazel/views/screens/home_screen.dart';
import 'package:e_manazel/views/screens/profile_screen.dart';
import 'package:e_manazel/views/widgets/resuable_drawer_list_tile.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeDrawerBody extends StatelessWidget {
  const HomeDrawerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset(
                Assets.imagesLogo,
              ),
            ),
            ReusableDrawerListTile(
              title: AppLocalizations.of(context)!.home,
              iconData: Icons.home,
              onPress: () {
                navigateTo(widget: const HomeScreen(), context: context);
              },
            ),
            ReusableDrawerListTile(
              title: AppLocalizations.of(context)!.profile,
              iconData: Icons.person,
              onPress: () {
                navigateTo(widget: const ProfileScreen(), context: context);
              },
            ),
            ReusableDrawerListTile(
              iconData: Icons.group_add,
              title: AppLocalizations.of(context)!.com_details,
              onPress: () {
                navigateTo(
                  widget: const CommunityDetailsScreen(),
                  context: context,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
