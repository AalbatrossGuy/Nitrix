import 'package:Nitrix/widgets/nitrixAppBar.dart';
import 'package:Nitrix/widgets/nitrixBottomNavigationBar.dart';
import 'package:flutter/material.dart';

class statsPage extends StatelessWidget {
  const statsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: nitrixAppBar.createNitrixAppBar(context),
      bottomNavigationBar: const nitrixBottomNaviagationBar(),
      body: const Center(
        child: Text("statistics"),
      ),
    );
  }
}
