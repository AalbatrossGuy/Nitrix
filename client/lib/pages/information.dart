import 'package:flutter/material.dart';

class informationPage extends StatefulWidget {
  const informationPage({super.key});

  @override
  State<informationPage> createState() => _informationPageState();
}

class _informationPageState extends State<informationPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 15),
          child: Text(
            "Good Morning Bob.",
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              fontFamily: "Roboto",
            ),
          ),
        ),
        const Text(
          "Here is an overview of your basic stats",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w300,
            fontFamily: "Poppins",
          ),
        ),
        const SizedBox(
          height: 100,
          width: 100,
        ),
        Container(
          decoration: ShapeDecoration(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            color: Theme.of(context).colorScheme.surfaceVariant,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Text(
                  "Announcements:",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
