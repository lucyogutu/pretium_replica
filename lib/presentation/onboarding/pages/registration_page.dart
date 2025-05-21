import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pretium_replica/domain/value_objects/app_strings.dart';
import 'package:pretium_replica/domain/value_objects/regex.dart';
import 'package:pretium_replica/domain/value_objects/spaces.dart';
import 'package:pretium_replica/presentation/routing/route_names.dart';
import 'package:url_launcher/url_launcher.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool showPassword = false;
  bool acceptTerms = false;
  String nameValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              mediumVerticalSizedBox,
              Text(
                createAccount,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              mediumVerticalSizedBox,
              Text(
                createAccountPageDescription,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.grey[600]),
              ),
              largeVerticalSizedBox,
              Form(
                key: _formKey,
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
                          Icons.person_outline_rounded,
                          color: Colors.grey[800],
                        ),
                        label: Text(firstName),
                        hintText: enterFirstName,
                      ),
                      keyboardType: TextInputType.name,
                      onChanged: (String value) {
                        setState(() {
                          nameValue = value;
                        });
                      },
                      validator: (String? value) {
                        if (value?.isEmpty ?? false) {
                          return '$pleaseEnterYour ${firstName.toLowerCase()}';
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
                          Icons.person_outline_rounded,
                          color: Colors.grey[800],
                        ),
                        label: Text(lastName),
                        hintText: enterLastName,
                      ),
                      keyboardType: TextInputType.name,
                      validator: (String? value) {
                        if (value?.isEmpty ?? false) {
                          return '$pleaseEnterYour ${lastName.toLowerCase()}';
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
                          Icons.mail_outline_rounded,
                          color: Colors.grey[800],
                        ),
                        label: Text(email),
                        hintText: enterYourEmail,
                      ),
                      keyboardType: TextInputType.emailAddress,
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
                  ],
                ),
              ),
              mediumVerticalSizedBox,
              Row(
                children: <Widget>[
                  Checkbox(
                    value: acceptTerms,
                    activeColor: Theme.of(context).primaryColor,
                    checkColor: Colors.white,
                    side: BorderSide(color: Colors.grey),
                    onChanged: (bool? value) async {
                      setState(() {
                        acceptTerms = !acceptTerms;
                      });
                    },
                  ),
                  TextButton(
                    onPressed: () async {
                      final Uri termsUrl =
                          Uri.parse('https://pretium.africa/term-of-use');

                      if (await canLaunchUrl(termsUrl)) {
                        await launchUrl(termsUrl,
                            mode: LaunchMode.externalApplication);
                      } else {
                        if (!context.mounted) return;

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Could not open terms and conditions'),
                          ),
                        );
                      }
                    },
                    child: Text(
                      acceptTermsConditions,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            decoration: TextDecoration.underline,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ),
                ],
              ),
              mediumVerticalSizedBox,
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
                    if (_formKey.currentState!.validate() && acceptTerms) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Creating Account for: $nameValue'),
                        ),
                      );
                    } else if (!acceptTerms) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(agreeToTerms),
                        ),
                      );
                    }
                  },
                  child: Text(
                    createAccount,
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
                          text: alreadyHaveAnAccount,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.grey)),
                      TextSpan(
                        text: login,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor,
                            ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => context.pushReplacement(loginPage),
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
