import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile', style: TextStyle(
           fontSize: 40, //Font size 
           fontWeight: FontWeight.bold, //Prominent title 
           color: Color.fromARGB(255, 10, 4, 4), //Text color
           ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              //Image 
              const CircleAvatar(
                radius: 90,
                 backgroundImage: NetworkImage(
                   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgVFpZbyBvS8pNLwUOF_ou4fceeKCB5JGz-K9Ms5P-sy7aOsvqdrPJFhwh7vhJIkxi-zw&usqp=CAU', // sample profile pic
                 ), 
              ),
              const SizedBox(height:20),
              //Name
              const Text('Dana Solomon ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color:  const Color.fromARGB(255, 242, 92, 110),
                ),
              ),
              //Email and Phone
              const SizedBox(height: 40),
              const Text(
                'Email: DanaSolomon@e.braude.il',
                style: TextStyle(fontSize: 20),
              ),
              const Text(
                'Phone: 054-1234567',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),
              //Personal information 
              const Text(
                'About me:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'I am a passionate Flutter developer with a keen interest in building beautiful and functional applications!',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
