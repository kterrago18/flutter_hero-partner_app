import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hero_partner_app/models/models.dart';
import 'package:flutter_hero_partner_app/res/res.dart';
import 'package:provider/provider.dart';

class CreateAccountScreen extends StatefulWidget {
  CreateAccountScreen({Key? key}) : super(key: key);

  static MaterialPage page() {
    return MaterialPage(
      name: HeroPartnerPages.createAccountPath,
      key: ValueKey(HeroPartnerPages.createAccountPath),
      child: CreateAccountScreen(),
    );
  }

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  late bool _checkboxChecked = false;

  final _passwordTextEditingController = TextEditingController();
  final _confirmPasswordTextEditingController = TextEditingController();
  final _emailTextEditingController = TextEditingController();
  final _phoneNumberEditingController = TextEditingController();

  @override
  void dispose() {
    _passwordTextEditingController.dispose();
    _emailTextEditingController.dispose();
    _confirmPasswordTextEditingController.dispose();
    _phoneNumberEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Provider.of<LoginStateManager>(context, listen: false)
                  .tapOnCreateAccount(false);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: PaddingSpacing.paddingAll8,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBoxSpacing.height16,
                    // buildText(label: 'Create an account'),
                    // buildText(label: 'and start hiring Heroes!'),
                    SizedBoxSpacing.height10,
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        filled: true,
                        hintText: 'First Name',
                        fillColor: Colors.white70,
                      ),
                      enableSuggestions: false,
                      autocorrect: false,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(50),
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        }

                        return null;
                      },
                    ),
                    SizedBoxSpacing.height10,
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        filled: true,
                        hintText: 'Last Name',
                        fillColor: Colors.white70,
                      ),
                      enableSuggestions: false,
                      autocorrect: false,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(50),
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        }

                        return null;
                      },
                    ),
                    SizedBoxSpacing.height10,
                    TextFormField(
                      controller: _phoneNumberEditingController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        filled: true,
                        hintText: 'Mobile Number',
                        fillColor: Colors.white70,
                      ),
                      enableSuggestions: false,
                      autocorrect: false,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(11),
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        }

                        if (value.length < 11) {
                          return "Must be 11 digits long.";
                        }

                        return null;
                      },
                    ),
                    SizedBoxSpacing.height10,
                    TextFormField(
                      controller: _emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        filled: true,
                        hintText: 'Email Address',
                        fillColor: Colors.white70,
                      ),
                      enableSuggestions: false,
                      autocorrect: false,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(50),
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        }

                        if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(
                          value.toLowerCase(),
                        )) {
                          return 'Invalid Email';
                        }

                        return null;
                      },
                    ),
                    SizedBoxSpacing.height10,
                    TextFormField(
                      controller: _passwordTextEditingController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        filled: true,
                        hintText: 'Password',
                        fillColor: Colors.white70,
                        // suffixIcon: IconButton(
                        //   icon: Icon(
                        //     // Based on passwordVisible state choose the icon
                        //     _passwordVisible
                        //         ? Icons.visibility
                        //         : Icons.visibility_off,
                        //   ),
                        //   onPressed: () {
                        //     // Update the state i.e. toogle the state of passwordVisible variable
                        //     setState(() {
                        //       _passwordVisible = !_passwordVisible;
                        //     });
                        //   },
                        // ),
                      ),
                      // obscureText: !_passwordVisible,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(8),
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        }

                        if (value.length < 8) {
                          return "Must be 8 digits long.";
                        }

                        return null;
                      },
                    ),
                    SizedBoxSpacing.height10,
                    TextFormField(
                      controller: _confirmPasswordTextEditingController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        filled: true,
                        hintText: 'Confirm Password',
                        fillColor: Colors.white70,
                      ),
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(8),
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        }
                        if (value.length < 8) {
                          return "Must be 8 digits long.";
                        }

                        return null;
                      },
                    ),
                    SizedBoxSpacing.height10,
                    // CheckboxFormField(
                    //     title: RichText(
                    //       textAlign: TextAlign.center,
                    //       text: TextSpan(
                    //         text: 'I have read and agree to the ',
                    //         style: const TextStyle(color: Colors.black),
                    //         children: [
                    //           TextSpan(
                    //             text: 'Terms & Conditions',
                    //             style: const TextStyle(
                    //                 fontWeight: FontWeight.bold,
                    //                 color: kPrimaryColor),
                    //             recognizer: TapGestureRecognizer()
                    //               ..onTap = () {
                    //                 _displayDialog(context);
                    //               },
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //     validator: (value) {
                    //       if (!value!) {
                    //         return 'This field is requried';
                    //       }
                    //       return null;
                    //     }),
                    Row(
                      children: [
                        Checkbox(
                          value: _checkboxChecked,
                          onChanged: (value) {
                            setState(() {
                              _checkboxChecked = value!;
                            });
                          },
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'I have read and agree to the ',
                            style: const TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: 'Terms & Conditions',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: kPrimaryColor),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    _displayDialog(context);
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    _buildButton(context, _emailTextEditingController,
                        _phoneNumberEditingController),
                    SizedBoxSpacing.height16,
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: const TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'Login',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Provider.of<LoginStateManager>(context,
                                        listen: false)
                                    .tapOnCreateAccount(false);
                              },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  SizedBox _buildButton(BuildContext context, TextEditingController email,
      TextEditingController phoneNumber) {
    return SizedBox(
      height: 55,
      child: MaterialButton(
        color: kPrimaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: const Text(
          'Sign Up',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () async {
          final appStateManager =
              Provider.of<AppStateManager>(context, listen: false);

          if (_formKey.currentState!.validate()) {
            await appStateManager.verifyEmailExistence(email.text);
            await appStateManager.verifyPhoneNumberExistence(phoneNumber.text);
            if (_passwordTextEditingController.text !=
                _confirmPasswordTextEditingController.text) {
              ScaffoldMessenger.of(context).showSnackBar(
                setSnackBarContent(
                    'New Password and Confirm Password do not match'),
              );
              return;
            }
            if (!_checkboxChecked) {
              ScaffoldMessenger.of(context).showSnackBar(
                setSnackBarContent(
                    'Please indicate that you accept the Terms and Conditions'),
              );
              return;
            }
            print('## email exist: ${appStateManager.isEmailExist}');
            print('## phone exist: ${appStateManager.isPhoneNumberExist}');

            if (appStateManager.isPhoneNumberExist) {
              ScaffoldMessenger.of(context).showSnackBar(
                setSnackBarContent('Phone Number already existing.'),
              );
              return;
            }
            if (appStateManager.isEmailExist) {
              ScaffoldMessenger.of(context).showSnackBar(
                setSnackBarContent('Email Address already existing.'),
              );
              return;
            }

            print('Successfull');
            return;
          } else {
            print("UnSuccessfull");
          }
        },
      ),
    );
  }

  Widget buildText({required String label}) {
    return Text(
      label,
      textAlign: TextAlign.center,
    );
  }

  SnackBar setSnackBarContent(String content) {
    return SnackBar(content: Text(content));
  }

  _displayDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text('Terms & Conditions'),
          content: SingleChildScrollView(
            child: Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
              style: TextStyle(fontSize: 20.0),
            ),
          ),

          // children: [
          //   SimpleDialogOption(
          //     onPressed: () {
          //       Navigator.pop(context, "Pizza");
          //     },
          //     child: const Text('Pizza'),
          //   ),
          //   SimpleDialogOption(
          //     onPressed: () {
          //       Navigator.pop(context, "Burger");
          //     },
          //     child: const Text('Burger'),
          //   ),
          // ],
          elevation: 10,
          //backgroundColor: Colors.green,
        );
      },
    );
  }
}
