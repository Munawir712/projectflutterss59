import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_ss59/page/home_page.dart';
import 'package:project_ss59/page/register_page.dart';
import 'package:project_ss59/page/utils.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool isLoading = false;

  void login() async {
    setState(() {
      isLoading = true;
    });
    var body = {
      "username": usernameController.text,
      "psw": passController.text,
    };
    var url = Uri.parse("$baseUrl/login_user.php");
    var response = await http.post(url, body: body);
    var result = jsonDecode(response.body);
    debugPrint(result.toString());
    bool isError = result['isError'];
    String message = result['message'];

    if (isError == false) {
      if (!mounted) return;
      setState(() {
        isLoading = false;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      debugPrint(result.toString());
      if (!mounted) return;
      dialogInformation(
        context,
        title: "Pesan",
        contentText: message,
      );
    }
    clearForm();
  }

  clearForm() {
    usernameController.clear();
    passController.clear();
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "LOGIN",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16.0 * 2),
                      Row(
                        children: [
                          const Spacer(),
                          Expanded(
                            flex: 8,
                            child: Form(
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: usernameController,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    cursorColor: const Color(0xFF6F35A5),
                                    onSaved: (email) {},
                                    decoration: const InputDecoration(
                                      hintText: "Username",
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Icon(Icons.person),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: TextFormField(
                                      controller: passController,
                                      textInputAction: TextInputAction.done,
                                      obscureText: true,
                                      cursorColor: const Color(0xFF6F35A5),
                                      decoration: const InputDecoration(
                                        hintText: "Your password",
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Icon(Icons.lock),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  Hero(
                                    tag: "login_btn",
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (usernameController.text.isEmpty) {
                                          dialogInformation(
                                            context,
                                            contentText: "Username harus diisi",
                                          );
                                        } else if (passController
                                            .text.isEmpty) {
                                          dialogInformation(
                                            context,
                                            contentText: "Password harus diisi",
                                          );
                                        } else {
                                          login();
                                        }
                                      },
                                      child: Text(
                                        "Login".toUpperCase(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      const Text(
                                        "Don’t have an Account ? ",
                                        style:
                                            TextStyle(color: Color(0xFF6F35A5)),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return Container();
                                              },
                                            ),
                                          );
                                        },
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const RegisterPage()),
                                            );
                                          },
                                          child: const Text(
                                            "Sign Up",
                                            style: TextStyle(
                                              color: Color(0xFF6F35A5),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
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
