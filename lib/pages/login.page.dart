import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'item.page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool visibilityPassword = false;
  bool visibilityRememberAutent = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    final url = 'https://desafio-nodejs.herokuapp.com/user/login';

    var body = json.encode({
      //LOGIN: caio@gmail.com
      //PASSWORD: caio
      'email': emailController.text,
      'password': passwordController.text
    });

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NewPage()),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text('Invalid email or password'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 242, 242),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(bottom: 60.0),
                  child: Column(
                    children: [
                      Text(
                        'MOBI',
                        style: TextStyle(
                          color: Color.fromARGB(255, 56, 56, 56),
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'LOGISTICA',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  controller: emailController,
                  autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    isDense: true,
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Divider(),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black, width: 1.0)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    isDense: true,
                    suffixIcon: GestureDetector(
                      child: Icon(
                          visibilityPassword == false
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.black),
                      onTap: () {
                        setState(() {
                          visibilityPassword = !visibilityPassword;
                        });
                      },
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  obscureText: visibilityPassword == false ? true : false,
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            visibilityRememberAutent =
                                !visibilityRememberAutent;
                          });
                        },
                        icon: Icon(
                          visibilityRememberAutent
                              ? Icons.check_box
                              : Icons.check,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'Remember authentication',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: login,
                  child: Text('LOGIN', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 36, 36, 36),
                    elevation: 0,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('16:01:59 CHECK IN',
                      style: TextStyle(color: Colors.black)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    elevation: 0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
