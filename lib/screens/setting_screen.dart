import 'package:flutter/material.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _MySettingsScreenState();
}

class _MySettingsScreenState extends State<SettingsScreen> {
  bool toggle1 = false;
  bool toggle2 = true;
  bool toggle3 = false;
  bool toggle4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        title: const Text('Settings', style: TextStyle(
           fontSize: 40, //Font size 
           fontWeight: FontWeight.bold, //Prominent title 
           color: Color.fromARGB(255, 10, 4, 4), //Text color
           ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              title: const Text('Airplane Mode'),
              value: toggle1,
              onChanged: (value) {
                setState(() {
                  toggle1 = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Enable notifications'),
              value: toggle2,
              onChanged: (value) {
                setState(() {
                  toggle2 = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Dark mode'),
              value: toggle3,
              onChanged: (value) {
                setState(() {
                  toggle3 = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Location services'),
              value: toggle4,
              onChanged: (value) {
                setState(() {
                  toggle4 = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
