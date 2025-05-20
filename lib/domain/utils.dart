import 'package:flutter/material.dart';
import 'package:pretium_replica/domain/entities/onboarding_data.dart';
import 'package:pretium_replica/domain/value_objects/app_strings.dart';

List<OnboardingData> onboardingData = <OnboardingData>[
  OnboardingData(
    icon: Icons.credit_card_rounded,
    title: pageOneTitle,
    description: pageOneDescription,
  ),
  OnboardingData(
    icon: Icons.account_balance_wallet,
    title: pageTwoTitle,
    description: pageTwoDescription,
  ),
  OnboardingData(
    icon: Icons.receipt_long_rounded,
    title: pageThreeTitle,
    description: pageThreeDescription,
  ),
];
