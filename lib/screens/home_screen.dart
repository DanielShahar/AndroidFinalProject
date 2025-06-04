import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        // automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text(
          'Welcome. Screen After Split To Files!',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
  

class WelcomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Center(
          child: Text(
            'Welcome', 
             style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        )
      ),
      body: Center(
        child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
                'Please login or sign up',
                 style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          Spacer(),
          CircleAvatar(
            radius: 150,
            backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgVFpZbyBvS8pNLwUOF_ou4fceeKCB5JGz-K9Ms5P-sy7aOsvqdrPJFhwh7vhJIkxi-zw&usqp=CAU', // sample profile pic
            ),
          ),
          SizedBox(height: 20),
          Spacer(),
          Padding(padding: EdgeInsets.all(4.0), child:      
            ElevatedButton.icon(
              onPressed: () {},
              label: Text('Login', style: TextStyle(fontSize: 25),),
              style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
              backgroundColor: const Color.fromARGB(255, 219, 207, 208),
              ),
            ),
          ),
          SizedBox(height: 25),
          Padding(padding: EdgeInsets.all(4.0), child:           
            ElevatedButton.icon(
              onPressed: () {},
              label: Text('Sign up', style: TextStyle(fontSize: 25),),
              style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
              backgroundColor: const Color.fromARGB(255, 242, 92, 110),
              ),
            ),
          ),
          SizedBox(height: 40),
         ],
      ),
      )
    );
  }
}
