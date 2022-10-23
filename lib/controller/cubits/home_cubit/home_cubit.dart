import 'package:e_manazel/controller/cubits/home_cubit/home_states.dart';
import 'package:e_manazel/generated/assets.dart';
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

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

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
}
