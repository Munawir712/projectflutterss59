import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_ss59/page/custom_textfiled.dart';
import 'package:project_ss59/page/login_page.dart';
import 'package:project_ss59/page/utils.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController telpController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confpassController = TextEditingController();

  void addRegister() async {
    var body = {
      "username": usernameController.text,
      "nama": namaController.text,
      "telp": telpController.text,
      "email": emailController.text,
      "alamat": alamatController.text,
      "psw": passController.text,
    };
    var url = Uri.parse("$baseUrl/insert_user.php");
    var response = await http.post(url, body: body);
    var result = jsonDecode(response.body);
    debugPrint(result.toString());
    bool isError = result['isError'];
    String message = result['message'];

    if (isError == false) {
      if (!mounted) return;
      dialogInformation(
        context,
        title: "Pesan",
        contentText: "Yey berhasil registrasi account",
        onConfirm: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        },
      );
      clearForm();
    } else {
      debugPrint(result.toString());
    }
  }

  clearForm() {
    usernameController.clear();
    namaController.clear();
    telpController.clear();
    alamatController.clear();
    passController.clear();
    confpassController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20.0),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: const EdgeInsets.only(left: 16),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: const Color(0xFF6F35A5),
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      )),
                  const SizedBox(height: 50.0),
                  const Text(
                    "REGISTER",
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
                              CustomTextFiled(
                                labelText: "Username",
                                hintText: 'Your username',
                                controller: usernameController,
                                iconPrefix: const Icon(
                                  Icons.person,
                                ),
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              CustomTextFiled(
                                labelText: "Email",
                                hintText: 'Your Email',
                                controller: emailController,
                                iconPrefix: const Icon(
                                  Icons.mail,
                                ),
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              CustomTextFiled(
                                labelText: "Fullname",
                                hintText: 'Your fullname',
                                controller: namaController,
                                iconPrefix: const Icon(
                                  Icons.person,
                                ),
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              CustomTextFiled(
                                labelText: "Telp",
                                hintText: 'Your Phone',
                                controller: telpController,
                                keyboardType: TextInputType.phone,
                                iconPrefix: const Icon(
                                  Icons.phone,
                                ),
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              CustomTextFiled(
                                labelText: "Alamat",
                                hintText: 'Your Address',
                                controller: alamatController,
                                iconPrefix: const Icon(
                                  Icons.location_on,
                                ),
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              CustomTextFiled(
                                labelText: "Password",
                                hintText: 'Your password',
                                controller: passController,
                                obscureText: true,
                                iconPrefix: const Icon(
                                  Icons.lock,
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              CustomTextFiled(
                                labelText: "Confirm Password",
                                hintText: 'Your Confirm password',
                                controller: confpassController,
                                obscureText: true,
                                iconPrefix: const Icon(
                                  Icons.lock,
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
                                        contentText:
                                            "Username tidak boleh kosong",
                                      );
                                    } else if (emailController.text.isEmpty) {
                                      dialogInformation(
                                        context,
                                        contentText: "Email tidak boleh kosong",
                                      );
                                    } else if (namaController.text.isEmpty) {
                                      dialogInformation(
                                        context,
                                        contentText:
                                            "Fullname tidak boleh kosong",
                                      );
                                    } else if (telpController.text.isEmpty) {
                                      dialogInformation(
                                        context,
                                        contentText: "Telp tidak boleh kosong",
                                      );
                                    } else if (alamatController.text.isEmpty) {
                                      dialogInformation(
                                        context,
                                        contentText:
                                            "Alamat tidak boleh kosong",
                                      );
                                    } else if (passController.text.isEmpty) {
                                      dialogInformation(
                                        context,
                                        contentText:
                                            "Password tidak boleh kosong",
                                      );
                                    } else if (passController.text !=
                                        confpassController.text) {
                                      dialogInformation(
                                        context,
                                        contentText:
                                            "Confirm Password tidak sama dengan Password",
                                      );
                                    } else {
                                      addRegister();
                                    }
                                  },
                                  child: Text(
                                    "REGISTER".toUpperCase(),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16.0),
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
        ),
      ),
    );
  }
}
