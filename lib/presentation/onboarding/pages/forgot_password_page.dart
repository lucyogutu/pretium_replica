import 'package:flutter/material.dart';
import 'package:pretium_replica/domain/value_objects/app_strings.dart';
import 'package:pretium_replica/domain/value_objects/regex.dart';
import 'package:pretium_replica/domain/value_objects/spaces.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String emailValue = '';

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
                forgotPassword,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              mediumVerticalSizedBox,
              Text(
                forgotPasswordPageDescription,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.grey[600]),
              ),
              largeVerticalSizedBox,
              Form(
                key: _formKey,
                child: TextFormField(
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
                    if (!emailRegex.hasMatch(value!) || value.isEmpty) {
                      return pleaseEnterAValidEmailAddress;
                    }
                    return null;
                  },
                ),
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
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('Sending Reset Code to Email: $emailValue'),
                        ),
                      );
                    }
                  },
                  child: Text(
                    sendResetCode,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
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
