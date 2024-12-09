import 'package:flutter/material.dart';
import 'package:manzil_offline/custom_screen.dart';
import 'package:manzil_offline/custom_widgets/app_data.dart';
import 'package:manzil_offline/custom_widgets/app_drawer.dart';
import 'package:manzil_offline/custom_widgets/appbar_widget.dart';

class DashboardScreen extends StatefulWidget {
  final int screenNumber;

  const DashboardScreen({Key? key, required this.screenNumber}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Map<String, dynamic>> filteredData = [];
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    // Fetch app data and filter by screenNumber
    final appData = AppDataProvider.getAppData();
    filteredData = appData.where((data) => data['no'] <= 17).toList();

    // Find the index of the screen that matches screenNumber
    int initialPageIndex = filteredData.indexWhere((data) => data['no'] == widget.screenNumber);

    // Initialize PageController with the initial page
    _pageController = PageController(initialPage: initialPageIndex != -1 ? initialPageIndex : 0);
  }

  void _goToNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose(); // Dispose of the controller to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: 'نورانی قاعدہ'),
      endDrawer: AppDrawer(),
      body: PageView.builder(
        controller: _pageController,
        itemCount: filteredData.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final mapData = filteredData[index];

          return CustomScreen(
            key: ValueKey(mapData['no']),
            title: mapData['Title'] ?? 'No Title',
            hadayat: mapData['Hadayat'] ?? 'No Hadayat',
            gridItems: List<Map<String, String>>.from(mapData['gridItems']),
            screenPath: mapData['screenImage'] ?? 'No Image',
            onLastItemVisible: _goToNextPage,  // Action when the last item is visible (if needed)
          );
        },
      ),
    );
  }
}
