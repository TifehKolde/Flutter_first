import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:local_auth/local_auth.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF2169B3);

    //Authentication
    final LocalAuthentication auth = LocalAuthentication();

    Future<void> _authenticate() async {
      bool isAuthenticated = false;
      try {
        isAuthenticated = await auth.authenticate(
          localizedReason: 'Scan your fingerprint to login',
          options: const AuthenticationOptions(
            biometricOnly: true,
            stickyAuth: true,
          ),
        );
      } catch (e) {
        print('Auth error: $e');
      }

      if (isAuthenticated) {
        // Handle success
        print('User authenticated!');
        // Navigate or show success
      } else {
        // Handle failure
        print('Authentication failed');
      }
    }

    // UI
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),

        backgroundColor: Color.fromARGB(255, 3, 131, 190),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Logo
              Image.network(
                'https://bricamax.com.ng/wp-content/uploads/2025/01/bricamax_logo-png-copy-2.png', // ⚠️ Make sure this exists and is added in pubspec.yaml
                height: 100,
              ),
              SizedBox(height: 20),

              // Login & Sign Up icons
              SizedBox(height: 30),

              // Username
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                  hintText: 'Enter Your Name',
                  // 👈 Icon on the left inside the border
                  prefixIcon: Icon(Icons.person_2, color: Colors.grey),
                ),
              ),
              SizedBox(height: 20),

              // Password
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter Password',
                  // 👈 Icon on the left inside the border
                  prefixIcon: Icon(Icons.lock, color: Colors.grey),
                  suffixIcon: Icon(Icons.remove_red_eye, color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 201, 4, 4),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Buttons
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 1, 98, 158),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),

              //fingerprint authentication button
              SizedBox(height: 16),
              Text("Or login with fingerprint"),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle, // 👈 Rectangle shape
                  borderRadius: BorderRadius.circular(15), // 👈 Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: Icon(Icons.fingerprint, size: 40, color: primaryBlue),
                  onPressed: _authenticate,
                  padding: EdgeInsets.all(16),
                ),
              ),

              Padding(
                // 👈 padding only for RichText
                padding: EdgeInsets.only(
                  top: 20,
                ), // change 20 to whatever you like
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    children: [
                      TextSpan(text: 'Don’t have an account? '),
                      TextSpan(
                        text: 'Sign up',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                // 👉 put your navigation / action here
                                print('Sign‑up tapped');
                                // Navigator.pushNamed(context, '/signup');
                              },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
