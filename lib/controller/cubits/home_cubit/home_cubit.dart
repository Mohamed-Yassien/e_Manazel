import 'package:e_manazel/controller/cubits/home_cubit/home_states.dart';
import 'package:e_manazel/core/network/local/cache_helper.dart';
import 'package:e_manazel/generated/assets.dart';
import 'package:e_manazel/main.dart';
import 'package:e_manazel/views/screens/tab_bar_screens/ads_screen.dart';
import 'package:e_manazel/views/screens/tab_bar_screens/complaint_screen.dart';
import 'package:e_manazel/views/screens/tab_bar_screens/contract_screen.dart';
import 'package:e_manazel/views/screens/tab_bar_screens/dashboard_screen.dart';
import 'package:e_manazel/views/screens/tab_bar_screens/events_screen.dart';
import 'package:e_manazel/views/screens/tab_bar_screens/external_services_screen.dart';
import 'package:e_manazel/views/screens/tab_bar_screens/maitenance_screen/maintenance_screen.dart';
import 'package:e_manazel/views/screens/tab_bar_screens/panic_alerts_screen.dart';
import 'package:e_manazel/views/screens/tab_bar_screens/payment_screen.dart';
import 'package:e_manazel/views/screens/tab_bar_screens/phone_book_screen.dart';
import 'package:e_manazel/views/screens/tab_bar_screens/violation_screen.dart';
import 'package:e_manazel/views/screens/tab_bar_screens/visitor_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<String> tabBarTitles(context) => [
        AppLocalizations.of(context)!.dashboard,
        AppLocalizations.of(context)!.ext_services,
        AppLocalizations.of(context)!.contract,
        AppLocalizations.of(context)!.maintenance,
        AppLocalizations.of(context)!.complaint,
        AppLocalizations.of(context)!.ads,
        AppLocalizations.of(context)!.phone_book,
        AppLocalizations.of(context)!.visitor,
        AppLocalizations.of(context)!.violation,
        AppLocalizations.of(context)!.payment,
        AppLocalizations.of(context)!.panic_alerts,
        AppLocalizations.of(context)!.events,
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

  void changeTabBarIndex({required int index}) {
    currentIndex = index;
    emit(HomeChangeIndexOfTitleState());
  }

  List<Widget> tabBarScreens = [
    const DashBoardScreen(),
    const ExternalServicesScreen(),
    const ContractScreen(),
    const MaintenanceScreen(),
    const ComplaintScreen(),
    const AdsScreen(),
    const PhoneBookScreen(),
    const VisitorScreen(),
    const ViolationScreen(),
    const PaymentScreen(),
    const PanicAlertsScreen(),
    const EventsScreen(),
  ];

  bool? isArabic;

  String getLangButtonName() {
    String? buttonName;
    switch (CacheHelper.getData(key: 'lang')) {
      case 'en':
        buttonName = 'العربية';
        isArabic = false;
        break;
      case 'ar':
        buttonName = 'english';
        isArabic = true;
        break;
      default:
        buttonName = 'العربية';
    }
    return buttonName;
  }

  void changeLanguage(bool langArabic, context) {
    switch (langArabic) {
      case true:
        MyApp.setLocale(context, const Locale('en', ''));
        CacheHelper.saveData(key: 'lang', value: 'en');
        break;
      case false:
        MyApp.setLocale(context, const Locale('ar', ''));
        CacheHelper.saveData(key: 'lang', value: 'ar');
        break;
    }
  }
}
