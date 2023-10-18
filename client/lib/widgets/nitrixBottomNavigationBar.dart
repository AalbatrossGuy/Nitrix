import 'package:flutter/material.dart';

class nitrixBottomNaviagationBar extends StatefulWidget {
  const nitrixBottomNaviagationBar({super.key});

  @override
  State<nitrixBottomNaviagationBar> createState() =>
      _nitrixBottomNaviagationBarState();
}

class _nitrixBottomNaviagationBarState
    extends State<nitrixBottomNaviagationBar> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
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
            switch (index) {
              case 0:
                Navigator.of(context).pushNamed("/");
                break;
              case 1:
                Navigator.of(context).pushNamed("/stats");
                break;
              case 2:
                Navigator.of(context).pushNamed("/online");
                break;
              case 3:
                Navigator.of(context).pushNamed("/feedback");
                break;
              default:
                Navigator.of(context).pushNamed("/");
                break;
            }
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
