import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key, required this.title});

  //This widget is the home page of application. It is stateful, meaning
  //that it has a State object (defined below) that contains fields that affect how it looks.

  //This class is the configuration for the state. It holds the values (in this case the title) 
  //provided by the parent (in this case the App widget) and used by the build method of the State. 
  //Fields in a Widget subclass are always marked "final".
  

  final String title;

  @override
  State<Login> createState() => _LoginState();
}

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

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  bool _obscurePassword = true;

  bool isValidEmail(String email) {
  final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return regex.hasMatch(email);
}

bool isStrongPassword(String password) {
  final hasLetter = RegExp(r'[A-Za-z]');
  final hasNumber = RegExp(r'\d');
  final hasSymbol = RegExp(r'[!@#\$&*~^%()_+=|<>?{}[\]:";\\\,./`-]');
  return hasLetter.hasMatch(password) &&
         hasNumber.hasMatch(password) &&
         hasSymbol.hasMatch(password);
}


  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Dummy credentials
      if (_email == 'test@test.com' && _password == 'password1!') {
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Login Failed'),
            content: Text('Invalid email or password.'),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Center(
          child: Text(
            'Login', 
             style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        )
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                    'Login to your account',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              Spacer(),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder()
                ),
                validator: (value) {
                    if (value == null || value.isEmpty) return 'Please enter email';
                    if (!isValidEmail(value)) return 'Enter a valid email address';
                    return null;
                },
                onSaved: (value) => _email = value!,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                obscureText: _obscurePassword,
                validator: (value) {
                    if (value == null || value.isEmpty) return 'Please enter password';
                    if (!isStrongPassword(value)) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text('Password Requirements'),
                            content: Text(
                              'Password must contain:\n\n• At least one letter\n• At least one number\n• At least one symbol',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                      });
                  return '';
                }
                return null;
              },
                onSaved: (value) => _password = value!,
              ),
              Spacer(),
              SizedBox(
                width: 300,
                height: 60,
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
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'Don\'t have an account?',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 8, 0, 0)),
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
              CircleAvatar(
                 radius: 150,
                 backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgVFpZbyBvS8pNLwUOF_ou4fceeKCB5JGz-K9Ms5P-sy7aOsvqdrPJFhwh7vhJIkxi-zw&usqp=CAU', // sample profile pic
                  ),
              ),
              SizedBox(height: 20),
            ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        //automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text(
          'Welcome!',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
