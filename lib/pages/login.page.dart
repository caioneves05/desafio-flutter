import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool visibilityPassword = false;
  bool visibilityRememberAutent = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 242, 242, 242),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    style: new TextStyle(color: Colors.black, fontSize: 20),
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
                    keyboardType: TextInputType.visiblePassword,
                    style: new TextStyle(color: Colors.black, fontSize: 20),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                              BorderSide(color: Colors.black, width: 1.0)
                      ),
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
                    child: Row(children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            visibilityRememberAutent = !visibilityRememberAutent;
                          });
                        },
                        icon: Icon(
                          visibilityRememberAutent ? Icons.check_box : Icons.check,
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
                    ]),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('LOGIN', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 59, 59, 59),
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
                  )
                ]),
          ),
        ));
  }
}
