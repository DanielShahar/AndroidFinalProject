import 'package:flutter/material.dart';
import 'second_menu_screen.dart';

//Sample pages for navigation
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text('Home Screen')),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: const Center(child: Text('Settings Screen')),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: const Center(child: Text('Profile Screen')),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = -1; 
  //List of services shown in the grid
  final services = [
    {'label': 'Cleaning', 'icon': Icons.cleaning_services},
    {'label': 'Plumber', 'icon': Icons.plumbing},
    {'label': 'Electrician', 'icon': Icons.electrical_services},
    {'label': 'Painter', 'icon': Icons.format_paint},
    {'label': 'Carpenter', 'icon': Icons.handyman},
    {'label': 'Gardener', 'icon': Icons.local_florist},
  ];
  //Handles navigation when a bottom navigation item is tapped
  void _onItemTapped(int index) {
    // Navigate to pages based on the button pressed
    Widget page;
    switch (index) {
      case 0:
        page = const HomeScreen(); //Go to Home
        break;
      case 1:
        page = const SettingsScreen(); //Go to Settings
        break;
      case 2:
        page = const ProfileScreen(); //Go to Profile
        break;
      default:
        return;
    }

    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => page), //Navigate to the selected screen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title: const Text('Which service do you need?', style: TextStyle(
      fontSize: 30, //Font size 
      fontWeight: FontWeight.bold, //Bold title 
      color: Color.fromARGB(255, 10, 4, 4), //Text color
    ),
  ),
  centerTitle: false,
),
      body: Padding(
        padding: const EdgeInsets.all(16.0), //Space around the grid
        child: GridView.builder(
          itemCount: services.length, //Total number of service tiles
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, //Two columns
            mainAxisSpacing: 12, //Vertical spacing
            crossAxisSpacing: 12, //Horizontal spacing
            childAspectRatio: 1.2, //Width to height ratio
          ),
          itemBuilder: (context, index) {
            final service = services[index];
            return Container(
              decoration: BoxDecoration(
                color:  const Color.fromARGB(255, 242, 92, 110), //Background color
                borderRadius: BorderRadius.circular(12), //Rounded corners
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, //Center content
                children: [
                  Icon(service['icon'] as IconData, size: 48), //Service icon
                  const SizedBox(height: 8), //Space between icon and text
                  Text(service['label'] as String), //Service label
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            ],
            onTap: _onItemTapped,
            currentIndex: _selectedIndex >= 0 ? _selectedIndex : 0,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 4.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const SecondMenuScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(), //Circular button
                padding: const EdgeInsets.all(16),
                backgroundColor: const Color.fromARGB(255, 242, 92, 110), //Button color
              ),
              child: const Icon(Icons.arrow_forward, color: Colors.white), //Arrow icon
            ),
          ),
        ],
      ),
    );
  }
}
