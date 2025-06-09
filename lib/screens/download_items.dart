import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apps List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink), //Sets pink as the theme seed color
        useMaterial3: true,
      ),
      home: const AppsListPage(),
    );
  }
}

class AppsListPage extends StatefulWidget {
  const AppsListPage({super.key});

  @override
  State<AppsListPage> createState() => _AppsListPageState();
}

class _AppsListPageState extends State<AppsListPage> {
  //Creates a list of 10 items, all starting with the 'initial' download state
  final List<DownloadState> _downloadStates =
      List.generate(10, (index) => DownloadState.initial);

  //Starts the download process for the app at the given index
  void _startDownload(int index) {
    setState(() {
      _downloadStates[index] = DownloadState.downloading;
    });

    //Simulates a 2-second download, then changes the state to "completed"
    Future.delayed(const Duration(seconds: 2)).then((_) {
      if (!mounted) return;
      setState(() {
        _downloadStates[index] = DownloadState.completed;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apps'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10, //Builds 10 list items
        itemBuilder: (context, index) {
          return AppListItem(
            appName: 'App ${index + 1}', //App name like "App 1", "App 2", etc.
            appDescription: 'Lorem ipsum dolor sit amet', //Dummy description
            iconUrl:
                'https://upload.wikimedia.org/wikipedia/commons/7/74/App_icon.png',
            downloadState: _downloadStates[index],
            onTap: () {
              if (_downloadStates[index] == DownloadState.initial) {
                _startDownload(index);
              }
            },
          );
        },
      ),
    );
  }
}
//Enum for tracking the download button state
enum DownloadState { initial, downloading, completed }

class AppListItem extends StatelessWidget {
  final String appName;
  final String appDescription;
  final String iconUrl;
  final DownloadState downloadState;
  final VoidCallback onTap;

  const AppListItem({
    super.key,
    required this.appName,
    required this.appDescription,
    required this.iconUrl,
    required this.downloadState,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        appName,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(appDescription),
      trailing: DownloadButton(
        downloadState: downloadState,
        onPressed: onTap,
      ),
    );
  }
}

class DownloadButton extends StatelessWidget {
  final DownloadState downloadState;
  final VoidCallback onPressed;

  const DownloadButton({
    super.key,
    required this.downloadState,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: switch (downloadState) {
        DownloadState.initial => _buildButton('GET', onPressed), //Show "GET" button
        DownloadState.downloading => const SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(strokeWidth: 2), //Show loading spinner
          ),
        DownloadState.completed => _buildButton('OPEN', () {}), //Show "OPEN" button (does nothing)
      },
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      key: ValueKey(text), //Important for AnimatedSwitcher to recognize changes
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFE0E0E0), //Light gray background
        foregroundColor: Colors.pink, //Pink text
        padding: const EdgeInsets.symmetric(horizontal: 10),
        minimumSize: const Size(60, 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), //Rounded button edges
        ),
        elevation: 0,
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }
}
