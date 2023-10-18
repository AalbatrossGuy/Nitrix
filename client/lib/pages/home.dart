import 'package:Nitrix/pages/feedback.dart';
import 'package:Nitrix/pages/information.dart';
import 'package:Nitrix/pages/online.dart';
import 'package:Nitrix/pages/stats.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  final screens = [
    const informationPage(),
    const statsPage(),
    // DON'T remove, it is there as floating button creates extra index
    const Center(),
    const onlinePage(),
    const feedbackPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      bottomNavigationBar: buildBottomNavBar(),
      body: screens[currentPageIndex],
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      title: const Text('Nitrix'),
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
    );
  }

  Container buildBottomNavBar() {
    return Container(
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(23),
            topRight: Radius.circular(23),
          ),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(23.0),
          topRight: Radius.circular(23.0),
        ),
        child: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: currentPageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          destinations: <Widget>[
            const NavigationDestination(
              selectedIcon: Icon(Icons.info_outline_rounded),
              icon: Icon(Icons.info_rounded),
              label: 'Information',
            ),
            const NavigationDestination(
              selectedIcon: Icon(Icons.stacked_line_chart_outlined),
              icon: Icon(Icons.stacked_line_chart),
              label: 'Stats',
            ),
            SizedBox(
              height: 60,
              width: 45,
              child: FilledButton.tonal(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                child: const Icon(Icons.add),
                onPressed: () {},
              ),
            ),
            const NavigationDestination(
              selectedIcon: Icon(Icons.online_prediction),
              icon: Icon(Icons.online_prediction_outlined),
              label: 'Online',
            ),
            const NavigationDestination(
              selectedIcon: Icon(Icons.note_alt),
              icon: Icon(Icons.note_alt_outlined),
              label: 'Feedback',
            ),
          ],
        ),
      ),
    );
  }
}
