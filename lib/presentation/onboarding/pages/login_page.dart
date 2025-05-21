import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pretium_replica/domain/value_objects/app_strings.dart';
import 'package:pretium_replica/domain/value_objects/regex.dart';
import 'package:pretium_replica/domain/value_objects/spaces.dart';
import 'package:pretium_replica/presentation/routing/route_names.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  bool rememberMe = false;
  bool showPassword = false;
  String emailValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              largeVerticalSizedBox,
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Theme.of(context)
                        .colorScheme
                        .primary
                        .withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(15.0),
                child: Icon(
                  Icons.account_balance_wallet,
                  size: 30,
                ),
              ),
              largeVerticalSizedBox,
              Text(
                welcomeBack,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              mediumVerticalSizedBox,
              Text(
                signInToContinue,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600, color: Colors.grey[600]),
              ),
              largeVerticalSizedBox,
              Form(
                key: _loginFormKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.grey[350]!,
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.mail_outline_rounded,
                          color: Colors.grey[800],
                        ),
                        label: Text(email),
                        hintText: enterYourEmail,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (String value) {
                        setState(() {
                          emailValue = value;
                        });
                      },
                      validator: (String? value) {
                        if (value?.isEmpty ?? false) {
                          return '$pleaseEnterYour $email';
                        } else if (!emailRegex.hasMatch(value!)) {
                          return pleaseEnterAValidEmailAddress;
                        }
                        return null;
                      },
                    ),
                    size24VerticalSizedBox,
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.grey[350]!,
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.lock_outline_rounded,
                          color: Colors.grey[800],
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            showPassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Colors.grey[800],
                          ),
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                        ),
                        label: Text(password),
                        hintText: enterYourPassword,
                      ),
                      validator: (String? value) {
                        if (value?.isEmpty ?? false) {
                          return '$pleaseEnterYour $password';
                        }
                        return null;
                      },
                    ),
                    mediumVerticalSizedBox,
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: rememberMe,
                    activeColor: Theme.of(context).primaryColor,
                    checkColor: Colors.white,
                    side: BorderSide(color: Colors.grey),
                    onChanged: (bool? value) async {
                      setState(() {
                        rememberMe = !rememberMe;
                      });
                    },
                  ),
                  verySmallHorizontalSizedBox,
                  Text(rememberMeString),
                  const Spacer(),
                  TextButton(
                    onPressed: () => context.push(forgotPasswordPage),
                    child: Text('$forgotPassword?'),
                  ),
                ],
              ),
              largeVerticalSizedBox,
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (_loginFormKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('Processing Data for Email: $emailValue'),
                        ),
                      );
                    }
                  },
                  child: Text(
                    login,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
              largeVerticalSizedBox,
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: <InlineSpan>[
                      TextSpan(
                          text: dontHaveAccount,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.grey)),
                      TextSpan(
                        text: signUp,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor,
                            ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => context.push(registerPage),
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
