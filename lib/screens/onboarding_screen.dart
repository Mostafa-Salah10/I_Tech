import 'package:flutter/material.dart';
import 'package:i_tech/models/onboarding_model.dart';
import 'package:i_tech/widgets/onboarding_button.dart';
import 'package:i_tech/widgets/onboarding_page_view.dart';
import 'package:i_tech/widgets/onboarding_skip_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;

  final ValueNotifier<int> _currentPage = ValueNotifier(0);

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _currentPage.value = 0;

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: true,
        top: false,
        child: Column(
          children: [
            Expanded(
              child: OnboardingPageView(pageController: _pageController),
            ),

            ValueListenableBuilder(
              valueListenable: _currentPage,
              builder: (context, value, child) {
                return OnboardingButton(
                  onNext: () {
                    if (!_isLastPage()) {
                      _currentPage.value++;
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 700),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      ///navigate to login page
                    }
                  },
                  title: _isLastPage() ? "Get Started" : "Next",
                );
              },
            ),
            const SizedBox(height: 15),
            ValueListenableBuilder(
              valueListenable: _currentPage,
              builder: (context, value, child) {
                return Visibility(
                  visible: _isLastPage() ? false : true,
                  child: SkipButton(
                    onSkip: () {
                      _currentPage.value =
                          OnboardingModel.onboardingData.length - 1;
                      _pageController.animateToPage(
                        OnboardingModel.onboardingData.length - 1,
                        duration: Duration(milliseconds: 700),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  bool _isLastPage() {
    return _currentPage.value == OnboardingModel.onboardingData.length - 1;
  }
}
