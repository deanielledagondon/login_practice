import 'package:flutter/material.dart';
import 'package:login/forgot.dart';
import 'package:login/signup.dart';
import 'welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  LoginDemo({super.key});

  @override
  State<LoginDemo> createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: <Widget>[
        Container(
        alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Image.asset('assets/images/gigachad.png'),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          child: TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              icon: Icon(Icons.email),
              hintText: 'abcd@gmail.com',
              labelText: 'Email',
            ),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a valid email address';
              } else {
                return null;
              }
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          child: TextFormField(
            obscureText: true,
            controller: passwordController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              icon: Icon(Icons.password),
              hintText: '*******',
              labelText: 'Password',
            ),
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password';
              } else {
                return null;
              }
            },
          ),
        ),
        TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ForgotPage()));
            },
            child: const Text('Forgot Password?')),
        Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(20)),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WelcomePage(username: '',)));
            },
            child: const Text('Sign in',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
        ),
        Column(
          children: [
          const SizedBox(
          height: 100,
        ),
         TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => const SignUp()));
          },
          child: const Text('New User? Create Account'),

        ),
        ],
      ),
      ],
    )),
    );
  }
}
