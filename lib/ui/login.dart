import 'package:flutter/material.dart';
import 'package:registerpage/main.dart';

import 'Button.dart';

class Log extends StatefulWidget {
  const Log({Key? key}) : super(key: key);

  @override
  _LogState createState() => _LogState();
}

class _LogState extends State<Log> {
  bool checkedValue = false;
  bool register = true;
  List textfieldsStrings = [
    "", //firstName
    "", //lastName
    "", //email
    "", //password
    "", //confirmPassword
    "", //phone
  ];

  final _firstnamekey = GlobalKey<FormState>();
  final _lastNamekey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  final _confirmPasswordKey = GlobalKey<FormState>();
  final _phonekey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      body: Center(
        child: Container(
          height: size.height,
          width: size.height,
          decoration: BoxDecoration(
            color: isDarkMode ? const Color(0xff151f2c) : Colors.white,
          ),
          child: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.02),
                        child: Align(
                          child: Text(
                            '',
                            style: TextStyle(
                              color: isDarkMode
                                  ? Colors.white
                                  : const Color(0xff1D1617),
                              fontSize: size.height * 0.02,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.015),
                        child: Align(
                          child: register
                              ? Text(
                                  'Create an Account',
                                  style: TextStyle(
                                    color: isDarkMode
                                        ? Colors.white
                                        : const Color(0xff1D1617),
                                    fontSize: size.height * 0.025,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : Text(
                                  '',
                                  style: TextStyle(
                                    color: isDarkMode
                                        ? Colors.white
                                        : const Color(0xff1D1617),
                                    fontSize: size.height * 0.025,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.01),
                      ),
                      register
                          ? buildTextField(
                              "First Name",
                              Icons.person_outlined,
                              false,
                              size,
                              (valuename) {
                                if (valuename!.isEmpty ||
                                    !RegExp(r'^[a-z A-Z]+$')
                                        .hasMatch(valuename)) {
                                  return 'Invalid name';
                                }
                                return null;
                              },
                              _firstnamekey,
                              0,
                              isDarkMode,
                            )
                          : Container(),
                      register
                          ? buildTextField(
                              "Last Name",
                              Icons.person_outlined,
                              false,
                              size,
                              (valuesurname) {
                                if (valuesurname!.isEmpty ||
                                    !RegExp(r'^[a-z A-Z]+$')
                                        .hasMatch(valuesurname)) {
                                  return 'Invalid last name';
                                }
                                return null;
                              },
                              _lastNamekey,
                              1,
                              isDarkMode,
                            )
                          : Container(),
                      Form(
                        child: buildTextField(
                          "Email",
                          Icons.email_outlined,
                          false,
                          size,
                          (valuemail) {
                            if (valuemail.length < 5) {
                              return 'Invalid last name';
                            }
                            if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
                                .hasMatch(valuemail)) {
                              return 'Invalid email';
                            }
                            return null;
                          },
                          _emailKey,
                          2,
                          isDarkMode,
                        ),
                      ),
                      Form(
                        //   keyboardType: TextInputType.number,
                        child: buildTextField(
                          "Phone Number",
                          Icons.phone,
                          false,
                          size,
                          (valuephone) {
                            if (valuephone!.isEmpty) {
                              return 'Enter valid number';
                            }
                            if (valuephone.length < 10) {
                              return 'password minimum length is 10';
                            }
                            if (valuephone.length > 13) {
                              return 'The number must be 10 digit';
                            }
                            if (RegExp(r'^[/^[\+\d{1,3}[-]?].?\d{10}$/]+$')
                                .hasMatch(valuephone)) {
                              return null;
                            } else {
                              return 'Numbers only';
                            }
                          },
                          _phonekey,
                          3,
                          isDarkMode,
                        ),
                      ),
                      Form(
                        child: buildTextField(
                          "Passsword",
                          Icons.lock_outline,
                          true,
                          size,
                          (valuepassword) {
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
                              return "Passsword should Contain atleast 1 symbol,Uppercase or number";
                            }
                          },
                          _passwordKey,
                          4,
                          isDarkMode,
                        ),
                      ),
                      Form(
                        child: register
                            ? buildTextField(
                                "Confirm Passsword",
                                Icons.lock_outline,
                                true,
                                size,
                                (valuepassword) {
                                  if (valuepassword != textfieldsStrings[3]) {
                                    return 'passwords must match';
                                  }
                                  return null;
                                },
                                _confirmPasswordKey,
                                5,
                                isDarkMode,
                              )
                            : Container(),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.015,
                          vertical: size.height * 0.025,
                        ),
                        child: register
                            ? CheckboxListTile(
                                title: RichText(
                                  textAlign: TextAlign.left,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            "By creating an account, you agree to our ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: size.height * 0.015,
                                        ),
                                      ),
                                      WidgetSpan(
                                        child: InkWell(
                                          onTap: () {
                                            print('Conditions of Use');
                                          },
                                          child: Text(
                                            "Conditions of Use",
                                            style: TextStyle(
                                              color: const Color(0xff070606),
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: size.height * 0.015,
                                            ),
                                          ),
                                        ),
                                      ),
                                      TextSpan(
                                        text: " and ",
                                        style: TextStyle(
                                          color: const Color(0xff070606),
                                          fontSize: size.height * 0.015,
                                        ),
                                      ),
                                      WidgetSpan(
                                        child: InkWell(
                                          onTap: () {
                                            print('Privacy Notice');
                                          },
                                          child: Text(
                                            "Privacy Notice",
                                            style: TextStyle(
                                              color: const Color(0xff181414),
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: size.height * 0.015,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                activeColor: Colors.black,
                                value: checkedValue,
                                onChanged: (newValue) {
                                  setState(() {
                                    checkedValue = newValue!;
                                  });
                                },
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                              )
                            : InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MyHomePage(title: "")),
                                  );
                                },
                                child: Text(
                                  "Forgot your password?",
                                  style: TextStyle(
                                    color: const Color(0xff211f20),
                                    decoration: TextDecoration.underline,
                                    fontSize: size.height * 0.02,
                                  ),
                                ),
                              ),
                      ),
                      AnimatedPadding(
                        duration: const Duration(milliseconds: 500),
                        padding: register
                            ? EdgeInsets.only(top: size.height * 0.025)
                            : EdgeInsets.only(top: size.height * 0.085),
                        child: ButtonWidget(
                          text: register ? "Register" : "Login",
                          backColor: isDarkMode
                              ? [
                                  Colors.black,
                                  Colors.black,
                                ]
                              : const [Color(0xff8694c18), Color(0xff000203)],
                          textColor: const [
                            Colors.white,
                            Colors.white,
                          ],
                          onPressed: () async {
                            if (register) {
                              //validation for register
                              if (_firstnamekey.currentState!.validate()) {
                                if (_lastNamekey.currentState!.validate()) {
                                  if (_emailKey.currentState!.validate()) {
                                    if (_phonekey.currentState!.validate()) {
                                      if (_passwordKey.currentState!
                                          .validate()) {
                                        if (_confirmPasswordKey.currentState!
                                            .validate()) {
                                          if (checkedValue == false) {
                                            buildSnackError(
                                                'Accept our Privacy Policy and Term Of Use',
                                                context,
                                                size);
                                          } else {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const MyHomePage(
                                                            title: "")));
                                            print('register');
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            } else {
                              if (_emailKey.currentState!.validate()) {
                                if (_passwordKey.currentState!.validate()) {
                                  print('login');
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MyHomePage(title: "")));
                                }
                              }
                            }
                          },
                        ),
                      ),
                      AnimatedPadding(
                        duration: const Duration(milliseconds: 500),
                        padding: EdgeInsets.only(
                          top: register
                              ? size.height * 0.025
                              : size.height * 0.15,
                        ),
                        child: Row(
                          //TODO: replace text logo with your logo
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'LOGIN',
                              style: TextStyle(
                                color: isDarkMode ? Colors.white : Colors.black,
                                fontSize: size.height * 0.023,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: register
                                  ? "Already have an account? "
                                  : "Don’t have an account yet? ",
                              style: TextStyle(
                                color: isDarkMode
                                    ? Colors.white
                                    : const Color(0xff1D1617),
                                fontSize: size.height * 0.018,
                              ),
                            ),
                            WidgetSpan(
                              child: InkWell(
                                onTap: () => setState(() {
                                  if (register) {
                                    register = false;
                                  } else {
                                    register = true;
                                  }
                                }),
                                child: register
                                    ? Text(
                                        "Login",
                                        style: TextStyle(
                                          foreground: Paint()
                                            ..shader = const LinearGradient(
                                              colors: <Color>[
                                                Colors.black,
                                                Colors.black,
                                              ],
                                            ).createShader(
                                              const Rect.fromLTWH(
                                                0.0,
                                                0.0,
                                                200.0,
                                                70.0,
                                              ),
                                            ),
                                          fontSize: size.height * 0.018,
                                        ),
                                      )
                                    : Text(
                                        "Register",
                                        style: TextStyle(
                                          foreground: Paint()
                                            ..shader = const LinearGradient(
                                              colors: <Color>[
                                                Color(0xff030303),
                                                Color(0xff030303),
                                              ],
                                            ).createShader(
                                              const Rect.fromLTWH(
                                                  0.0, 0.0, 200.0, 70.0),
                                            ),
                                          fontSize: size.height * 0.018,
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const MyHomePage(title: "");
                            },
                          ),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'Sign in with Google',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white24,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
                const Padding(padding: EdgeInsets.all(40))
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool pwVisible = false;

  Widget buildTextField(
    String hintText,
    IconData icon,
    bool password,
    size,
    FormFieldValidator validator,
    Key key,
    int stringToEdit,
    bool isDarkMode,
  ) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.025),
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.05,
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.black : const Color(0xffF7F8F8),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Form(
          key: key,
          child: TextFormField(
            style: TextStyle(
                color: isDarkMode ? const Color(0xffADA4A5) : Colors.black),
            onChanged: (value) {
              setState(() {
                textfieldsStrings[stringToEdit] = value;
              });
            },
            validator: validator,
            textInputAction: TextInputAction.next,
            obscureText: password ? !pwVisible : false,
            decoration: InputDecoration(
              errorStyle: const TextStyle(height: 0),
              hintStyle: const TextStyle(
                color: Color(0xffADA4A5),
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(
                top: size.height * 0.012,
              ),
              hintText: hintText,
              prefixIcon: Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.005,
                ),
                child: Icon(
                  icon,
                  color: const Color(0xff7B6F72),
                ),
              ),
              suffixIcon: password
                  ? Padding(
                      padding: EdgeInsets.only(
                        top: size.height * 0.005,
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            pwVisible = !pwVisible;
                          });
                        },
                        child: pwVisible
                            ? const Icon(
                                Icons.visibility_off_outlined,
                                color: Color(0xff1a1819),
                              )
                            : const Icon(
                                Icons.visibility_outlined,
                                color: Color(0xff1a1819),
                              ),
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildSnackError(
      String error, context, size) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.black,
        content: SizedBox(
          height: size.height * 0.02,
          child: Center(
            child: Text(error),
          ),
        ),
      ),
    );
  }
}
