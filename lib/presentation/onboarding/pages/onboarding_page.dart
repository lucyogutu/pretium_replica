import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pretium_replica/domain/entities/onboarding_data.dart';
import 'package:pretium_replica/domain/utils.dart';
import 'package:pretium_replica/domain/value_objects/app_strings.dart';
import 'package:pretium_replica/domain/value_objects/spaces.dart';
import 'package:pretium_replica/presentation/routing/route_names.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                right: 0,
                child: TextButton(
                  onPressed: () => context.go(loginPage),
                  child: Text(
                    skip,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[600],
                        ),
                  ),
                ),
              ),
              PageView.builder(
                controller: _pageController,
                itemCount: onboardingData.length,
                onPageChanged: (int index) {
                  setState(() {
                    onLastPage = (index == onboardingData.length - 1);
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  final OnboardingData pageData = onboardingData[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context)
                              .primaryColor
                              .withValues(alpha: 0.15),
                        ),
                        padding: const EdgeInsets.all(18.0),
                        child: Icon(
                          pageData.icon,
                          size: 50,
                        ),
                      ),
                      largeVerticalSizedBox,
                      Text(
                        pageData.title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      mediumVerticalSizedBox,
                      Text(
                        pageData.description,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Colors.grey[600]),
                      ),
                      const Spacer(),
                    ],
                  );
                },
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: <Widget>[
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: onboardingData.length,
                      effect: ExpandingDotsEffect(
                        dotWidth: 8,
                        dotHeight: 8,
                        dotColor: Theme.of(context)
                            .colorScheme
                            .primary
                            .withValues(alpha: 0.2),
                        activeDotColor: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    mediumVerticalSizedBox,
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () => onLastPage
                            ? context.go(loginPage)
                            : _pageController.nextPage(
                                duration: const Duration(
                                  milliseconds: 500,
                                ),
                                curve: Curves.easeIn,
                              ),
                        style: ButtonStyle(
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        child: Text(
                          onLastPage ? getStarted : next,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
