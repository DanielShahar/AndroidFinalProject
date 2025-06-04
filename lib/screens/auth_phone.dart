import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key, required this.title});

  final String title;

  @override
  State<Login> createState() => _LoginState();
}

//A simple dummy Signup page
class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Signup')),
      body: Center(
        child: Text(
          'Signup Page',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

//State class for the Login screen
class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  //Variable to hold the user input phone number
  String _phoneNumber = '';

  //Function called when user presses the "Login" button
  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      //Simulate sending a verification code
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Code Sent'),
          content: Text('A verification code has been sent to $_phoneNumber'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  //Validates a phone number using regex
  bool isValidPhoneNumber(String phone) {
    final regex = RegExp(r'^\+?[0-9]{7,15}$');
    return regex.hasMatch(phone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Phone Verification',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Spacer(), //Adds flexible empty space above the image
              Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgVFpZbyBvS8pNLwUOF_ou4fceeKCB5JGz-K9Ms5P-sy7aOsvqdrPJFhwh7vhJIkxi-zw&usqp=CAU', // תמונה דומה
                height: 150,
              ),
              SizedBox(height: 20),
              Text(
                'We need to register your phone before getting started!',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              //Phone number input field
              TextFormField(
                decoration: InputDecoration(
                  prefixText: '+',
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Please enter phone number';
                  if (!isValidPhoneNumber(value)) return 'Enter a valid phone number';
                  return null;
                },
                onSaved: (value) => _phoneNumber = '+$value',
              ),
              SizedBox(height: 20),
              //Submit button
              SizedBox(
                width: double.infinity,
                height: 50,
                  child: ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 242, 92, 110),
                    foregroundColor: const Color.fromARGB(255, 19, 18, 18), //טקסט בצבע שחור
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // פינות עגולות
                    ),
                    textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  child: Text('Login'),
                )
                ),
              Spacer(), //Adds space below the button
              //Sign-up suggestion text
              Text(
                'Don\'t have an account?',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage()),
                  );
                },
                child: Text('Sign up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
