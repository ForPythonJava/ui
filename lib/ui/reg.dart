import 'package:flutter/material.dart';
import 'package:registerpage/main.dart';
import 'package:registerpage/ui/login.dart';

class Log_in extends StatefulWidget {
  const Log_in({Key? key}) : super(key: key);

  @override
  State<Log_in> createState() => _Log_inState();
}

class _Log_inState extends State<Log_in> {
  bool _visible = true;
  final password_controller = TextEditingController();
  final CpassController = TextEditingController();
  final usernumber_controller = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool? newuser;

  @override

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    password_controller.dispose();
    nameController.dispose();
    usernumber_controller.dispose();
    super.dispose();
  }

  var name, email, pass, usernumber;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            body: SafeArea(
              child: ListView(children: [
                Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "SIGN UP",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        // Container(
                        //   padding: EdgeInsets.only(left: 30, right: 30),
                        //   child:
                        Form(
                          key: _formkey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 19),
                              Container(
                                padding: const EdgeInsets.only(left: 25, right: 25),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white24,
                                ),
                                child: TextFormField(
                                  controller: nameController,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.all(5),
                                      hintText: " Name",
                                      hintStyle: TextStyle(color: Colors.black),
                                      icon: Icon(
                                        Icons.person,
                                        color: Colors.black,
                                      )),
                                  validator: (valuename) {
                                    if (valuename!.isEmpty ||
                                        !RegExp(r'^[a-z A-Z]+$')
                                            .hasMatch(valuename)) {
                                      return 'Enter name';
                                    }
                                    return null;
                                  },
                                  onSaved: (value1) {
                                    name = value1!;
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const SizedBox(height: 10),
                              Container(
                                padding: const EdgeInsets.only(left: 25, right: 25),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white24,
                                ),
                                child: TextFormField(
                                  controller: usernumber_controller,
                                  keyboardType: TextInputType.phone,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.all(5),
                                      hintText: "Phone number",
                                      hintStyle: TextStyle(color: Colors.black),
                                      icon: Icon(
                                        Icons.phone,
                                        color: Colors.black,
                                      )),
                                  validator: (valuephone) {
                                    if (valuephone!.isEmpty) {
                                      return 'Enter  number';
                                    }
                                    if (valuephone.length < 10) {
                                      return 'Number minimum length is 10';
                                    }
                                    if (valuephone.length > 10) {
                                      return 'The number must be 10 digit';
                                    }
                                    if (RegExp(r'^[6789]\d{9}$')
                                        .hasMatch(valuephone)) {
                                      return null;
                                    } else {
                                      return 'Valid numbers only';
                                    }
                                  },
                                  onSaved: (value1) {
                                    usernumber = int.parse(value1!);
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 25, right: 25),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white24,
                                ),
                                child: TextFormField(
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.all(5),
                                      hintText: "Email",
                                      hintStyle: TextStyle(color: Colors.black),
                                      icon: Icon(
                                        Icons.email,
                                        color: Colors.black,
                                      )),
                                  validator: (valuemail) {
                                    if (valuemail!.isEmpty) {
                                      return ' Enter your email ';
                                    }
                                    if (!RegExp(
                                        r"^[a-z]+[0-9]+(?!.*(?:\+{2,}|\-{2,}|\.{2, }))(?:[\.+\-]{0,1}[a-z0-9])*@gmail.com$")
                                        .hasMatch(valuemail)) {
                                      return 'Invalid email';
                                    }
                                    return null;
                                  },
                                  onSaved: (value1) {
                                    email = value1!;
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 25, right: 25),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white24,
                                ),
                                child:
                                TextFormField(
                                  controller: password_controller,
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: _visible,
                                  decoration: InputDecoration(
                                      suffixIcon: GestureDetector(
                                          onTap: () {
                                            show();
                                          },
                                          child: const Icon(
                                            Icons.visibility,
                                            color: Colors.black,
                                          )),
                                      hintStyle: const TextStyle(color: Colors.black),
                                      border: InputBorder.none,
                                      contentPadding: const EdgeInsets.all(10),
                                      hintText: "Password",
                                      icon: const Icon(
                                        Icons.lock_outline,
                                        color: Colors.black,
                                      )),
                                  validator: (valuepassword) {
                                    if (valuepassword!.isEmpty) {
                                      return 'Enter your password';
                                    }
                                    if (valuepassword.length < 6) {
                                      return 'Password must be more than 6 Letters';
                                    }
                                    if (valuepassword.length > 12) {
                                      return 'Password must not be more than 12 Letters';
                                    }
                                    if (RegExp(
                                        r'^(?=^.{6,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$')
                                        .hasMatch(valuepassword)) {
                                      return null;
                                    } else {
                                      return "Password should Contain at least 1 symbol,Uppercase or number";
                                    }
                                  },
                                  onSaved: (value1) {
                                    pass = value1!;
                                  },
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                padding: const EdgeInsets.only(left: 25, right: 25),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white24,
                                ),
                                child: TextFormField(
                                  controller: CpassController,
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: _visible,
                                  decoration: InputDecoration(
                                      suffixIcon: GestureDetector(
                                          onTap: () {
                                            show();
                                          },
                                          child: const Icon(
                                            Icons.visibility,
                                            color: Colors.black,
                                          )),
                                      hintStyle: const TextStyle(color: Colors.black),
                                      border: InputBorder.none,
                                      contentPadding: const EdgeInsets.all(10),
                                      hintText: "Confirm password",
                                      icon: const Icon(
                                        Icons.lock_outline,
                                        color: Colors.black,
                                      )),
                                  validator: (cpass) {
                                    if (cpass != password_controller.text) {
                                      return "password must match";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(),
                              SizedBox(
                                height: 50,
                                width: 150,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: const StadiumBorder()),
                                    onPressed: () {
                                      if (_formkey.currentState!.validate()) {
                                        String email = emailController.text;
                                        String name= nameController.text;
                                        String phone = usernumber_controller.text;
                                        String password = password_controller.text;
                                        if (email != '' && password != ''  && phone!='') {


                                        }
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => const MyHomePage(title: "")));
                                      }
                                    },
                                    child: const Text("Register")),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                padding: const EdgeInsets.only(right: 20),
                                alignment: Alignment.bottomRight,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (_) => const Log()));
                                  },
                                  child: const Text(
                                    "Already have a account, LOG IN ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //  ),
                      ],
                    ),
                  ],
                ),
              ]),
            )));
  }

  void show() {
    setState(() {
      _visible = !_visible;
    });
  }
}